;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2019 Ludovic Courtès <ludo@gnu.org>
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

(define-module (guix remote)
  #:use-module (guix ssh)
  #:use-module (guix gexp)
  #:use-module (guix inferior)
  #:use-module (guix store)
  #:use-module (guix monads)
  #:use-module (guix modules)
  #:use-module (guix derivations)
  #:use-module (ssh popen)
  #:use-module (srfi srfi-1)
  #:use-module (ice-9 match)
  #:export (remote-eval))

;;; Commentary:
;;;
;;; Note: This API is experimental and subject to change!
;;;
;;; Evaluate a gexp on a remote machine, over SSH, ensuring that all the
;;; elements the gexp refers to are deployed beforehand.  This is useful for
;;; expressions that have side effects; for pure expressions, you would rather
;;; build a derivation remotely or offload it.
;;;
;;; Code:

(define (remote-pipe-for-gexp lowered session)
  "Return a remote pipe for the given SESSION to evaluate LOWERED."
  (define shell-quote
    (compose object->string object->string))

  (apply open-remote-pipe* session OPEN_READ
         (string-append (derivation->output-path
                         (lowered-gexp-guile lowered))
                        "/bin/guile")
         "--no-auto-compile"
         (append (append-map (lambda (directory)
                               `("-L" ,directory))
                             (lowered-gexp-load-path lowered))
                 (append-map (lambda (directory)
                               `("-C" ,directory))
                             (lowered-gexp-load-path lowered))
                 `("-c"
                   ,(shell-quote (lowered-gexp-sexp lowered))))))

(define (%remote-eval lowered session)
  "Evaluate LOWERED, a lowered gexp, in SESSION.  This assumes that all the
prerequisites of EXP are already available on the host at SESSION."
  (let* ((pipe   (remote-pipe-for-gexp lowered session))
         (result (read-repl-response pipe)))
    (close-port pipe)
    result))

(define (trampoline exp)
  "Return a \"trampoline\" gexp that evaluates EXP and writes the evaluation
result to the current output port using the (guix repl) protocol."
  (define program
    (scheme-file "remote-exp.scm" exp))

  (with-imported-modules (source-module-closure '((guix repl)))
    #~(begin
        (use-modules (guix repl))
        (send-repl-response '(primitive-load #$program)
                            (current-output-port))
        (force-output))))

(define* (remote-eval exp session
                      #:key
                      (build-locally? #t)
                      (module-path %load-path)
                      (socket-name "/var/guix/daemon-socket/socket"))
  "Evaluate EXP, a gexp, on the host at SESSION, an SSH session.  Ensure that
all the elements EXP refers to are built and deployed to SESSION beforehand.
When BUILD-LOCALLY? is true, said dependencies are built locally and sent to
the remote store afterwards; otherwise, dependencies are built directly on the
remote store."
  (mlet %store-monad ((lowered (lower-gexp (trampoline exp)
                                           #:module-path %load-path))
                      (remote -> (connect-to-remote-daemon session
                                                           socket-name)))
    (define inputs
      (cons (gexp-input (lowered-gexp-guile lowered))
            (lowered-gexp-inputs lowered)))

    (define to-build
      (map (lambda (input)
             (if (derivation? (gexp-input-thing input))
                 (cons (gexp-input-thing input)
                       (gexp-input-output input))
                 (gexp-input-thing input)))
           inputs))

    (if build-locally?
        (let ((to-send (map (lambda (input)
                              (match (gexp-input-thing input)
                                ((? derivation? drv)
                                 (derivation->output-path
                                  drv (gexp-input-output input)))
                                ((? store-path? item)
                                 item)))
                            inputs)))
          (mbegin %store-monad
            (built-derivations to-build)
            ((store-lift send-files) to-send remote #:recursive? #t)
            (return (close-connection remote))
            (return (%remote-eval lowered session))))
        (let ((to-send (map (lambda (input)
                              (match (gexp-input-thing input)
                                ((? derivation? drv)
                                 (derivation-file-name drv))
                                ((? store-path? item)
                                 item)))
                            inputs)))
          (mbegin %store-monad
            ((store-lift send-files) to-send remote #:recursive? #t)
            (return (build-derivations remote to-build))
            (return (close-connection remote))
            (return (%remote-eval lowered session)))))))