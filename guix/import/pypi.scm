;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2014 David Thompson <davet@gnu.org>
;;; Copyright © 2015 Cyril Roelandt <tipecaml@gmail.com>
;;; Copyright © 2015, 2016, 2017 Ludovic Courtès <ludo@gnu.org>
;;; Copyright © 2017 Mathieu Othacehe <m.othacehe@gmail.com>
;;; Copyright © 2018 Ricardo Wurmus <rekado@elephly.net>
;;;
;;; This file is part of GNU Guix.
;;;
;;; GNU Guix is free software; you can redistribute it and/or modify it
;;; under the terms of the GNU General Public License as published by
;;; the Free Software Foundation; either version 3 of the License, or (at
;;; your option) any later version.
;;;
;;; GNU Guix is distributed in the hope that it will be useful, but
;;; WITHOUT ANY WARRANTY; without even the implied warranty of
;;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;; GNU General Public License for more details.
;;;
;;; You should have received a copy of the GNU General Public License
;;; along with GNU Guix.  If not, see <http://www.gnu.org/licenses/>.

(define-module (guix import pypi)
  #:use-module (ice-9 binary-ports)
  #:use-module (ice-9 match)
  #:use-module (ice-9 pretty-print)
  #:use-module (ice-9 regex)
  #:use-module (ice-9 receive)
  #:use-module ((ice-9 rdelim) #:select (read-line))
  #:use-module (srfi srfi-1)
  #:use-module (srfi srfi-26)
  #:use-module (srfi srfi-34)
  #:use-module (srfi srfi-35)
  #:use-module (rnrs bytevectors)
  #:use-module (json)
  #:use-module (web uri)
  #:use-module (guix ui)
  #:use-module (guix utils)
  #:use-module ((guix build utils)
                #:select ((package-name->name+version
                           . hyphen-package-name->name+version)
                          find-files))
  #:use-module (guix import utils)
  #:use-module ((guix download) #:prefix download:)
  #:use-module (guix import json)
  #:use-module (guix packages)
  #:use-module (guix upstream)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix build-system python)
  #:export (guix-package->pypi-name
            pypi-recursive-import
            pypi->guix-package
            %pypi-updater))

(define (pypi-fetch name)
  "Return an alist representation of the PyPI metadata for the package NAME,
or #f on failure."
  (json-fetch-alist (string-append "https://pypi.org/pypi/" name "/json")))

;; For packages found on PyPI that lack a source distribution.
(define-condition-type &missing-source-error &error
  missing-source-error?
  (package  missing-source-error-package))

(define (latest-source-release pypi-package)
  "Return the latest source release for PYPI-PACKAGE."
  (let ((releases (assoc-ref* pypi-package "releases"
                              (assoc-ref* pypi-package "info" "version"))))
    (or (find (lambda (release)
                (string=? "sdist" (assoc-ref release "packagetype")))
              releases)
        (raise (condition (&missing-source-error
                           (package pypi-package)))))))

(define (latest-wheel-release pypi-package)
  "Return the url of the wheel for the latest release of pypi-package,
or #f if there isn't any."
  (let ((releases (assoc-ref* pypi-package "releases"
                              (assoc-ref* pypi-package "info" "version"))))
    (or (find (lambda (release)
                (string=? "bdist_wheel" (assoc-ref release "packagetype")))
              releases)
        #f)))

(define (python->package-name name)
  "Given the NAME of a package on PyPI, return a Guix-compliant name for the
package."
  (if (string-prefix? "python-" name)
      (snake-case name)
      (string-append "python-" (snake-case name))))

(define (guix-package->pypi-name package)
  "Given a Python PACKAGE built from pypi.org, return the name of the
package on PyPI."
  (define (url->pypi-name url)
    (hyphen-package-name->name+version
     (basename (file-sans-extension url))))

  (match (and=> (package-source package) origin-uri)
    ((? string? url)
     (url->pypi-name url))
    ((lst ...)
     (any url->pypi-name lst))
    (#f #f)))

(define (wheel-url->extracted-directory wheel-url)
  (match (string-split (basename wheel-url) #\-)
    ((name version _ ...)
     (string-append name "-" version ".dist-info"))))

(define (maybe-inputs package-inputs)
  "Given a list of PACKAGE-INPUTS, tries to generate the 'inputs' field of a
package definition."
  (match package-inputs
    (()
     '())
    ((package-inputs ...)
     `((propagated-inputs (,'quasiquote ,package-inputs))))))

(define (guess-requirements source-url wheel-url tarball)
  "Given SOURCE-URL, WHEEL-URL and a TARBALL of the package, return a list
of the required packages specified in the requirements.txt file.  TARBALL will
be extracted in a temporary directory."

  (define (tarball-directory url)
    ;; Given the URL of the package's tarball, return the name of the directory
    ;; that will be created upon decompressing it. If the filetype is not
    ;; supported, return #f.
    ;; TODO: Support more archive formats.
    (let ((basename (substring url (+ 1 (string-rindex url #\/)))))
      (cond
       ((string-suffix? ".tar.gz" basename)
        (string-drop-right basename 7))
       ((string-suffix? ".tar.bz2" basename)
        (string-drop-right basename 8))
       (else
        (begin
          (warning (G_ "Unsupported archive format: \
cannot determine package dependencies"))
          #f)))))

  (define (clean-requirement s)
    ;; Given a requirement LINE, as can be found in a Python requirements.txt
    ;; file, remove everything other than the actual name of the required
    ;; package, and return it.
    (string-take s
      (or (string-index s (lambda (chr) (member chr '(#\space #\> #\= #\<))))
          (string-length s))))

  (define (comment? line)
    ;; Return #t if the given LINE is a comment, #f otherwise.
    (eq? (string-ref (string-trim line) 0) #\#))

  (define (read-requirements requirements-file)
    ;; Given REQUIREMENTS-FILE, a Python requirements.txt file, return a list
    ;; of name/variable pairs describing the requirements.
    (call-with-input-file requirements-file
      (lambda (port)
        (let loop ((result '()))
          (let ((line (read-line port)))
            (if (eof-object? line)
                result
                (cond
                 ((or (string-null? line) (comment? line))
                  (loop result))
                 (else
                  (loop (cons (clean-requirement line)
                              result))))))))))

  (define (read-wheel-metadata wheel-archive)
    ;; Given WHEEL-ARCHIVE, a ZIP Python wheel archive, return the package's
    ;; requirements.
    (let* ((dirname (wheel-url->extracted-directory wheel-url))
           (json-file (string-append dirname "/metadata.json")))
      (and (zero? (system* "unzip" "-q" wheel-archive json-file))
           (dynamic-wind
             (const #t)
             (lambda ()
               (call-with-input-file json-file
                 (lambda (port)
                   (let* ((metadata (json->scm port))
                          (run_requires (hash-ref metadata "run_requires"))
                          (requirements (if run_requires
                                            (hash-ref (list-ref run_requires 0)
                                                       "requires")
                                            '())))
                     (map clean-requirement requirements)))))
             (lambda ()
               (delete-file json-file)
               (rmdir dirname))))))

  (define (guess-requirements-from-wheel)
    ;; Return the package's requirements using the wheel, or #f if an error
    ;; occurs.
    (call-with-temporary-output-file
     (lambda (temp port)
       (if wheel-url
         (and (url-fetch wheel-url temp)
              (read-wheel-metadata temp))
         #f))))

  (define (guess-requirements-from-source)
    ;; Return the package's requirements by guessing them from the source.
    (let ((dirname (tarball-directory source-url)))
      (if (string? dirname)
          (call-with-temporary-directory
           (lambda (dir)
             (let* ((pypi-name (string-take dirname (string-rindex dirname #\-)))
                    (req-files (list (string-append dirname "/requirements.txt")
                                     (string-append dirname "/" pypi-name ".egg-info"
                                                    "/requires.txt")))
                    (exit-codes (map (lambda (file-name)
                                       (parameterize ((current-error-port (%make-void-port "rw+"))
                                                      (current-output-port (%make-void-port "rw+")))
                                         (system* "tar" "xf" tarball "-C" dir file-name)))
                                     req-files)))
               ;; Only one of these files needs to exist.
               (if (any zero? exit-codes)
                   (match (find-files dir)
                     ((file . _)
                      (read-requirements file))
                     (()
                      (warning (G_ "No requirements file found.\n"))))
                   (begin
                     (warning (G_ "Failed to extract requirements files\n"))
                     '())))))
          '())))

  ;; First, try to compute the requirements using the wheel, since that is the
  ;; most reliable option. If a wheel is not provided for this package, try
  ;; getting them by reading either the "requirements.txt" file or the
  ;; "requires.txt" from the egg-info directory from the source tarball. Note
  ;; that "requirements.txt" is not mandatory, so this is likely to fail.
  (or (guess-requirements-from-wheel)
      (guess-requirements-from-source)))


(define (compute-inputs source-url wheel-url tarball)
  "Given the SOURCE-URL of an already downloaded TARBALL, return a list of
name/variable pairs describing the required inputs of this package.  Also
return the unaltered list of upstream dependency names."
  (let ((dependencies
         (remove (cut string=? "argparse" <>)
                 (guess-requirements source-url wheel-url tarball))))
    (values (sort
             (map (lambda (input)
                    (let ((guix-name (python->package-name input)))
                      (list guix-name (list 'unquote (string->symbol guix-name)))))
                  dependencies)
             (lambda args
               (match args
                 (((a _ ...) (b _ ...))
                  (string-ci<? a b)))))
            dependencies)))

(define (make-pypi-sexp name version source-url wheel-url home-page synopsis
                        description license)
  "Return the `package' s-expression for a python package with the given NAME,
VERSION, SOURCE-URL, HOME-PAGE, SYNOPSIS, DESCRIPTION, and LICENSE."
  (call-with-temporary-output-file
   (lambda (temp port)
     (and (url-fetch source-url temp)
          (receive (input-package-names upstream-dependency-names)
              (compute-inputs source-url wheel-url temp)
            (values
             `(package
                (name ,(python->package-name name))
                (version ,version)
                (source (origin
                          (method url-fetch)

                          ;; Sometimes 'pypi-uri' doesn't quite work due to mixed
                          ;; cases in NAME, for instance, as is the case with
                          ;; "uwsgi".  In that case, fall back to a full URL.
                          (uri (pypi-uri ,(string-downcase name) version))
                          (sha256
                           (base32
                            ,(guix-hash-url temp)))))
                (build-system python-build-system)
                ,@(maybe-inputs input-package-names)
                (home-page ,home-page)
                (synopsis ,synopsis)
                (description ,description)
                (license ,(license->symbol license)))
             upstream-dependency-names))))))

(define pypi->guix-package
  (memoize
   (lambda* (package-name)
     "Fetch the metadata for PACKAGE-NAME from pypi.org, and return the
`package' s-expression corresponding to that package, or #f on failure."
     (let ((package (pypi-fetch package-name)))
       (and package
            (guard (c ((missing-source-error? c)
                       (let ((package (missing-source-error-package c)))
                         (leave (G_ "no source release for pypi package ~a ~a~%")
                                (assoc-ref* package "info" "name")
                                (assoc-ref* package "info" "version")))))
              (let ((name (assoc-ref* package "info" "name"))
                    (version (assoc-ref* package "info" "version"))
                    (release (assoc-ref (latest-source-release package) "url"))
                    (wheel (assoc-ref (latest-wheel-release package) "url"))
                    (synopsis (assoc-ref* package "info" "summary"))
                    (description (assoc-ref* package "info" "summary"))
                    (home-page (assoc-ref* package "info" "home_page"))
                    (license (string->license (assoc-ref* package "info" "license"))))
                (make-pypi-sexp name version release wheel home-page synopsis
                                description license))))))))

(define (pypi-recursive-import package-name)
  (recursive-import package-name #f
                    #:repo->guix-package (lambda (name repo)
                                           (pypi->guix-package name))
                    #:guix-name python->package-name))

(define (string->license str)
  "Convert the string STR into a license object."
  (match str
    ("GNU LGPL" license:lgpl2.0)
    ("GPL" license:gpl3)
    ((or "BSD" "BSD License") license:bsd-3)
    ((or "MIT" "MIT license" "Expat license") license:expat)
    ("Public domain" license:public-domain)
    ((or "Apache License, Version 2.0" "Apache 2.0") license:asl2.0)
    (_ #f)))

(define (pypi-package? package)
  "Return true if PACKAGE is a Python package from PyPI."

  (define (pypi-url? url)
    (or (string-prefix? "https://pypi.org/" url)
        (string-prefix? "https://pypi.python.org/" url)
        (string-prefix? "https://pypi.io/packages" url)))

  (let ((source-url (and=> (package-source package) origin-uri))
        (fetch-method (and=> (package-source package) origin-method)))
    (and (eq? fetch-method download:url-fetch)
         (match source-url
           ((? string?)
            (pypi-url? source-url))
           ((source-url ...)
            (any pypi-url? source-url))))))

(define (latest-release package)
  "Return an <upstream-source> for the latest release of PACKAGE."
  (let* ((pypi-name    (guix-package->pypi-name package))
         (pypi-package (pypi-fetch pypi-name)))
    (and pypi-package
         (guard (c ((missing-source-error? c) #f))
           (let* ((metadata pypi-package)
                  (version (assoc-ref* metadata "info" "version"))
                  (url (assoc-ref (latest-source-release metadata) "url")))
             (upstream-source
              (package (package-name package))
              (version version)
              (urls (list url))))))))

(define %pypi-updater
  (upstream-updater
   (name 'pypi)
   (description "Updater for PyPI packages")
   (pred pypi-package?)
   (latest latest-release)))
