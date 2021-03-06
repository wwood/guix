;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2015, 2016, 2017, 2018 Ricardo Wurmus <rekado@elephly.net>
;;; Copyright © 2017, 2018 Roel Janssen <roel@gnu.org>
;;; Copyright © 2017, 2018 Tobias Geerinckx-Rice <me@tobias.gr>
;;; Copyright © 2017 Raoul Bonnal <ilpuccio.febo@gmail.com>
;;; Copyright © 2018 Vijayalakshmi Vedantham <vijimay12@gmail.com>
;;; Copyright © 2018 Sahithi Yarlagadda <sahi@swecha.net>
;;; Copyright © 2018 Sandeep Subramanian <sandeepsubramanian94@gmail.com>
;;; Copyright © 2018 Charlie Ritter <chewzeirta@posteo.net>
;;; Copyright © 2018 Konrad Hinsen <konrad.hinsen@fastmail.net>
;;; Copyright © 2018 Mădălin Ionel Patrașcu <madalinionel.patrascu@mdc-berlin.de>
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

(define-module (gnu packages cran)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix utils)
  #:use-module (guix build-system r)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages machine-learning)
  #:use-module (gnu packages maths)
  #:use-module (gnu packages mpi)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages statistics)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages web))

(define-public r-clipr
  (package
    (name "r-clipr")
    (version "0.4.1")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "clipr" version))
       (sha256
        (base32
         "061x84ildc7g1p91yw5iyj8lpqdf4hqv36as85lw8c6qv9ywbsqv"))))
    (build-system r-build-system)
    (home-page "https://github.com/mdlincoln/clipr")
    (synopsis "Read and write from the system clipboard")
    (description
     "This package provides simple utility functions to read from and write to
the system clipboards.")
    (license license:gpl3)))

(define-public r-tidyverse
  (package
    (name "r-tidyverse")
    (version "1.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "tidyverse" version))
       (sha256
        (base32
         "0yy3fkjksgcn6wkbgsb0pbnmsyqs4m01mziqafhig578nixs4rxd"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-broom" ,r-broom)
       ("r-cli" ,r-cli)
       ("r-crayon" ,r-crayon)
       ("r-dbplyr" ,r-dbplyr)
       ("r-dplyr" ,r-dplyr)
       ("r-forcats" ,r-forcats)
       ("r-ggplot2" ,r-ggplot2)
       ("r-haven" ,r-haven)
       ("r-hms" ,r-hms)
       ("r-httr" ,r-httr)
       ("r-jsonlite" ,r-jsonlite)
       ("r-lubridate" ,r-lubridate)
       ("r-magrittr" ,r-magrittr)
       ("r-modelr" ,r-modelr)
       ("r-purrr" ,r-purrr)
       ("r-readr" ,r-readr)
       ("r-readxl" ,r-readxl)
       ("r-reprex" ,r-reprex)
       ("r-rlang" ,r-rlang)
       ("r-rstudioapi" ,r-rstudioapi)
       ("r-rvest" ,r-rvest)
       ("r-stringr" ,r-stringr)
       ("r-tibble" ,r-tibble)
       ("r-tidyr" ,r-tidyr)
       ("r-xml2" ,r-xml2)))
    (home-page "https://tidyverse.tidyverse.org")
    (synopsis "Install and load packages from the \"Tidyverse\"")
    (description
     "The @code{tidyverse} is a set of packages that work in harmony because
they share common data representations and API design.  This package is
designed to make it easy to install and load multiple tidyverse packages in a
single step.")
    (license license:gpl3)))

(define-public r-rvest
  (package
    (name "r-rvest")
    (version "0.3.2")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "rvest" version))
       (sha256
        (base32
         "04mv99z8dixywx96kfy4215g6ib23s7qvd77hcf9pxqxzcvqhvhd"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-httr" ,r-httr)
       ("r-magrittr" ,r-magrittr)
       ("r-selectr" ,r-selectr)
       ("r-xml2" ,r-xml2)))
    (home-page "https://github.com/hadley/rvest")
    (synopsis "Simple web scraping for R")
    (description
     "@code{r-rvest} helps you scrape information from web pages.  It is
designed to work with @code{magrittr} to make it easy to express common web
scraping tasks, inspired by libraries like @code{BeautifulSoup}.")
    (license license:gpl3)))

(define-public r-selectr
  (package
    (name "r-selectr")
    (version "0.4-1")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "selectr" version))
       (sha256
        (base32
         "1jp27rxks4w29l47k42869hp8hnkzq2rnvsqbr44wd19fqb2zm4b"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-stringr" ,r-stringr)
       ("r-r6" ,r-r6)))
    (home-page "https://sjp.co.nz/projects/selectr/")
    (synopsis "Translate CSS selectors to XPath expressions")
    (description
     "@code{r-selectr} translates a CSS3 selector into an equivalent XPath
expression.  This allows you to use CSS selectors when working with the XML
package as it can only evaluate XPath expressions.  Also provided are
convenience functions useful for using CSS selectors on XML nodes.  This
package is a port of the Python package @code{cssselect}.")
    (license license:bsd-3)))

(define-public r-reprex
  (package
    (name "r-reprex")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "reprex" version))
       (sha256
        (base32
         "1l44pxjiz3g0jkk3v6rg5jps3llihfiah0qyv40s0bxvxa6gm8v9"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-callr" ,r-callr)
       ("r-clipr" ,r-clipr)
       ("r-knitr" ,r-knitr)
       ("r-rlang" ,r-rlang)
       ("r-rmarkdown" ,r-rmarkdown)
       ("r-whisker" ,r-whisker)
       ("r-withr" ,r-withr)))
    (home-page "https://github.com/tidyverse/reprex")
    (synopsis "Prepare reproducible R code examples for sharing")
    (description
     "This package provides a convenience wrapper that uses the
@code{rmarkdown} package to render small snippets of code to target formats
that include both code and output.  The goal is to encourage the sharing of
small, reproducible, and runnable examples on code-oriented websites or email.
@code{reprex} also extracts clean, runnable R code from various common formats,
such as copy/paste from an R session.")
    (license license:expat)))

(define-public r-callr
  (package
    (name "r-callr")
    (version "3.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "callr" version))
       (sha256
        (base32
         "1rxbxy6kn7dj90z9hpppr9cnpvnxzknba2dwrdp0lrk5dh462qz3"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-base64enc" ,r-base64enc)
       ("r-r6" ,r-r6)
       ("r-processx" ,r-processx)))
    (home-page "https://github.com/r-lib/callr#readme")
    (synopsis "Call R from R")
    (description
     "It is sometimes useful to perform a computation in a separate R process,
without affecting the current R process at all.  This packages does exactly
that.")
    (license license:expat)))

(define-public r-readxl
  (package
    (name "r-readxl")
    (version "1.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "readxl" version))
       (sha256
        (base32
         "05ii8knrg4jji6h7bv6bfpn279b6x52yrskdx5rv7b0hcpy22gdn"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-cellranger" ,r-cellranger)
       ("r-rcpp" ,r-rcpp)
       ("r-tibble" ,r-tibble)))
    (home-page "https://readxl.tidyverse.org")
    (synopsis "Read Excel files")
    (description
     "This package lets you import Excel files into R.  It supports
@file{.xls} via the embedded @code{libxls} C library and @file{.xlsx} via
the embedded @code{RapidXML} C++ library.")
    ;; XXX: This package bundles a copy of 'libxsl' which is BSD-2 and
    ;; 'rapidxml' which is Boost.
    (license (list license:gpl3 license:bsd-2 license:boost1.0))))

(define-public r-modelr
  (package
    (name "r-modelr")
    (version "0.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "modelr" version))
       (sha256
        (base32
         "09whg3q5xq6csbqwgwfwav09vda8vgady5j70sk52xcn232k363a"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-broom" ,r-broom)
       ("r-dplyr" ,r-dplyr)
       ("r-lazyeval" ,r-lazyeval)
       ("r-magrittr" ,r-magrittr)
       ("r-purrr" ,r-purrr)
       ("r-tibble" ,r-tibble)
       ("r-tidyr" ,r-tidyr)))
    (home-page "https://github.com/tidyverse/modelr")
    (synopsis "Helper functions for modelling in pipelines")
    (description
     "Functions for modelling that help you seamlessly integrate modelling
into a pipeline of data manipulation and visualisation.")
    (license license:gpl3)))

(define-public r-haven
  (package
    (name "r-haven")
    (version "1.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "haven" version))
       (sha256
        (base32
         "0pp8xjf5lzqg1wr8cwxj4njx99vxwlflwjrd7jvyzwlfpwh7n1qa"))))
    (build-system r-build-system)
    (inputs
     `(("zlib" ,zlib)))
    (propagated-inputs
     `(("r-forcats" ,r-forcats)
       ("r-hms" ,r-hms)
       ("r-rcpp" ,r-rcpp)
       ("r-readr" ,r-readr)
       ("r-tibble" ,r-tibble)))
    (home-page "https://haven.tidyverse.org")
    (synopsis "Import and Export 'SPSS', 'Stata' and 'SAS' Files")
    (description
     "This package lets you mport foreign statistical formats into R via the
embedded @url{https://github.com/WizardMac/ReadStat,ReadStat} C library.")
    (license license:expat)))

(define-public r-amap
  (package
    (name "r-amap")
    (version "0.8-16")
    (source (origin
              (method url-fetch)
              (uri (cran-uri "amap" version))
              (sha256
               (base32
                "1qnl2x98x64iaipkx5126rsddq2sx5ml43h75xyiyn30yvbmlxyk"))))
    (build-system r-build-system)
    (inputs
     `(("gfortran" ,gfortran)))
    (home-page "http://mulcyber.toulouse.inra.fr/projects/amap/")
    (synopsis "Another multidimensional analysis package")
    (description "This package provides tools for clustering and principal
component analysis (with robust methods, and parallelized functions).")
    (license license:gpl2+)))

(define-public r-ape
  (package
    (name "r-ape")
    (version "5.1")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "ape" version))
       (sha256
        (base32
         "0vm2065993wf4hdqarxqykhfz9aaj0rrb98alhkq4qw1d2kdrmdp"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-lattice" ,r-lattice)
       ("r-nlme" ,r-nlme)
       ("r-rcpp" ,r-rcpp)))
    (home-page "http://ape-package.ird.fr/")
    (synopsis "Analyses of phylogenetics and evolution")
    (description
     "This package provides functions for reading, writing, plotting, and
manipulating phylogenetic trees, analyses of comparative data in a
phylogenetic framework, ancestral character analyses, analyses of
diversification and macroevolution, computing distances from DNA sequences,
and several other tools.")
    (license license:gpl2+)))

(define-public r-abbyyr
  (package
    (name "r-abbyyr")
    (version "0.5.4")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "abbyyR" version))
       (sha256
        (base32
         "1jh1c1ad6mgw7brdh2isnza1qpjlfxnqr7jl76yd93axyfl76xjx"))))
    (properties `((upstream-name . "abbyyR")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-curl" ,r-curl)
       ("r-httr" ,r-httr)
       ("r-plyr" ,r-plyr)
       ("r-progress" ,r-progress)
       ("r-readr" ,r-readr)
       ("r-xml" ,r-xml)))
    (home-page "https://github.com/soodoku/abbyyR")
    (synopsis "Access to Abbyy Optical Character Recognition (OCR) API")
    (description
     "This package provides tools to get text from images of text using Abbyy
Cloud Optical Character Recognition (OCR) API.  With abbyyyR, one can easily
OCR images, barcodes, forms, documents with machine readable zones, e.g.
passports and get the results in a variety of formats including plain text and
XML.  To learn more about the Abbyy OCR API, see @url{http://ocrsdk.com/}.")
    (license license:expat)))

(define-public r-colorspace
  (package
    (name "r-colorspace")
    (version "1.3-2")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "colorspace" version))
       (sha256
        (base32 "0d1ya7hx4y58n5ivwmdmq2zgh0g2sbv7ykh13n85c1355csd57yx"))))
    (build-system r-build-system)
    (home-page "https://cran.r-project.org/web/packages/colorspace")
    (synopsis "Color space manipulation")
    (description
     "This package carries out a mapping between assorted color spaces
including RGB, HSV, HLS, CIEXYZ, CIELUV, HCL (polar CIELUV), CIELAB and polar
CIELAB.  Qualitative, sequential, and diverging color palettes based on HCL
colors are provided.")
    (license license:bsd-3)))

(define-public r-glue
  (package
    (name "r-glue")
    (version "1.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "glue" version))
       (sha256
        (base32
         "1vhw5497lpfr4m8lcx9bs0fgdp4ax0sycrk6n8yksp33qd25m7kq"))))
    (build-system r-build-system)
    (home-page "https://github.com/tidyverse/glue")
    (synopsis "Interpreted string literals")
    (description
     "This package provides an implementation of interpreted string literals,
inspired by Python's Literal String Interpolation (PEP-0498) and
Docstrings (PEP-0257) and Julia's Triple-Quoted String Literals.")
    (license license:expat)))

(define-public r-pastecs
  (package
   (name "r-pastecs")
   (version "1.3.21")
   (source (origin
            (method url-fetch)
            (uri (cran-uri "pastecs" version))
            (sha256
             (base32
              "0z4dic94ar646w7zc2ggi5hgvf2qnznsani94c5pyql8zspz47lc"))))
   (build-system r-build-system)
   (propagated-inputs
    `(("r-boot" ,r-boot)))
   (home-page "http://www.sciviews.org/pastecs")
   (synopsis "Analysis of space-time ecological series")
   (description
    "This package provides functions for regulation, decomposition and analysis
of space-time series.  The @code{pastecs} library is a PNEC-Art4 and IFREMER
initiative to bring PASSTEC 2000 functionalities to R.")
   (license license:gpl2+)))

(define-public r-plogr
  (package
    (name "r-plogr")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "plogr" version))
       (sha256
        (base32
         "0a8dhzlna79ggyhfr0nncgh15a9n6r0dsz664pz0ah323wpblqqf"))))
    (build-system r-build-system)
    (home-page "https://github.com/krlmlr/plogr")
    (synopsis "R bindings for the plog C++ logging library")
    (description
     "This package provides the header files for a stripped-down version of
the plog header-only C++ logging library, and a method to log to R's standard
error stream.")
    (license license:expat)))

(define-public r-pls
  (package
    (name "r-pls")
    (version "2.7-0")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "pls" version))
       (sha256
        (base32
         "0xaqqgmdvfh7g7v1m4bcwjqzph68b9cq3bn4kjisfsadl54i5p2x"))))
    (build-system r-build-system)
    (home-page "http://mevik.net/work/software/pls.html")
    (synopsis "Partial Least Squares and Principal Component Regression")
    (description
     "The pls package implements multivariate regression methods: Partial Least
Squares Regression (@dfn{PLSR}), Principal Component Regression (@dfn{PCR}), and
Canonical Powered Partial Least Squares (@dfn{CPPLS}).  It supports:

@itemize
@item several algorithms: the traditional orthogonal scores (@dfn{NIPALS}) PLS
algorithm, kernel PLS, wide kernel PLS, Simpls, and PCR through @code{svd}
@item multi-response models (or @dfn{PLS2})
@item flexible cross-validation
@item Jackknife variance estimates of regression coefficients
@item extensive and flexible plots: scores, loadings, predictions, coefficients,
(R)MSEP, R², and correlation loadings
@item formula interface, modelled after @code{lm()}, with methods for predict,
print, summary, plot, update, etc.
@item extraction functions for coefficients, scores, and loadings
@item MSEP, RMSEP, and R² estimates
@item multiplicative scatter correction (@dfn{MSC})
@end itemize\n")
    (license license:gpl2)))

(define-public r-ps
  (package
    (name "r-ps")
    (version "1.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "ps" version))
       (sha256
        (base32 "1zm9qkyvy1fvcjvmgw51iqw8x1xzkpy7rx7xnchwfj0xpzal0ljx"))))
    (build-system r-build-system)
    (home-page "http://ps.r-lib.org")
    (synopsis "List, query, and manipulate system processes")
    (description
     "The ps package implements an API to list, query, and manipulate system
processes.  Most of its code is based on the @code{psutil} Python package.")
    (license license:bsd-3)))

(define-public r-pkgbuild
  (package
    (name "r-pkgbuild")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "pkgbuild" version))
       (sha256
        (base32
         "10iz8057mixl9j73pq2cbp4ib6dadfsgi3fcsjjm7l3wwb9issd9"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-callr" ,r-callr)
       ("r-crayon" ,r-crayon)
       ("r-desc" ,r-desc)
       ("r-r6" ,r-r6)
       ("r-rprojroot" ,r-rprojroot)
       ("r-withr" ,r-withr)))
    (home-page "https://github.com/r-pkgs/pkgbuild")
    (synopsis "Find tools needed to build R packages")
    (description
     "This package provides functions used to build R packages.  It locates
compilers needed to build R packages on various platforms and ensures the PATH
is configured appropriately so R can use them.")
    (license license:gpl3)))

(define-public r-pkgload
  (package
    (name "r-pkgload")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "pkgload" version))
       (sha256
        (base32
         "1rjj229nq9fsl4ki4m75ybsavjgpqqhsr1zjzapwicsrxv6212px"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-desc" ,r-desc)
       ("r-pkgbuild" ,r-pkgbuild)
       ("r-rlang" ,r-rlang)
       ("r-rprojroot" ,r-rprojroot)
       ("r-rstudioapi" ,r-rstudioapi)
       ("r-withr" ,r-withr)))
    (home-page "https://github.com/r-lib/pkgload")
    (synopsis "Simulate package installation and attach")
    (description
     "This package simulates the process of installing a package and then
attaching it.  This is a key part of the @code{devtools} package as it allows
you to rapidly iterate while developing a package.")
    (license license:gpl3)))

(define-public r-rcpp
  (package
    (name "r-rcpp")
    (version "0.12.18")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "Rcpp" version))
       (sha256
        (base32 "006kpg2ph109rh1l13lqk26pp4as4fvl5661vrcczjygacgd1v7w"))))
    (build-system r-build-system)
    (home-page "http://www.rcpp.org")
    (synopsis "Seamless R and C++ integration")
    (description
     "The Rcpp package provides R functions as well as C++ classes which offer
a seamless integration of R and C++.  Many R data types and objects can be
mapped back and forth to C++ equivalents which facilitates both writing of new
code as well as easier integration of third-party libraries.  Documentation
about Rcpp is provided by several vignettes included in this package, via the
'Rcpp Gallery' site at <http://gallery.rcpp.org>, the paper by Eddelbuettel
and Francois (2011, JSS), and the book by Eddelbuettel (2013, Springer); see
'citation(\"Rcpp\")' for details on these last two.")
    (license license:gpl2+)))

(define-public r-bindr
  (package
    (name "r-bindr")
    (version "0.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "bindr" version))
       (sha256
        (base32
         "1l05fpk2yql3jka321c0bdgx6mqq9pvfrg2844lbjfpbgjkmqy3w"))))
    (build-system r-build-system)
    (home-page "https://github.com/krlmlr/bindr")
    (synopsis "Parametrized active bindings")
    (description
     "This package provides a simple interface for creating active bindings
where the bound function accepts additional arguments.")
    (license license:expat)))

(define-public r-bindrcpp
  (package
    (name "r-bindrcpp")
    (version "0.2.2")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "bindrcpp" version))
       (sha256
        (base32
         "0rz4ibjdjsxl99ff3ha79z7cnjmilx4rx58fk9kk7ld9xc4hf4s8"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-bindr" ,r-bindr)
       ("r-plogr" ,r-plogr)
       ("r-rcpp" ,r-rcpp)))
    (home-page "https://github.com/krlmlr/bindrcpp")
    (synopsis "Rcpp interface to active bindings")
    (description
     "This package provides an easy way to fill an environment with active
bindings that call a C++ function.")
    (license license:expat)))

(define-public r-auc
  (package
    (name "r-auc")
    (version "0.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "AUC" version))
       (sha256
        (base32
         "0ripcib2qz0m7rgr1kiz68nx8f6p408l1ww7j78ljqik7p3g41g7"))))
    (properties `((upstream-name . "AUC")))
    (build-system r-build-system)
    (home-page "https://cran.r-project.org/web/packages/AUC")
    (synopsis "Compute the area under the curve of selected measures")
    (description
     "This package includes functions to compute the area under the curve of
selected measures: the area under the sensitivity curve (AUSEC), the area
under the specificity curve (AUSPC), the area under the accuracy
curve (AUACC), and the area under the receiver operating characteristic
curve (AUROC).  The curves can also be visualized.  Support for partial areas
is provided.")
    (license license:gpl2+)))

(define-public r-calibrate
  (package
    (name "r-calibrate")
    (version "1.7.2")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "calibrate" version))
       (sha256
        (base32
         "010nb1nb9y7zhw2k6d2i2drwy5brp7b83mjj2w7i3wjp9xb6l1kq"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-mass" ,r-mass)))
    (home-page "https://cran.r-project.org/web/packages/calibrate")
    (synopsis "Calibration of scatterplot and biplot axes")
    (description
     "This is a package for drawing calibrated scales with tick marks
on (non-orthogonal) variable vectors in scatterplots and biplots.")
    (license license:gpl2)))

(define-public r-shape
  (package
    (name "r-shape")
    (version "1.4.4")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "shape" version))
       (sha256
        (base32
         "0hadk3mapkhbh8xjkiz52vxdagmmgvm15xwpzb90ikw4giyipjzl"))))
    (build-system r-build-system)
    (home-page "https://cran.r-project.org/web/packages/shape")
    (synopsis "Functions for plotting graphical shapes")
    (description
     "This package provides functions for plotting graphical shapes such as
ellipses, circles, cylinders, arrows, ...")
    (license license:gpl3+)))

(define-public r-globaloptions
  (package
    (name "r-globaloptions")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "GlobalOptions" version))
       (sha256
        (base32
         "1wlyqz1yhmhjwslrd7q69jbd9vsbjkjfc01g60kl3cdpyr8hlyjn"))))
    (properties `((upstream-name . "GlobalOptions")))
    (build-system r-build-system)
    (home-page "https://github.com/jokergoo/GlobalOptions")
    (synopsis "Generate functions to get or set global options")
    (description
     "This package provides more controls on the option values such as
validation and filtering on the values, making options invisible or private.")
    (license license:gpl2+)))

(define-public r-circlize
  (package
    (name "r-circlize")
    (version "0.4.4")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "circlize" version))
       (sha256
        (base32
         "1l28maiqi549z191srncxgabx5fnvf0lld7smzwfd3vr5cx8nqww"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-colorspace" ,r-colorspace)
       ("r-globaloptions" ,r-globaloptions)
       ("r-shape" ,r-shape)))
    (home-page "https://github.com/jokergoo/circlize")
    (synopsis "Circular visualization")
    (description
     "Circular layout is an efficient way to visualise huge amounts of
information.  This package provides an implementation of circular layout
generation in R as well as an enhancement of available software.  Its
flexibility is based on the usage of low-level graphics functions such that
self-defined high-level graphics can be easily implemented by users for
specific purposes.  Together with the seamless connection between the powerful
computational and visual environment in R, it gives users more convenience and
freedom to design figures for better understanding complex patterns behind
multi-dimensional data.")
    (license license:gpl2+)))

(define-public r-powerlaw
  (package
    (name "r-powerlaw")
    (version "0.70.1")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "poweRlaw" version))
       (sha256
        (base32
         "04sr0nhdd1v915m0zf5gasznzgi08ykcy20kkwdw0l5mvvdbic8m"))))
    (properties `((upstream-name . "poweRlaw")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-vgam" ,r-vgam)))
    (home-page "https://github.com/csgillespie/poweRlaw")
    (synopsis "Tools for the analysis of heavy tailed distributions")
    (description
     "This package provides an implementation of maximum likelihood estimators
for a variety of heavy tailed distributions, including both the discrete and
continuous power law distributions.  Additionally, a goodness-of-fit based
approach is used to estimate the lower cut-off for the scaling region.")
    ;; Any of these GPL versions.
    (license (list license:gpl2 license:gpl3))))

(define-public r-compare
  (package
    (name "r-compare")
    (version "0.2-6")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "compare" version))
       (sha256
        (base32
         "0k9zms930b5dz9gy8414li21wy0zg9x9vp7301v5cvyfi0g7xzgw"))))
    (build-system r-build-system)
    (home-page "https://cran.r-project.org/web/packages/compare")
    (synopsis "Comparing objects for differences")
    (description
     "This package provides functions to compare a model object to a
comparison object.  If the objects are not identical, the functions can be
instructed to explore various modifications of the objects (e.g., sorting
rows, dropping names) to see if the modified versions are identical.")
    (license license:gpl2+)))

(define-public r-dendextend
  (package
    (name "r-dendextend")
    (version "1.8.0")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "dendextend" version))
       (sha256
        (base32
         "1virn3c232xwcq3d0hhkgjh5gpzl01s39iwii5gxcm9mnsxjzdrh"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-fpc" ,r-fpc)
       ("r-ggplot2" ,r-ggplot2)
       ("r-magrittr" ,r-magrittr)
       ("r-viridis" ,r-viridis)
       ("r-whisker" ,r-whisker)))
    (home-page "https://cran.r-project.org/web/packages/dendextend")
    (synopsis "Extending 'dendrogram' functionality in R")
    (description
     "This package offers a set of functions for extending @code{dendrogram}
objects in R, letting you visualize and compare trees of hierarchical
clusterings.  You can adjust a tree's graphical parameters (the color, size,
type, etc of its branches, nodes and labels) and visually and statistically
compare different dendrograms to one another.")
    ;; Any of these versions
    (license (list license:gpl2 license:gpl3))))

(define-public r-getoptlong
  (package
    (name "r-getoptlong")
    (version "0.1.7")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "GetoptLong" version))
       (sha256
        (base32
         "1fl3w2n602ldybc5qj7qw4xmzzb804bsjkqwf6dswzj0vf0qiadr"))))
    (properties `((upstream-name . "GetoptLong")))
    (build-system r-build-system)
    (inputs
     `(("perl" ,perl)))
    (propagated-inputs
     `(("r-globaloptions" ,r-globaloptions)
       ("r-rjson" ,r-rjson)))
    (home-page "https://github.com/jokergoo/GetoptLong")
    (synopsis "Parsing command-line arguments and variable interpolation")
    (description
     "This is yet another command-line argument parser which wraps the
powerful Perl module @code{Getopt::Long} and with some adaptation for easier
use in R.  It also provides a simple way for variable interpolation in R.")
    (license license:gpl2+)))

(define-public r-fastmatch
  (package
    (name "r-fastmatch")
    (version "1.1-0")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "fastmatch" version))
       (sha256
        (base32
         "0z80jxkygmzn11sq0c2iz357s9bpki548lg926g85gldhfj1md90"))))
    (build-system r-build-system)
    (home-page "http://www.rforge.net/fastmatch")
    (synopsis "Fast match function")
    (description
     "This package provides a fast @code{match} replacement for cases that
require repeated look-ups.  It is slightly faster that R's built-in
@code{match} function on first match against a table, but extremely fast on
any subsequent lookup as it keeps the hash table in memory.")
    (license license:gpl2)))

(define-public r-ff
  (package
    (name "r-ff")
    (version "2.2-14")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "ff" version))
       (sha256
        (base32
         "1w724q4jpzbvzpilb2ifviaxkjgk9lzwxz9gksnvicbmfa20fqqw"))))
    (build-system r-build-system)
    (propagated-inputs `(("r-bit" ,r-bit)))
    (home-page "http://ff.r-forge.r-project.org/")
    (synopsis "Memory-efficient storage of large data on disk and access functions")
    (description
     "This package provides data structures that are stored on disk but
behave (almost) as if they were in RAM by transparently mapping only a section
in main memory.")
    ;; error Architecture not supported.
    (supported-systems (delete "aarch64-linux" %supported-systems))
    (license license:gpl2)))

(define-public r-ffbase
  (package
    (name "r-ffbase")
    (version "0.12.3")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "ffbase" version))
       (sha256
        (base32
         "1nz97bndxxkzp8rq6va8ff5ky9vkaib1jybm6j852awwb3n9had5"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-bit" ,r-bit)
       ("r-fastmatch" ,r-fastmatch)
       ("r-ff" ,r-ff)))
    (home-page "http://github.com/edwindj/ffbase")
    (synopsis "Basic statistical functions for package 'ff'")
    (description
     "This package extends the out of memory vectors of @code{ff} with
statistical functions and other utilities to ease their usage.")
    (license license:gpl3)))

(define-public r-prettyunits
  (package
    (name "r-prettyunits")
    (version "1.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "prettyunits" version))
       (sha256
        (base32
         "0p3z42hnk53x7ky4d1dr2brf7p8gv3agxr71i99m01n2hq2ri91m"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-assertthat" ,r-assertthat)
       ("r-magrittr" ,r-magrittr)))
    (home-page "https://github.com/gaborcsardi/prettyunits")
    (synopsis "Pretty, human readable formatting of quantities")
    (description
     "This package provides tools for pretty, human readable formatting of
quantities.")
    (license license:expat)))

(define-public r-reshape
  (package
    (name "r-reshape")
    (version "0.8.7")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "reshape" version))
       (sha256
        (base32
         "14ir3w4bb3bsz8jsak27nj7kpn227pdgr9653gjq5wc93rywi9ig"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-plyr" ,r-plyr)
       ("r-rcpp" ,r-rcpp)))
    (home-page "http://had.co.nz/reshape")
    (synopsis "Flexibly reshape data")
    (description
     "Flexibly restructure and aggregate data using just two functions:
@code{melt} and @code{cast}.  This package provides them.")
    (license license:expat)))

(define-public r-progress
  (package
    (name "r-progress")
    (version "1.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "progress" version))
       (sha256
        (base32
         "1rhwm0bdw30z3rvl0bn56xprjl3zrdy7150w4gl4bkvn2d6h9fav"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-crayon" ,r-crayon)
       ("r-hms" ,r-hms)
       ("r-prettyunits" ,r-prettyunits)
       ("r-r6" ,r-r6)))
    (home-page "https://github.com/gaborcsardi/progress")
    (synopsis "Terminal progress bars")
    (description
     "This package provides configurable progress bars.  They may include
percentage, elapsed time, and/or the estimated completion time.  They work in
terminals, in Emacs ESS, RStudio, Windows Rgui, and the macOS R.app.  The
package also provides a C++ API, that works with or without Rcpp.")
    (license license:expat)))

(define-public r-ggally
  (package
    (name "r-ggally")
    (version "1.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "GGally" version))
       (sha256
        (base32
         "1zjmcc5bzagvy7c5cmdcl39xmx07fwi98yrj4i05w7y40kqcsiws"))))
    (properties `((upstream-name . "GGally")))
    (build-system r-build-system)
    (inputs
     `(("libressl" ,libressl)))
    (propagated-inputs
     `(("r-ggplot2" ,r-ggplot2)
       ("r-gtable" ,r-gtable)
       ("r-plyr" ,r-plyr)
       ("r-progress" ,r-progress)
       ("r-rcolorbrewer" ,r-rcolorbrewer)
       ("r-reshape" ,r-reshape)
       ("r-rlang" ,r-rlang)))
    (home-page "https://ggobi.github.io/ggally")
    (synopsis "Extension to ggplot2")
    (description
     "The R package ggplot2 is a plotting system based on the grammar of
graphics.  GGally extends ggplot2 by adding several functions to reduce the
complexity of combining geometric objects with transformed data.  Some of
these functions include a pairwise plot matrix, a two group pairwise plot
matrix, a parallel coordinates plot, a survival plot, and several functions to
plot networks.")
    (license license:gpl2+)))

(define-public r-proxy
  (package
    (name "r-proxy")
    (version "0.4-22")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "proxy" version))
       (sha256
        (base32
         "0l0ff8irmmvic941is290hd5vszyhaj5nfwna4v3w9c1zk5nr1ma"))))
    (build-system r-build-system)
    (home-page "https://cran.r-project.org/web/packages/proxy")
    (synopsis "Distance and similarity measures")
    (description
     "This package provides an extensible framework for the efficient
calculation of auto- and cross-proximities, along with implementations of the
most popular ones.")
    (license license:gpl2)))

(define-public r-sp
  (package
    (name "r-sp")
    (version "1.3-1")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "sp" version))
       (sha256
        (base32
         "17xm1ig80p9wc860hm3bgishz6lj9fxgwqidj7rkbk4ap99qp62p"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-lattice" ,r-lattice)))
    (home-page "https://cran.r-project.org/web/packages/sp")
    (synopsis "Classes and methods for spatial data")
    (description
     "This package provides classes and methods for spatial data; the classes
document where the spatial location information resides, for 2D or 3D data.
Utility functions are provided, e.g. for plotting data as maps, spatial
selection, as well as methods for retrieving coordinates, for subsetting,
print, summary, etc.")
    (license license:gpl2+)))

(define-public r-rmtstat
  (package
    (name "r-rmtstat")
    (version "0.3")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "RMTstat" version))
       (sha256
        (base32
         "1nn25q4kmh9kj975sxkrpa97vh5irqrlqhwsfinbck6h6ia4rsw1"))))
    (properties `((upstream-name . "RMTstat")))
    (build-system r-build-system)
    (home-page "https://cran.r-project.org/web/packages/RMTstat")
    (synopsis "Distributions, statistics and tests derived from random matrix theory")
    (description
     "This package provides functions for working with the Tracy-Widom laws
and other distributions related to the eigenvalues of large Wishart
matrices.")
    (license license:bsd-3)))

(define-public r-rmpi
  (package
    (name "r-rmpi")
    (version "0.6-7")
    (source (origin
              (method url-fetch)
              (uri (cran-uri "Rmpi" version))
              (sha256
               (base32
                "1b62gs7w1xqadqd7ir41jnxlcf14gcqfxd0915kn9ckdlsdrh0sw"))))
    (properties `((upstream-name . "Rmpi")))
    (build-system r-build-system)
    (arguments
     `(#:configure-flags '("--configure-args=\"--with-Rmpi-type=OPENMPI\"")))
    (inputs
     `(("openmpi" ,openmpi)))
    (native-inputs
     `(("pkg-config" ,pkg-config)))
    (home-page "http://www.stats.uwo.ca/faculty/yu/Rmpi")
    (synopsis "R interface to message-passing interface (MPI)")
    (description
     "This package provides an interface (wrapper) to MPI APIs.  It also
provides an interactive R manager and worker environment.")
    (license license:gpl2+)))

(define-public r-lmoments
  (package
    (name "r-lmoments")
    (version "1.2-3")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "Lmoments" version))
       (sha256
        (base32
         "13p0r4w16jvjnyjmkhkp3dwdfr1gap2l0k4k5jy41m8nc5fvcx79"))))
    (properties `((upstream-name . "Lmoments")))
    (build-system r-build-system)
    (home-page "http://www.tilastotiede.fi/juha_karvanen.html")
    (synopsis "L-moments and quantile mixtures")
    (description
     "This package contains functions to estimate L-moments and trimmed
L-moments from the data.  It also contains functions to estimate the
parameters of the normal polynomial quantile mixture and the Cauchy polynomial
quantile mixture from L-moments and trimmed L-moments.")
    (license license:gpl2)))

(define-public r-distillery
  (package
    (name "r-distillery")
    (version "1.0-4")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "distillery" version))
       (sha256
        (base32
         "1m0pgmlvk7bsb6q3kxagnq422babk61sf73naavac68v8x2q8fix"))))
    (build-system r-build-system)
    (home-page "http://www.ral.ucar.edu/staff/ericg")
    (synopsis "Functions for confidence intervals and object information")
    (description
     "This package provides some very simple method functions for confidence
interval calculation and to distill pertinent information from a potentially
complex object; primarily used in common with the packages extRemes and
SpatialVx.")
    (license license:gpl2+)))

(define-public r-extremes
  (package
    (name "r-extremes")
    (version "2.0-9")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "extRemes" version))
       (sha256
        (base32
         "0cpvcajk9xyy7662nqkyx333vrxpwsc5nmv0bfnhsbgijz5y0hvm"))))
    (properties `((upstream-name . "extRemes")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-car" ,r-car)
       ("r-distillery" ,r-distillery)
       ("r-lmoments" ,r-lmoments)))
    (home-page "http://www.assessment.ucar.edu/toolkit/")
    (synopsis "Extreme value analysis")
    (description
     "ExtRemes is a suite of functions for carrying out analyses on the
extreme values of a process of interest; be they block maxima over long blocks
or excesses over a high threshold.")
    (license license:gpl2+)))

(define-public r-lmtest
  (package
    (name "r-lmtest")
    (version "0.9-36")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "lmtest" version))
       (sha256
        (base32
         "0sym9sm1vl6bbgq01jhz1plxqmgh8hrgrn7rw0mwvsalcn6id7xy"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-zoo" ,r-zoo)))
    (native-inputs
     `(("gfortran" ,gfortran)))
    (home-page "https://cran.r-project.org/web/packages/lmtest")
    (synopsis "Testing linear regression models")
    (description
     "This package provides a collection of tests, data sets, and examples for
diagnostic checking in linear regression models.  Furthermore, some generic
tools for inference in parametric models are provided.")
    ;; Either version is okay
    (license (list license:gpl2 license:gpl3))))

(define-public r-idr
  (package
    (name "r-idr")
    (version "1.2")
    (source (origin
              (method url-fetch)
              (uri (cran-uri "idr" version))
              (sha256
               (base32
                "05nvgw1xdg670bsjjrxkgd1mrdkciccpw4krn0zcgdf2r21dzgwb"))))
    (build-system r-build-system)
    (home-page "https://cran.r-project.org/web/packages/idr/")
    (synopsis "Irreproducible discovery rate")
    (description
     "This is a package for estimating the copula mixture model and plotting
correspondence curves in \"Measuring reproducibility of high-throughput
experiments\" (2011), Annals of Applied Statistics, Vol. 5, No. 3, 1752-1779,
by Li, Brown, Huang, and Bickel")
    (license license:gpl2+)))

(define-public r-inline
  (package
    (name "r-inline")
    (version "0.3.15")
    (source (origin
              (method url-fetch)
              (uri (cran-uri "inline" version))
              (sha256
               (base32
                "0s4wssvpan189fijahknxq5s22ww9bzmdlmyhnra748r7khky17z"))))
    (build-system r-build-system)
    (home-page "https://cran.r-project.org/web/packages/inline")
    (synopsis "Functions to inline C, C++, Fortran function calls from R")
    (description
     "This package provides functionality to dynamically define R functions
and S4 methods with inlined C, C++ or Fortran code supporting @code{.C} and
@code{.Call} calling conventions.")
    ;; Any version of the LGPL.
    (license license:lgpl3+)))

(define-public r-bbmle
  (package
    (name "r-bbmle")
    (version "1.0.20")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "bbmle" version))
       (sha256
        (base32
         "1xzij7swrrzl5ly8l3lw6awh486zcm00251dwqws1y23fbgyh3vc"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-lattice" ,r-lattice)
       ("r-mass" ,r-mass)
       ("r-numderiv" ,r-numderiv)))
    (home-page "https://cran.r-project.org/web/packages/bbmle")
    (synopsis "Tools for General Maximum Likelihood Estimation")
    (description
     "This package provides methods and functions for fitting maximum
likelihood models in R.  This package modifies and extends the @code{mle}
classes in the @code{stats4} package.")
    ;; Any version of the GPL
    (license license:gpl2+)))

(define-public r-emdbook
  (package
    (name "r-emdbook")
    (version "1.3.10")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "emdbook" version))
       (sha256
        (base32
         "0880cx6rqm9vgd2zxnd2k0igfl80gy7ak15w36clwlzavab59hmv"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-bbmle" ,r-bbmle)
       ("r-coda" ,r-coda)
       ("r-lattice" ,r-lattice)
       ("r-mass" ,r-mass)
       ("r-plyr" ,r-plyr)
       ("r-rcpp" ,r-rcpp)))
    (home-page "http://www.math.mcmaster.ca/bolker/emdbook")
    (synopsis "Support functions and data for \"Ecological Models and Data\"")
    (description
     "This package provides auxiliary functions and data sets for \"Ecological
Models and Data\", a book presenting maximum likelihood estimation and related
topics for ecologists (ISBN 978-0-691-12522-0).")
    ;; Any GPL version
    (license (list license:gpl2 license:gpl3))))

(define-public r-lpsolve
  (package
    (name "r-lpsolve")
    (version "5.6.13")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "lpSolve" version))
       (sha256
        (base32
         "13a9ry8xf5j1f2j6imqrxdgxqz3nqp9sj9b4ivyx9sid459irm6m"))))
    (properties `((upstream-name . "lpSolve")))
    (build-system r-build-system)
    (home-page "https://cran.r-project.org/web/packages/lpSolve")
    (synopsis "R interface to Lp_solve to solve linear/integer programs")
    (description
     "Lp_solve is software for solving linear, integer and mixed integer
programs.  This implementation supplies a \"wrapper\" function in C and some R
functions that solve general linear/integer problems, assignment problems, and
transportation problems.")
    (license license:lgpl2.0)))

(define-public r-limsolve
  (package
    (name "r-limsolve")
    (version "1.5.5.3")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "limSolve" version))
       (sha256
        (base32
         "1ll6ir42h3g2fzf0wqai213bm82gpwjj2hfma2np3mz024sc09rg"))))
    (properties `((upstream-name . "limSolve")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-lpsolve" ,r-lpsolve)
       ("r-mass" ,r-mass)
       ("r-quadprog" ,r-quadprog)))
    (native-inputs `(("gfortran" ,gfortran)))
    (home-page "https://cran.r-project.org/web/packages/limSolve")
    (synopsis "Solving linear inverse models")
    (description
     "This package provides functions that:

@enumerate
@item find the minimum/maximum of a linear or quadratic function,
@item sample an underdetermined or overdetermined system,
@item solve a linear system Ax=B for the unknown x.
@end enumerate

It includes banded and tridiagonal linear systems.  The package calls Fortran
functions from LINPACK.")
    ;; Any GPL version.
    (license (list license:gpl2+ license:gpl3+))))

(define-public r-fitdistrplus
  (package
    (name "r-fitdistrplus")
    (version "1.0-9")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "fitdistrplus" version))
       (sha256
        (base32
         "18x9454g598d54763k3hvi33iszifk7sxvhd1zg5r8z1vpixx3z6"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-mass" ,r-mass)
       ("r-survival" ,r-survival)))
    (home-page "http://riskassessment.r-forge.r-project.org")
    (synopsis "Fitting a parametric distribution from data")
    (description
     "This package extends the @code{fitdistr} function of the MASS package
with several functions to help the fit of a parametric distribution to
non-censored or censored data.  Censored data may contain left-censored,
right-censored and interval-censored values, with several lower and upper
bounds.  In addition to @dfn{maximum likelihood estimation} (MLE), the package
provides moment matching (MME), quantile matching (QME) and maximum
goodness-of-fit estimation (MGE) methods (available only for non-censored
data).  Weighted versions of MLE, MME and QME are available.")
    (license license:gpl2+)))

(define-public r-energy
  (package
    (name "r-energy")
    (version "1.7-5")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "energy" version))
       (sha256
        (base32
         "15k9dg0a82cs9ypm0wpcsff3il1hzhnnv86dv5ngby1r144czhi4"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-boot" ,r-boot)
       ("r-rcpp" ,r-rcpp)))
    (home-page "https://cran.r-project.org/web/packages/energy")
    (synopsis "Multivariate inference via the energy of data")
    (description
     "This package provides e-statistics (energy) tests and statistics for
multivariate and univariate inference, including distance correlation,
one-sample, two-sample, and multi-sample tests for comparing multivariate
distributions, are implemented.  Measuring and testing multivariate
independence based on distance correlation, partial distance correlation,
multivariate goodness-of-fit tests, clustering based on energy distance,
testing for multivariate normality, distance components (disco) for
non-parametric analysis of structured data, and other energy
statistics/methods are implemented.")
    (license license:gpl2+)))

(define-public r-suppdists
  (package
    (name "r-suppdists")
    (version "1.1-9.4")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "SuppDists" version))
       (sha256
        (base32
         "1ffx8wigqqvz2pnh06jjc0fnf4vq9z2rhwk2y3f9aszn18ap3dgw"))))
    (properties `((upstream-name . "SuppDists")))
    (build-system r-build-system)
    (home-page "https://cran.r-project.org/web/packages/SuppDists")
    (synopsis "Supplementary distributions")
    (description
     "This package provides ten distributions supplementing those built into
R.  Inverse Gauss, Kruskal-Wallis, Kendall's Tau, Friedman's chi squared,
Spearman's rho, maximum F ratio, the Pearson product moment correlation
coefficient, Johnson distributions, normal scores and generalized
hypergeometric distributions.  In addition two random number generators of
George Marsaglia are included.")
    (license license:gpl2+)))

(define-public r-ksamples
  (package
    (name "r-ksamples")
    (version "1.2-8")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "kSamples" version))
       (sha256
        (base32
         "15d5q5vpp4wx5rk5kjxjdxpwc8mkq5sbdz8gi07iscrvhzb5rzfr"))))
    (properties `((upstream-name . "kSamples")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-suppdists" ,r-suppdists)))
    (home-page "https://cran.r-project.org/web/packages/kSamples")
    (synopsis "K-Sample rank tests and their combinations")
    (description
     "This package provides tools to compares k samples using the
Anderson-Darling test, Kruskal-Wallis type tests with different rank score
criteria, Steel's multiple comparison test, and the Jonckheere-Terpstra (JT)
test.  It computes asymptotic, simulated or (limited) exact P-values, all
valid under randomization, with or without ties, or conditionally under random
sampling from populations, given the observed tie pattern.  Except for Steel's
test and the JT test it also combines these tests across several blocks of
samples.")
    (license license:gpl2+)))

(define-public r-cvst
  (package
    (name "r-cvst")
    (version "0.2-2")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "CVST" version))
       (sha256
        (base32
         "05l3yzkfrbds09ah9cdwn2sn4ryhq78lz33ryzrgkv176jc8qjw5"))))
    (properties `((upstream-name . "CVST")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-kernlab" ,r-kernlab)
       ("r-matrix" ,r-matrix)))
    (home-page "https://cran.r-project.org/web/packages/CVST")
    (synopsis "Fast cross-validation via sequential testing")
    (description
     "This package implements the fast cross-validation via sequential
testing (CVST) procedure.  CVST is an improved cross-validation procedure
which uses non-parametric testing coupled with sequential analysis to
determine the best parameter set on linearly increasing subsets of the data.
Additionally to the CVST the package contains an implementation of the
ordinary k-fold cross-validation with a flexible and powerful set of helper
objects and methods to handle the overall model selection process.  The
implementations of the Cochran's Q test with permutations and the sequential
testing framework of Wald are generic and can therefore also be used in other
contexts.")
    (license license:gpl2+)))

(define-public r-squarem
  (package
    (name "r-squarem")
    (version "2017.10-1")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "SQUAREM" version))
       (sha256
        (base32
         "10xj26x7qjyvzndnbjl5krr9wabnb9cbrnp3m7xg673g8ddr12cv"))))
    (properties `((upstream-name . "SQUAREM")))
    (build-system r-build-system)
    (home-page "http://www.jhsph.edu/agingandhealth/People/Faculty_personal_pages/Varadhan.html")
    (synopsis "Squared Extrapolation Methods for Accelerating EM-Like Monotone Algorithms")
    (description
     "This package provides algorithms for accelerating the convergence of
slow, monotone sequences from smooth, contraction mapping such as the EM
algorithm.  It can be used to accelerate any smooth, linearly convergent
acceleration scheme.  A tutorial style introduction to this package is
available in a vignette.")
    (license license:gpl2+)))

(define-public r-lava
  (package
    (name "r-lava")
    (version "1.6.3")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "lava" version))
       (sha256
        (base32
         "0cayjspry3r2lcbvl77v5v52b2zarri3b8xsf87pw5a3jn9anxcf"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-numderiv" ,r-numderiv)
       ("r-squarem" ,r-squarem)
       ("r-survival" ,r-survival)))
    (home-page "https://github.com/kkholst/lava")
    (synopsis "Latent variable models")
    (description
     "This package provides tools for the estimation and simulation of latent
variable models.")
    (license license:gpl3)))

(define-public r-drr
  (package
    (name "r-drr")
    (version "0.0.3")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "DRR" version))
       (sha256
        (base32
         "1yd1fvllfkcrwg9v322n4wkk4q4q84nvy58y4vac9pdr3yf3i4vl"))))
    (properties `((upstream-name . "DRR")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-cvst" ,r-cvst)
       ("r-kernlab" ,r-kernlab)
       ("r-matrix" ,r-matrix)))
    (home-page "https://cran.r-project.org/web/packages/DRR")
    (synopsis "Dimensionality reduction via regression")
    (description
     "This package provides an implementation of dimensionality reduction via
regression using Kernel Ridge Regression.")
    (license license:gpl3)))

(define-public r-prodlim
  (package
    (name "r-prodlim")
    (version "2018.04.18")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "prodlim" version))
       (sha256
        (base32
         "1aslq87sqwikh8chxc378r38146y7kv79zz0kcq3j93ivx7va8jb"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-kernsmooth" ,r-kernsmooth)
       ("r-lava" ,r-lava)
       ("r-rcpp" ,r-rcpp)
       ("r-survival" ,r-survival)))
    (home-page "https://cran.r-project.org/web/packages/prodlim")
    (synopsis "Product-limit estimation for censored event history analysis")
    (description
     "This package provides a fast and user-friendly implementation of
nonparametric estimators for censored event history (survival) analysis with
the Kaplan-Meier and Aalen-Johansen methods.")
    (license license:gpl2+)))

(define-public r-dimred
  (package
    (name "r-dimred")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "dimRed" version))
       (sha256
        (base32
         "0fasca5fsbrxdwv30hch7vb9snb844l7l8p5fjf239dq45xfy37v"))))
    (properties `((upstream-name . "dimRed")))
    (build-system r-build-system)
    (propagated-inputs `(("r-drr" ,r-drr)))
    (home-page "https://github.com/gdkrmr/dimRed")
    (synopsis "Framework for dimensionality reduction")
    (description
     "This package provides a collection of dimensionality reduction
techniques from R packages and provides a common interface for calling the
methods.")
    (license license:gpl3)))

(define-public r-timedate
  (package
    (name "r-timedate")
    (version "3043.102")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "timeDate" version))
       (sha256
        (base32
         "0wvl5pq261rvbgly7vilk3x3m9xk3ly6il1i5scwdf6srl1vlz1p"))))
    (properties `((upstream-name . "timeDate")))
    (build-system r-build-system)
    (home-page "https://www.rmetrics.org")
    (synopsis "Chronological and calendar objects")
    (description
     "This package provides an environment for teaching \"Financial
Engineering and Computational Finance\" and for managing chronological and
calendar objects.")
    (license license:gpl2+)))

(define-public r-magic
  (package
    (name "r-magic")
    (version "1.5-8")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "magic" version))
       (sha256
        (base32
         "083cgpp3v03li0h8597b3g21pd9lkbmn9pyssblnhc800mpc52vz"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-abind" ,r-abind)))
    (home-page "https://github.com/RobinHankin/magic.git")
    (synopsis "Create and investigate magic squares")
    (description
     "This package provides a collection of efficient, vectorized algorithms
for the creation and investigation of magic squares and hypercubes, including
a variety of functions for the manipulation and analysis of arbitrarily
dimensioned arrays.")
    (license license:gpl2)))

(define-public r-geometry
  (package
    (name "r-geometry")
    (version "0.3-6")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "geometry" version))
       (sha256
        (base32
         "0s09vi0rr0smys3an83mz6fk41bplxyz4myrbiinf4qpk6n33qib"))))
    (build-system r-build-system)
    (propagated-inputs `(("r-magic" ,r-magic)))
    (home-page "http://geometry.r-forge.r-project.org/")
    (synopsis "Mesh generation and surface tesselation")
    (description
     "This package makes the qhull library available in R, in a similar manner
as in Octave.  Qhull computes convex hulls, Delaunay triangulations, halfspace
intersections about a point, Voronoi diagrams, furthest-site Delaunay
triangulations, and furthest-site Voronoi diagrams.  It runs in 2-d, 3-d, 4-d,
and higher dimensions.  It implements the Quickhull algorithm for computing
the convex hull.  Qhull does not support constrained Delaunay triangulations,
or mesh generation of non-convex objects, but the package does include some R
functions that allow for this.  Currently the package only gives access to
Delaunay triangulation and convex hull computation.")
    ;; The Qhull sources are included and are distributed under a custom
    ;; non-copyleft license.  The R sources are released under GPL version 2.
    (license (list license:gpl2
                   (license:non-copyleft "http://www.qhull.org/COPYING.txt")))))

(define-public r-ddalpha
  (package
    (name "r-ddalpha")
    (version "1.3.4")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "ddalpha" version))
       (sha256
        (base32
         "16cn0bhbaz9l9k4y79sv2d4f7pvs7dyka273y89igs5jvr99kfj1"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-bh" ,r-bh)
       ("r-class" ,r-class)
       ("r-geometry" ,r-geometry)
       ("r-mass" ,r-mass)
       ("r-rcpp" ,r-rcpp)
       ("r-robustbase" ,r-robustbase)
       ("r-sfsmisc" ,r-sfsmisc)))
    (native-inputs
     `(("gfortran" ,gfortran)))
    (home-page "https://cran.r-project.org/web/packages/ddalpha")
    (synopsis "Depth-Based classification and calculation of data depth")
    (description
     "This package contains procedures for depth-based supervised learning,
which are entirely non-parametric, in particular the DDalpha-procedure (Lange,
Mosler and Mozharovskyi, 2014).  The training data sample is transformed by a
statistical depth function to a compact low-dimensional space, where the final
classification is done.  It also offers an extension to functional data and
routines for calculating certain notions of statistical depth functions.  50
multivariate and 5 functional classification problems are included.")
    (license license:gpl2)))

(define-public r-gower
  (package
    (name "r-gower")
    (version "0.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "gower" version))
       (sha256
        (base32
         "1mbrj1lam3jfbby2j32shmmj5cn09zx3rkxbamq7q8sdg39b54gb"))))
    (build-system r-build-system)
    (native-inputs
     `(("r-knitr" ,r-knitr)))
    (home-page "https://github.com/markvanderloo/gower")
    (synopsis "Gower's distance")
    (description
     "This package provides tools to compute Gower's distance (or similarity)
coefficient between records, and to compute the top-n matches between records.
Core algorithms are executed in parallel on systems supporting OpenMP.")
    (license license:gpl3)))

(define-public r-rcpproll
  (package
    (name "r-rcpproll")
    (version "0.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "RcppRoll" version))
       (sha256
        (base32
         "0srzfhzkk42kzrdjnhbb37946jp1p688rgysy6k3i2is8jb21zyb"))))
    (properties `((upstream-name . "RcppRoll")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-rcpp" ,r-rcpp)))
    (home-page "https://cran.r-project.org/web/packages/RcppRoll")
    (synopsis "Efficient rolling and windowed operations")
    (description
     "This package provides fast and efficient routines for common rolling /
windowed operations.  Routines for the efficient computation of windowed mean,
median, sum, product, minimum, maximum, standard deviation and variance are
provided.")
    (license license:gpl2+)))

(define-public r-ipred
  (package
    (name "r-ipred")
    (version "0.9-7")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "ipred" version))
       (sha256
        (base32
         "0q53cqs46501wsd4cmfsmr78l8nv1hkbamk9m0ns5qy02df5r254"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-class" ,r-class)
       ("r-mass" ,r-mass)
       ("r-nnet" ,r-nnet)
       ("r-prodlim" ,r-prodlim)
       ("r-rpart" ,r-rpart)
       ("r-survival" ,r-survival)))
    (home-page "https://cran.r-project.org/web/packages/ipred")
    (synopsis "Improved predictors")
    (description
     "This package provides improved predictive models by indirect
classification and bagging for classification, regression and survival
problems as well as resampling based estimators of prediction error.")
    (license license:gpl2+)))

(define-public r-psych
  (package
    (name "r-psych")
    (version "1.8.4")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "psych" version))
       (sha256
        (base32
         "1kzv9nc7rwn1sj1zxd8xrbs6c7qlka7j2c8lsr4f20znkd3qx8gf"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-foreign" ,r-foreign)
       ("r-lattice" ,r-lattice)
       ("r-mnormt" ,r-mnormt)
       ("r-nlme" ,r-nlme)))
    (home-page "https://cran.r-project.org/web/packages/psych/")
    (synopsis "Procedures for psychological, psychometric, and personality research")
    (description
     "This package provides a general purpose toolbox for personality,
psychometric theory and experimental psychology.  Functions are primarily for
multivariate analysis and scale construction using factor analysis, principal
component analysis, cluster analysis and reliability analysis, although others
provide basic descriptive statistics.  Item Response Theory is done using
factor analysis of tetrachoric and polychoric correlations.  Functions for
analyzing data at multiple levels include within and between group statistics,
including correlations and factor analysis.  Functions for simulating and
testing particular item and test structures are included.  Several functions
serve as a useful front end for structural equation modeling.  Graphical
displays of path diagrams, factor analysis and structural equation models are
created using basic graphics.")
    (license license:gpl2+)))

(define-public r-broom
  (package
    (name "r-broom")
    (version "0.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "broom" version))
       (sha256
        (base32
         "1r3831vq0fd5sh5841xr844sghg88z7ws91hg4jgnzbbkxfjp4ag"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-backports" ,r-backports)
       ("r-dplyr" ,r-dplyr)
       ("r-nlme" ,r-nlme)
       ("r-purrr" ,r-purrr)
       ("r-reshape2" ,r-reshape2)
       ("r-stringr" ,r-stringr)
       ("r-tibble" ,r-tibble)
       ("r-tidyr" ,r-tidyr)))
    (home-page "https://github.com/tidyverse/broom")
    (synopsis "Convert statistical analysis objects into tidy data frames")
    (description
     "This package provides tools to convert statistical analysis objects from
R into tidy data frames, so that they can more easily be combined, reshaped
and otherwise processed with tools like @code{dplyr}, @code{tidyr} and
@code{ggplot2}.  The package provides three S3 generics: @code{tidy}, which
summarizes a model's statistical findings such as coefficients of a
regression; @code{augment}, which adds columns to the original data such as
predictions, residuals and cluster assignments; and @code{glance}, which
provides a one-row summary of model-level statistics.")
    (license license:expat)))

(define-public r-recipes
  (package
    (name "r-recipes")
    (version "0.1.3")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "recipes" version))
       (sha256
        (base32
         "1vqh3pxs4n1azhnd1lzg91vasya6g323kllhbrw177j7kdxqyimy"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-broom" ,r-broom)
       ("r-ddalpha" ,r-ddalpha)
       ("r-dimred" ,r-dimred)
       ("r-dplyr" ,r-dplyr)
       ("r-gower" ,r-gower)
       ("r-ipred" ,r-ipred)
       ("r-lubridate" ,r-lubridate)
       ("r-magrittr" ,r-magrittr)
       ("r-matrix" ,r-matrix)
       ("r-pls" ,r-pls)
       ("r-purrr" ,r-purrr)
       ("r-rcpproll" ,r-rcpproll)
       ("r-rlang" ,r-rlang)
       ("r-tibble" ,r-tibble)
       ("r-tidyselect" ,r-tidyselect)
       ("r-timedate" ,r-timedate)))
    (home-page "https://github.com/topepo/recipes")
    (synopsis "Preprocessing tools to create design matrices")
    (description
     "Recipes is an extensible framework to create and preprocess design
matrices.  Recipes consist of one or more data manipulation and analysis
\"steps\".  Statistical parameters for the steps can be estimated from an
initial data set and then applied to other data sets.  The resulting design
matrices can then be used as inputs into statistical or machine learning
models.")
    (license license:gpl2)))

(define-public r-pdist
  (package
    (name "r-pdist")
    (version "1.2")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "pdist" version))
       (sha256
        (base32
         "18nd3mgad11f2zmwcp0w3sxlch4a9y6wp8dfdyzvjn7y4b4bq0dd"))))
    (build-system r-build-system)
    (home-page "https://github.com/jeffwong/pdist")
    (synopsis "Partitioned distance function")
    (description
     "Pdist computes the euclidean distance between rows of a matrix X and
rows of another matrix Y.  Previously, this could be done by binding the two
matrices together and calling @code{dist}, but this creates unnecessary
computation by computing the distances between a row of X and another row of
X, and likewise for Y.  Pdist strictly computes distances across the two
matrices, not within the same matrix, making computations significantly faster
for certain use cases.")
    (license license:gpl3+)))

(define-public r-ggrepel
  (package
    (name "r-ggrepel")
    (version "0.8.0")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "ggrepel" version))
       (sha256
        (base32
         "1m3p84d6nh9mzzvxb82vgig3ngcvkz86rjwzl9a66ckdf5p611k3"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-ggplot2" ,r-ggplot2)
       ("r-rcpp" ,r-rcpp)
       ("r-scales" ,r-scales)))
    (home-page "http://github.com/slowkow/ggrepel")
    (synopsis "Repulsive text and label geometries for ggplot2")
    (description
     "This package provides text and label geometries for ggplot2 that help to
avoid overlapping text labels.  Labels repel away from each other and away
from the data points.")
    (license license:gpl3)))

(define-public r-corrplot
  (package
    (name "r-corrplot")
    (version "0.84")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "corrplot" version))
       (sha256
        (base32
         "1k03qd8db7pwg1v318xapx5mpiypiz2n07qr19c4b45diri5xkhd"))))
    (build-system r-build-system)
    (home-page "https://github.com/taiyun/corrplot")
    (synopsis "Visualization of a correlation matrix")
    (description
     "This package provides a graphical display of a correlation matrix or
general matrix.  It also contains some algorithms to do matrix reordering.  In
addition, corrplot is good at details, including choosing color, text labels,
color labels, layout, etc.")
    ;; Any version of the GPL
    (license license:gpl2+)))

(define-public r-stringdist
  (package
    (name "r-stringdist")
    (version "0.9.5.1")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "stringdist" version))
       (sha256
        (base32
         "0gap1g9xwhp0zxqsznkc2carpvi80z03prr4q8m528684lznx2xa"))))
    (build-system r-build-system)
    (home-page "https://github.com/markvanderloo/stringdist")
    (synopsis "Approximate string matching and string distance functions")
    (description
     "This package implements an approximate string matching version of R's
native @code{match} function.  It can calculate various string distances based
on edits (Damerau-Levenshtein, Hamming, Levenshtein, optimal sting alignment),
qgrams (q- gram, cosine, jaccard distance) or heuristic metrics (Jaro,
Jaro-Winkler).  An implementation of soundex is provided as well.  Distances
can be computed between character vectors while taking proper care of encoding
or between integer vectors representing generic sequences.")
    (license license:gpl3+)))

(define-public r-ucminf
  (package
    (name "r-ucminf")
    (version "1.1-4")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "ucminf" version))
       (sha256
        (base32
         "01vggwg1w71k98qs6fhb0x1843vi322mf4g3hbclks94kcpkisx2"))))
    (build-system r-build-system)
    (native-inputs `(("gfortran" ,gfortran)))
    (home-page "https://cran.r-project.org/web/packages/ucminf/")
    (synopsis "General-purpose unconstrained non-linear optimization")
    (description
     "This package provides an implementation of an algorithm for
general-purpose unconstrained non-linear optimization.  The algorithm is of
quasi-Newton type with BFGS updating of the inverse Hessian and soft line
search with a trust region type monitoring of the input to the line search
algorithm.  The interface of @code{ucminf} is designed for easy interchange
with the package @code{optim}.")
    (license license:gpl2+)))

(define-public r-ordinal
  (package
    (name "r-ordinal")
    (version "2018.8-25")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "ordinal" version))
       (sha256
        (base32
         "03cv9hcrw8j3lhamzhz8sk2p3ns4cw9z41x49h301k2b3pajv43h"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-mass" ,r-mass)
       ("r-matrix" ,r-matrix)
       ("r-numderiv" ,r-numderiv)
       ("r-ucminf" ,r-ucminf)))
    (home-page "https://github.com/runehaubo/ordinal")
    (synopsis "Regression models for ordinal data")
    (description
     "This package provides an implementation of cumulative link (mixed)
models also known as ordered regression models, proportional odds models,
proportional hazards models for grouped survival times and ordered models.
Estimation is via maximum likelihood and mixed models are fitted with the
Laplace approximation and adaptive Gauss-Hermite quadrature.")
    (license license:gpl2+)))

(define-public r-jomo
  (package
    (name "r-jomo")
    (version "2.6-4")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "jomo" version))
       (sha256
        (base32
         "05g2rj9g7rgyb22b0gybw042nydyqsqsb31v05hifzavri8ij01x"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-lme4" ,r-lme4)
       ("r-ordinal" ,r-ordinal)
       ("r-survival" ,r-survival)))
    (home-page "https://cran.r-project.org/web/packages/jomo/")
    (synopsis "Multilevel Joint Modelling Multiple Imputation")
    (description
     "Similarly to Schafer's package pan, jomo is a package for multilevel
joint modelling multiple imputation @url{Carpenter and Kenward (2013),
http://doi.org/10.1002/9781119942283}.  Novel aspects of jomo are the
possibility of handling binary and categorical data through latent normal
variables, the option to use cluster-specific covariance matrices and to
impute compatibly with the substantive model.")
    (license license:gpl2)))

(define-public r-pan
  (package
    (name "r-pan")
    (version "1.6")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "pan" version))
       (sha256
        (base32
         "1dk3jjj826p7xrz10qz04vyc068xnypg7bp0pj4c32z3da0xzh5d"))))
    (build-system r-build-system)
    (native-inputs `(("gfortran" ,gfortran)))
    (home-page "https://cran.r-project.org/web/packages/pan/")
    (synopsis "Multiple imputation for multivariate panel or clustered data")
    (description
     "This package implements multiple imputation for multivariate panel or
clustered data.")
    (license license:gpl3)))

(define-public r-mitml
  (package
    (name "r-mitml")
    (version "0.3-6")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "mitml" version))
       (sha256
        (base32
         "1pkqv4qazih3byws5z6629pp232n8ra56lip7502727b0b4bsndw"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-haven" ,r-haven)
       ("r-jomo" ,r-jomo)
       ("r-pan" ,r-pan)))
    (home-page "https://cran.r-project.org/web/packages/mitml/")
    (synopsis "Tools for multiple imputation in multilevel modeling")
    (description
     "This package provides tools for multiple imputation of missing data in
multilevel modeling.  It includes a user-friendly interface to the packages
pan and jomo, and several functions for visualization, data management and the
analysis of multiply imputed data sets.")
    (license license:gpl2+)))

(define-public r-mice
  (package
    (name "r-mice")
    (version "3.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "mice" version))
       (sha256
        (base32
         "1p0ipbqk5aqdi7iikw3qrjyvdi9sdhpnw1h5mwakwvv0yl0pzbyx"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-broom" ,r-broom)
       ("r-dplyr" ,r-dplyr)
       ("r-lattice" ,r-lattice)
       ("r-mass" ,r-mass)
       ("r-mitml" ,r-mitml)
       ("r-nnet" ,r-nnet)
       ("r-rcpp" ,r-rcpp)
       ("r-rlang" ,r-rlang)
       ("r-rpart" ,r-rpart)
       ("r-survival" ,r-survival)))
    (home-page "https://cran.r-project.org/web/packages/mice/")
    (synopsis "Multivariate imputation by chained equations")
    (description
     "Multiple imputation using @dfn{Fully Conditional Specification} (FCS)
implemented by the MICE algorithm as described in @url{Van Buuren and
Groothuis-Oudshoorn (2011), http://doi.org/10.18637/jss.v045.i03}.  Each
variable has its own imputation model.  Built-in imputation models are
provided for continuous data (predictive mean matching, normal), binary
data (logistic regression), unordered categorical data (polytomous logistic
regression) and ordered categorical data (proportional odds).  MICE can also
impute continuous two-level data (normal model, pan, second-level variables).
Passive imputation can be used to maintain consistency between variables.
Various diagnostic plots are available to inspect the quality of the
imputations.")
    ;; Any of these two versions.
    (license (list license:gpl2 license:gpl3))))

(define-public r-truncnorm
  (package
    (name "r-truncnorm")
    (version "1.0-8")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "truncnorm" version))
       (sha256
        (base32
         "0zn88wdd58223kibk085rhsikl4yhlrwiyq109hzjg06hy6lwmj9"))))
    (build-system r-build-system)
    (home-page "https://cran.r-project.org/web/packages/truncnorm/")
    (synopsis "Truncated normal distribution")
    (description "This package provides functions for the truncated normal
distribution with mean equal to @code{mean} and standard deviation equal to
@code{sd}.  It includes density, distribution, quantile, and expected value
functions, as well as a random generation function.")
    (license license:gpl2)))

(define-public r-rsolnp
  (package
    (name "r-rsolnp")
    (version "1.16")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "Rsolnp" version))
       (sha256
        (base32
         "0w7nkj6igr0gi7r7jg950lsx7dj6aipgxi6vbjsf5f5yc9h7fhii"))))
    (properties `((upstream-name . "Rsolnp")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-truncnorm" ,r-truncnorm)))
    (home-page "https://cran.r-project.org/web/packages/Rsolnp/")
    (synopsis "General non-linear optimization")
    (description "The Rsolnp package implements a general non-linear augmented
Lagrange multiplier method solver, a @dfn{sequential quadratic
programming} (SQP) based solver).")
    ;; Any version of the GPL.
    (license license:gpl2+)))

(define-public r-hardyweinberg
  (package
    (name "r-hardyweinberg")
    (version "1.6.1")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "HardyWeinberg" version))
       (sha256
        (base32
         "16n8qanxx0p5ny5zqxafn8hwb1xv94y1wig1iql8as5a5qh8lwcz"))))
    (properties `((upstream-name . "HardyWeinberg")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-mice" ,r-mice)
       ("r-rcpp" ,r-rcpp)
       ("r-rsolnp" ,r-rsolnp)))
    (home-page "https://cran.r-project.org/package=HardyWeinberg")
    (synopsis "Statistical tests and graphics for Hardy-Weinberg equilibrium")
    (description
     "This package contains tools for exploring Hardy-Weinberg equilibrium for
diallelic genetic marker data.  All classical tests (chi-square, exact,
likelihood-ratio and permutation tests) for Hardy-Weinberg equilibrium are
included in the package, as well as functions for power computation and for
the simulation of marker data under equilibrium and disequilibrium.  Routines
for dealing with markers on the X-chromosome are included.  Functions for
testing equilibrium in the presence of missing data by using multiple
imputation are also provided.  Implements several graphics for exploring the
equilibrium status of a large set of diallelic markers: ternary plots with
acceptance regions, log-ratio plots and Q-Q plots.")
    (license license:gpl2+)))

(define-public r-sm
  (package
    (name "r-sm")
    (version "2.2-5.5")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "sm" version))
       (sha256
        (base32
         "1rw2mxygxsmk8mn4wag1ppjgzk0rlvh6zd8q02qrhjrn9jhi5qj3"))))
    (build-system r-build-system)
    (native-inputs `(("gfortran" ,gfortran)))
    (home-page "http://www.stats.gla.ac.uk/~adrian/sm/")
    (synopsis "Smoothing methods for nonparametric regression and density estimation")
    (description
     "This is software accompanying the book 'Applied Smoothing Techniques for
Data Analysis---The Kernel Approach with S-Plus Illustrations', Oxford
University Press.  It provides smoothing methods for nonparametric regression
and density estimation")
    (license license:gpl2+)))

(define-public r-venndiagram
  (package
    (name "r-venndiagram")
    (version "1.6.20")
    (source (origin
              (method url-fetch)
              (uri (cran-uri "VennDiagram" version))
              (sha256
               (base32
                "1ic1jaxzw98si2p4n1fl4n3myhd7fpw0njb634cwhviwybzv6775"))))
    (properties `((upstream-name . "VennDiagram")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-futile-logger" ,r-futile-logger)))
    (home-page "https://cran.r-project.org/web/packages/VennDiagram/")
    (synopsis "Generate High-Resolution Venn and Euler Plots")
    (description
     "This package provides a set of functions to generate high-resolution
Venn and Euler plots.  It includes handling for several special cases,
including two-case scaling, and extensive customization of plot shape and
structure.")
    (license license:gpl2+)))

(define-public r-vioplot
  (package
    (name "r-vioplot")
    (version "0.2")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "vioplot" version))
       (sha256
        (base32
         "16wkb26kv6qr34hv5zgqmgq6zzgysg9i78pvy2c097lr60v087v0"))))
    (build-system r-build-system)
    (propagated-inputs `(("r-sm" ,r-sm)))
    (home-page "http://wsopuppenkiste.wiso.uni-goettingen.de/~dadler")
    (synopsis "Violin plot")
    (description
     "This package provides a violin plot, which is a combination of a box
plot and a kernel density plot.")
    (license license:bsd-3)))

(define-public r-rsofia
  (package
    (name "r-rsofia")
    (version "1.1")
    (source (origin
              (method url-fetch)
              ;; This package has been removed from CRAN, so we can
              ;; only fetch it from the archives.
              (uri (string-append "https://cran.r-project.org/src/"
                                  "contrib/Archive/RSofia/RSofia_"
                                  version ".tar.gz"))
              (sha256
               (base32
                "0q931y9rcf6slb0s2lsxhgqrzy4yqwh8hb1124nxg0bjbxvjbihn"))))
    (properties `((upstream-name . "RSofia")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-rcpp" ,r-rcpp)))
    (home-page "https://cran.r-project.org/src/contrib/Archive/RSofia")
    (synopsis "Port of sofia-ml to R")
    (description "This package is a port of sofia-ml to R.  Sofia-ml is a
suite of fast incremental algorithms for machine learning that can be used for
training models for classification or ranking.")
    (license license:asl2.0)))

(define-public r-xts
  (package
    (name "r-xts")
    (version "0.11-0")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "xts" version))
       (sha256
        (base32
         "1v50yn4bsjzdyk7r90isn6dxmpkapillrhpx3gqsshd180vwzqk9"))))
    (build-system r-build-system)
    (propagated-inputs `(("r-zoo" ,r-zoo)))
    (home-page "https://github.com/joshuaulrich/xts")
    (synopsis "Extensible time series")
    (description
     "This package provides for uniform handling of R's different time-based
data classes by extending @code{zoo}, maximizing native format information
preservation and allowing for user-level customization and extension, while
simplifying cross-class interoperability.")
    (license license:gpl2+)))

(define-public r-performanceanalytics
  (package
    (name "r-performanceanalytics")
    (version "1.5.2")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "PerformanceAnalytics" version))
       (sha256
        (base32
         "01bgm57z079g6r505w3bj293zkbd49fwa8sg55z87vizwavipml6"))))
    (properties
     `((upstream-name . "PerformanceAnalytics")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-quadprog" ,r-quadprog)
       ("r-xts" ,r-xts)
       ("r-zoo" ,r-zoo)))
    (home-page "https://r-forge.r-project.org/projects/returnanalytics/")
    (synopsis "Econometric tools for performance and risk analysis")
    (description "This is a collection of econometric functions for
performance and risk analysis.  This package aims to aid practitioners and
researchers in utilizing the latest research in analysis of non-normal return
streams.  In general, it is most tested on return (rather than price) data on
a regular scale, but most functions will work with irregular return data as
well, and increasing numbers of functions will work with P&L or price data
where possible.")
    ;; Either version may be picked.
    (license (list license:gpl2 license:gpl3))))

(define-public r-laeken
  (package
    (name "r-laeken")
    (version "0.4.6")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "laeken" version))
       (sha256
        (base32
         "1rhkv1kk508pwln1d325iq4fink2ncssps0ypxi52j9d7wk78la6"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-boot" ,r-boot)
       ("r-mass" ,r-mass)))
    (home-page "https://cran.r-project.org/web/packages/laeken/")
    (synopsis "Estimation of indicators on social exclusion and poverty")
    (description "This package provides tools for the estimation of indicators
on social exclusion and poverty, as well as an implementation of Pareto tail
modeling for empirical income distributions.")
    (license license:gpl2+)))

(define-public r-vcd
  (package
    (name "r-vcd")
    (version "1.4-4")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "vcd" version))
       (sha256
        (base32
         "1lp99h0wvsc61l1dgcqjxdrcgpgw88ak430cdsv43kmm43qssqd5"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-colorspace" ,r-colorspace)
       ("r-lmtest" ,r-lmtest)
       ("r-mass" ,r-mass)))
    (home-page "https://cran.r-project.org/web/packages/vcd/")
    (synopsis "Visualizing categorical data")
    (description "This package provides visualization techniques, data sets,
summary and inference procedures aimed particularly at categorical data.
Special emphasis is given to highly extensible grid graphics.  The package was
originally inspired by the book \"Visualizing Categorical Data\" by Michael
Friendly and is now the main support package for a new book, \"Discrete Data
Analysis with R\" by Michael Friendly and David Meyer (2015).")
    (license license:gpl2)))

(define-public r-ica
  (package
    (name "r-ica")
    (version "1.0-2")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "ica" version))
       (sha256
        (base32
         "0ya1nph1zwhad0bfz4yxs27kl45yk1dhnphdlrq34p8pqrpmj8g7"))))
    (build-system r-build-system)
    (home-page "https://cran.r-project.org/web/packages/ica/")
    (synopsis "Independent component analysis")
    (description "This package provides tools for @dfn{Independent Component
Analysis} (ICA) using various algorithms: FastICA,
Information-Maximization (Infomax), and @dfn{Joint Approximate Diagonalization
of Eigenmatrices} (JADE).")
    (license license:gpl2+)))

(define-public r-dtw
  (package
    (name "r-dtw")
    (version "1.20-1")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "dtw" version))
       (sha256
        (base32
         "1w301xwizncy5r8v9rwwdxfshydgp3l1pnjla1fjn6n8lx3imjj3"))))
    (build-system r-build-system)
    (propagated-inputs `(("r-proxy" ,r-proxy)))
    (home-page "http://dtw.r-forge.r-project.org/")
    (synopsis "Dynamic Time Warping Algorithms")
    (description "This package provides a comprehensive implementation of
@dfn{dynamic time warping} (DTW) algorithms in R.  DTW computes the
optimal (least cumulative distance) alignment between points of two time
series.  Common DTW variants covered include local (slope) and global (window)
constraints, subsequence matches, arbitrary distance definitions,
normalizations, minimum variance matching, and so on.")
    (license license:gpl2+)))

(define-public r-sdmtools
  (package
    (name "r-sdmtools")
    (version "1.1-221")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "SDMTools" version))
       (sha256
        (base32
         "1kacrpamshv7wz83yn45sfbw4m9c44xrrngzcklnwx8gcxx2knm6"))))
    (properties `((upstream-name . "SDMTools")))
    (build-system r-build-system)
    (propagated-inputs `(("r-r-utils" ,r-r-utils)))
    (home-page "http://www.rforge.net/SDMTools/")
    (synopsis "Species distribution modelling tools")
    (description "This packages provides a set of tools for post processing
the outcomes of species distribution modeling exercises.  It includes novel
methods for comparing models and tracking changes in distributions through
time.  It further includes methods for visualizing outcomes, selecting
thresholds, calculating measures of accuracy and landscape fragmentation
statistics, etc.")
    (license license:gpl3+)))

(define-public r-scatterplot3d
  (package
    (name "r-scatterplot3d")
    (version "0.3-41")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "scatterplot3d" version))
       (sha256
        (base32
         "152xqz9c70qab86mpgng049gxsg5f4fpf1m8dh93fb9v1avjd0sc"))))
    (build-system r-build-system)
    (home-page "https://cran.r-project.org/web/packages/scatterplot3d/")
    (synopsis "3D scatter plot")
    (description "This package provides an implementation of scatter plots for
plotting.  a three dimensional point cloud.")
    (license license:gpl2)))

(define-public r-ggridges
  (package
    (name "r-ggridges")
    (version "0.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "ggridges" version))
       (sha256
        (base32
         "1znvsbl3px8dddpjgdrygnpz4s685wizi0jnjvx2hrz58i0chjqj"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-ggplot2" ,r-ggplot2)
       ("r-plyr" ,r-plyr)
       ("r-scales" ,r-scales)
       ("r-withr" ,r-withr)))
    (home-page "https://github.com/clauswilke/ggridges")
    (synopsis "Ridgeline plots in ggplot2")
    (description
     "Ridgeline plots provide a convenient way of visualizing changes in
distributions over time or space.  This package enables the creation of such
plots in @code{ggplot2}.")
    (license license:gpl2)))

(define-public r-ggjoy
  (package
    (name "r-ggjoy")
    (version "0.4.1")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "ggjoy" version))
       (sha256
        (base32
         "012md2m0jqfcccb933j423m3ck31v3p0pd41gjxpyg9082y7ixyj"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-ggplot2" ,r-ggplot2)
       ("r-ggridges" ,r-ggridges)))
    (home-page "https://github.com/clauswilke/ggjoy")
    (synopsis "Joyplots in ggplot2")
    (description "Joyplots provide a convenient way of visualizing changes in
distributions over time or space.  This package enables the creation of such
plots in @code{ggplot2}.")
    (license license:gpl2)))

(define-public r-cli
  (package
    (name "r-cli")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "cli" version))
       (sha256
        (base32
         "07as3dr7vwx02p3qgzlmxz1dlrd3x3lysrzp222ip9jcjpydp8wg"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-assertthat" ,r-assertthat)
       ("r-crayon" ,r-crayon)))
    (home-page "https://github.com/r-lib/cli#readme")
    (synopsis "Helpers for developing command line interfaces")
    (description "This package provides a suite of tools designed to build
attractive command line interfaces (CLIs).  It includes tools for drawing
rules, boxes, trees, and Unicode symbols with ASCII alternatives.")
    (license license:expat)))

(define-public r-argparser
  (package
    (name "r-argparser")
    (version "0.4")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "argparser" version))
       (sha256
        (base32
         "0s1wxshx4jk69wfxhycx973q6y8cmqrfymyjklhq1i8xrj0kmmx9"))))
    (build-system r-build-system)
    (home-page "https://bitbucket.org/djhshih/argparser")
    (synopsis "Command-line argument parser")
    (description
     "This package provides a cross-platform command-line argument parser
written purely in R with no external dependencies.  It is useful with the
Rscript front-end and facilitates turning an R script into an executable
script.")
    (license license:gpl3+)))

(define-public r-debugme
  (package
    (name "r-debugme")
    (version "1.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "debugme" version))
       (sha256
        (base32
         "1c9sg55zvf10h8198jdnpamm6f66lzw3c3jnmdp9ls6na0j0xbjd"))))
    (build-system r-build-system)
    (propagated-inputs `(("r-crayon" ,r-crayon)))
    (home-page "https://github.com/r-lib/debugme#readme")
    (synopsis "Debug R packages")
    (description
     "This package allows the user to specify debug messages as special string
constants, and control debugging of packages via environment variables.")
    (license license:expat)))

(define-public r-processx
  (package
    (name "r-processx")
    (version "3.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "processx" version))
       (sha256
        (base32
         "1pzx4ap4xa07gf9zkd6hacdsnb9sp3kb60a7v7ljl0ywrcpn1fn4"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-assertthat" ,r-assertthat)
       ("r-crayon" ,r-crayon)
       ("r-ps" ,r-ps)
       ("r-r6" ,r-r6)
       ("r-testthat" ,r-testthat)))
    (home-page "https://github.com/r-lib/processx3")
    (synopsis "Execute and control system processes")
    (description
     "This package provides portable tools to run system processes in the
background.  It can check if a background process is running; wait on a
background process to finish; get the exit status of finished processes; kill
background processes and their children; restart processes.  It can read the
standard output and error of the processes, using non-blocking connections.
@code{processx} can poll a process for standard output or error, with a
timeout.  It can also poll several processes at once.")
    (license license:expat)))

(define-public r-tsp
  (package
    (name "r-tsp")
    (version "1.1-6")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "TSP" version))
       (sha256
        (base32
         "1ym97xl2icjpfkrici0wig29w06bb704hp51v7h5liygjlwpkhlc"))))
    (properties `((upstream-name . "TSP")))
    (build-system r-build-system)
    (propagated-inputs `(("r-foreach" ,r-foreach)))
    (home-page "https://cran.r-project.org/web/packages/TSP/")
    (synopsis "Traveling salesperson problem (TSP)")
    (description "This package provides basic infrastructure and some
algorithms for the @dfn{traveling salesperson problem}(TSP) (also known as the
traveling salesman problem).")
    (license license:gpl3)))

(define-public r-qap
  (package
    (name "r-qap")
    (version "0.1-1")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "qap" version))
       (sha256
        (base32
         "0d2d1ni1camixyi45lfy00f4pn3p063k7bsi8gj5scp6n15mdgb0"))))
    (build-system r-build-system)
    (native-inputs `(("gfortran" ,gfortran)))
    (home-page "https://cran.r-project.org/web/packages/qap/")
    (synopsis "Heuristics for the quadratic assignment problem (QAP)")
    (description "This package implements heuristics for the @dfn{quadratic
assignment problem} (QAP).  Currently only a simulated annealing heuristic is
available.")
    (license license:gpl3)))

(define-public r-gclus
  (package
    (name "r-gclus")
    (version "1.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "gclus" version))
       (sha256
        (base32
         "02ba6zj9bjwrzykamjp40ajynx9xjx9h2i85n0ym0r5lcki4x6fn"))))
    (build-system r-build-system)
    (propagated-inputs `(("r-cluster" ,r-cluster)))
    (home-page "https://cran.r-project.org/web/packages/gclus/")
    (synopsis "Clustering graphics")
    (description "This package orders panels in scatterplot matrices and
parallel coordinate displays by some merit index.  It contains various indices
of merit, ordering functions, and enhanced versions of @code{pairs} and
@code{parcoord} which color panels according to their merit level.")
    (license license:gpl2+)))

(define-public r-webshot
  (package
    (name "r-webshot")
    (version "0.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "webshot" version))
       (sha256
        (base32
         "07r71zzmggp4jf92x4ws4wg6v1x98vaj01lsar85bnb30n5vx8gh"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-jsonlite" ,r-jsonlite)
       ("r-magrittr" ,r-magrittr)
       ("r-processx" ,r-processx)
       ("r-withr" ,r-withr)))
    (home-page "https://github.com/wch/webshot/")
    (synopsis "Take screenshots of web pages")
    (description
     "Webshot makes it easy to take screenshots of web pages from within R.
It can also run Shiny applications locally and take screenshots of the
application; and it can render and screenshot static as well as interactive R
Markdown documents.")
    (license license:gpl2)))

(define-public r-seriation
  (package
    (name "r-seriation")
    (version "1.2-3")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "seriation" version))
       (sha256
        (base32
         "1q6hw4hjw224b4y0dc0j630v2pgj6sn455nwkilb70w8k31hpk92"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-cluster" ,r-cluster)
       ("r-colorspace" ,r-colorspace)
       ("r-dendextend" ,r-dendextend)
       ("r-gclus" ,r-gclus)
       ("r-gplots" ,r-gplots)
       ("r-mass" ,r-mass)
       ("r-qap" ,r-qap)
       ("r-registry" ,r-registry)
       ("r-tsp" ,r-tsp)))
    (native-inputs `(("gfortran" ,gfortran)))
    (home-page "http://s2.smu.edu/IDA/seriation/")
    (synopsis "Infrastructure for ordering objects using seriation")
    (description
     "This package provides infrastructure for seriation with an
implementation of several seriation/sequencing techniques to reorder matrices,
dissimilarity matrices, and dendrograms.  It also provides (optimally)
reordered heatmaps, color images and clustering visualizations like
dissimilarity plots, and visual assessment of cluster tendency plots (VAT and
iVAT).")
    (license license:gpl3)))

(define-public r-xfun
  (package
    (name "r-xfun")
    (version "0.3")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "xfun" version))
       (sha256
        (base32
         "1r11dd49ngmjgbjdv28a9c1jp8cg1l50x0acbsamzz576p8i2wl9"))))
    (build-system r-build-system)
    (home-page "https://github.com/yihui/xfun")
    (synopsis "Miscellaneous functions")
    (description
     "This package provides miscellaneous functions commonly used in other
packages maintained by Yihui Xie.")
    (license license:expat)))

(define-public r-utf8
  (package
    (name "r-utf8")
    (version "1.1.4")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "utf8" version))
       (sha256
        (base32
         "0m0ywg8k3blfiahxvh1i4zn9dksrlc937d2lbza5fc38zjnrrnpn"))))
    (build-system r-build-system)
    (home-page "https://github.com/patperry/r-utf8")
    (synopsis "Unicode text processing")
    (description
     "This package provides tools to process and print UTF-8 encoded
international text (Unicode).  Input, validate, normalize, encode, format, and
display.")
    (license license:asl2.0)))

(define-public r-pillar
  (package
    (name "r-pillar")
    (version "1.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "pillar" version))
       (sha256
        (base32
         "1q6arybmfqxhp5zqj1fri5pb8v7ywcv7bmgf81rrmgl892p4bn5f"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-cli" ,r-cli)
       ("r-crayon" ,r-crayon)
       ("r-fansi" ,r-fansi)
       ("r-rlang" ,r-rlang)
       ("r-utf8" ,r-utf8)))
    (home-page "https://github.com/r-lib/pillar")
    (synopsis "Coloured formatting for columns")
    (description
     "This package provides a @code{pillar} generic designed for formatting
columns of data using the full range of colours provided by modern
terminals.")
    (license license:gpl3)))

(define-public r-uuid
  (package
    (name "r-uuid")
    (version "0.1-2")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "uuid" version))
       (sha256
        (base32
         "1gmisd630fc8ybg845hbg13wmm3pk3npaamrh5wqbc1nqd6p0wfx"))))
    (build-system r-build-system)
    (home-page "http://www.rforge.net/uuid")
    (synopsis "Tools for generating and handling of UUIDs")
    (description
     "This package provides tools for generating and handling of
@dfn{Universally Unique Identifiers} (UUIDs).")
    (license license:expat)))

(define-public r-tinytex
  (package
    (name "r-tinytex")
    (version "0.8")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "tinytex" version))
       (sha256
        (base32
         "1bgpr5i5399jf9n6pg2mm4aamisbhppg082ad0wv1j4g0rlxf1gy"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-xfun" ,r-xfun)))
    (home-page "https://github.com/yihui/tinytex")
    (synopsis "Helper functions for TeX Live and compiling LaTeX documents")
    (description
     "This package provides helper functions to install and maintain the LaTeX
distribution named TinyTeX, a lightweight, cross-platform, portable, and
easy-to-maintain version of TeX Live.  This package also contains helper
functions to compile LaTeX documents, and install missing LaTeX packages
automatically.")
    (license license:expat)))

(define-public r-metap
  (package
    (name "r-metap")
    (version "1.0")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "metap" version))
       (sha256
        (base32
         "18rzvqfzyk8fn54gjvy2qd21nk9w69j7ihww477ma3f3ab6i982h"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-lattice" ,r-lattice)
       ("r-rdpack" ,r-rdpack)))
    (home-page "http://www.dewey.myzen.co.uk/meta/meta.html")
    (synopsis "Meta-analysis of significance values")
    (description
     "The canonical way to perform meta-analysis involves using effect sizes.
When they are not available this package provides a number of methods for
meta-analysis of significance values including the methods of Edgington,
Fisher, Stouffer, Tippett, and Wilkinson; a number of data-sets to replicate
published results; and a routine for graphical display.")
    (license license:gpl2)))

(define-public r-network
  (package
    (name "r-network")
    (version "1.13.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "network" version))
       (sha256
        (base32
         "1bbkbqkqf1d7irfwh08c13c2pfypir1ssvlqrln83irqns1ikdv0"))))
    (build-system r-build-system)
    (home-page "https://statnet.org/")
    (synopsis "Classes for relational data")
    (description
     "This package provides tools to create and modify network objects.  The
@code{network} class can represent a range of relational data types, and
supports arbitrary vertex/edge/graph attributes.")
    (license license:gpl2+)))

(define-public r-statnet-common
  (package
    (name "r-statnet-common")
    (version "4.1.4")
    (source
      (origin
        (method url-fetch)
        (uri (cran-uri "statnet.common" version))
        (sha256
          (base32
            "14dydm4c4dzc4v6ldxpn04q551nczzfablwibrd8lzgja8x9ksic"))))
    (properties
      `((upstream-name . "statnet.common")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-coda" ,r-coda)))
    (home-page "https://statnet.org")
    (synopsis "R scripts and utilities used by the Statnet software")
    (description "This package provides non-statistical utilities used by the
software developed by the Statnet Project.")
    (license license:gpl3)))

(define-public r-sna
  (package
    (name "r-sna")
    (version "2.4")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "sna" version))
       (sha256
        (base32
         "1ks8819qvpdfansfqj9p32s1rhvl26frvbi78m4rx1wd1qcv74i2"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-network" ,r-network)
       ("r-statnet-common" ,r-statnet-common)))
    (home-page "https://statnet.org")
    (synopsis "Tools for social network analysis")
    (description
     "This package provides a range of tools for social network analysis,
including node and graph-level indices, structural distance and covariance
methods, structural equivalence detection, network regression, random graph
generation, and 2D/3D network visualization.")
    (license license:gpl2+)))

(define-public r-ttr
  (package
    (name "r-ttr")
    (version "0.23-3")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "TTR" version))
       (sha256
        (base32
         "07r62ngyzjl4aszdxnr3n6bnbcgcap32yhd430jsilicg8n06di1"))))
    (properties `((upstream-name . "TTR")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-curl" ,r-curl)
       ("r-xts" ,r-xts)
       ("r-zoo" ,r-zoo)))
    (native-inputs `(("gfortran" ,gfortran)))
    (home-page "https://github.com/joshuaulrich/TTR")
    (synopsis "Technical trading rules")
    (description
     "This package provides functions and data to construct technical trading
rules with R.")
    (license license:gpl2)))

(define-public r-leaps
  (package
    (name "r-leaps")
    (version "3.0")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "leaps" version))
       (sha256
        (base32
         "11gjmn1azrjw5xlvdb4gknj9985kck9x8zb9np1rnk2smp6pka2m"))))
    (build-system r-build-system)
    (native-inputs `(("gfortran" ,gfortran)))
    (home-page "https://cran.r-project.org/web/packages/leaps/")
    (synopsis "Regression subset selection")
    (description
     "This package provides tools for regression subset selection, including
exhaustive search.")
    (license license:gpl2+)))

(define-public r-splus2r
  (package
    (name "r-splus2r")
    (version "1.2-2")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "splus2R" version))
       (sha256
        (base32
         "0xrbj8vxy0pc6hl7m8abv71d3hjw47cl51s7j7priadyqczkq6sz"))))
    (properties `((upstream-name . "splus2R")))
    (build-system r-build-system)
    (native-inputs `(("gfortran" ,gfortran)))
    (home-page "https://cran.r-project.org/web/packages/splus2R/")
    (synopsis "Supplemental S-PLUS functionality in R")
    (description
     "Currently there are many functions in S-PLUS that are missing in R.  To
facilitate the conversion of S-PLUS packages to R packages, this package
provides some missing S-PLUS functionality in R.")
    (license license:gpl2)))

(define-public r-ifultools
  (package
    (name "r-ifultools")
    (version "2.0-4")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "ifultools" version))
       (sha256
        (base32
         "0pv2msaa1rmj8csxdclzi2jwg9pfdvh87blj9j3xa3myisglq092"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-mass" ,r-mass)
       ("r-splus2r" ,r-splus2r)))
    (home-page "https://cran.r-project.org/web/packages/ifultools/")
    (synopsis "Insightful research tools")
    (description "This package provides C code used by the wmtsa, fractal, and
sapa R packages.")
    (license license:gpl2)))

(define-public r-sapa
  (package
    (name "r-sapa")
    (version "2.0-2")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "sapa" version))
       (sha256
        (base32
         "056xlh14dnzq4x7sbp7ff2k61jxy7110a742b502vz549qfrr5ds"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-ifultools" ,r-ifultools)
       ("r-splus2r" ,r-splus2r)))
    (home-page "https://cran.r-project.org/web/packages/sapa/")
    (synopsis "Spectral analysis for physical applications")
    (description "This package provides software for the book Spectral
Analysis for Physical Applications, Donald B. Percival and Andrew T. Walden,
Cambridge University Press, 1993.")
    (license license:gpl2)))

(define-public r-quantmod
  (package
    (name "r-quantmod")
    (version "0.4-13")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "quantmod" version))
       (sha256
        (base32
         "16aldg96z7amp5mr90nb8127yy04gxsihfr26km5p3cx3j117yv0"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-curl" ,r-curl)
       ("r-ttr" ,r-ttr)
       ("r-xts" ,r-xts)
       ("r-zoo" ,r-zoo)))
    (home-page "https://cran.r-project.org/web/packages/quantmod/")
    (synopsis "Quantitative financial modelling framework")
    (description "This package provides a quantitative financial modelling
framework to allow users to specify, build, trade, and analyse quantitative
financial trading strategies.")
    (license license:gpl3)))

(define-public r-tseries
  (package
    (name "r-tseries")
    (version "0.10-45")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "tseries" version))
       (sha256
        (base32
         "14s1glh5zzdvdl05a2z7ymhgf962svxf8xircghg5sc649lb33n0"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-quadprog" ,r-quadprog)
       ("r-quantmod" ,r-quantmod)
       ("r-zoo" ,r-zoo)))
    (native-inputs
     `(("gfortran" ,gfortran)))
    (home-page "https://cran.r-project.org/web/packages/tseries/")
    (synopsis "Time series analysis and computational finance")
    (description
     "This package provides functions relating to time series analysis and
computational finance.")
    (license license:gpl2)))

(define-public r-wmtsa
  (package
    (name "r-wmtsa")
    (version "2.0-3")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "wmtsa" version))
       (sha256
        (base32
         "1q436krz5p1f4a7a7sya6a9rh9x9mi8zzcgq66gbk9w9w4hcqcj6"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-ifultools" ,r-ifultools)
       ("r-mass" ,r-mass)
       ("r-splus2r" ,r-splus2r)))
    (home-page "https://cran.r-project.org/web/packages/wmtsa/")
    (synopsis "Wavelet methods for time series analysis")
    (description
     "This package provides software to accompany the book \"Wavelet Methods
for Time Series Analysis\", Donald B. Percival and Andrew T. Walden, Cambridge
University Press, 2000.")
    (license license:gpl2)))

(define-public r-tsa
  (package
    (name "r-tsa")
    (version "1.2")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "TSA" version))
       (sha256
        (base32
         "0gjfqibwdznz0nka95k4fjm935svxjpnqfywwz403crn2lh30h6q"))))
    (properties `((upstream-name . "TSA")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-leaps" ,r-leaps)
       ("r-locfit" ,r-locfit)
       ("r-mgcv" ,r-mgcv)))
    (home-page "http://www.stat.uiowa.edu/~kchan/TSA.htm")
    (synopsis "Time series analysis")
    (description
     "This package contains R functions and datasets detailed in the book
\"Time Series Analysis with Applications in R (second edition)\" by Jonathan
Cryer and Kung-Sik Chan.")
    (license license:gpl2+)))

(define-public r-extradistr
  (package
    (name "r-extradistr")
    (version "1.8.9")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "extraDistr" version))
       (sha256
        (base32
         "1fg8vjpal33y51iqzglk1yvy46d7js0l0wfbdy698lq8a06hq19p"))))
    (properties `((upstream-name . "extraDistr")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-rcpp" ,r-rcpp)))
    (home-page "https://github.com/twolodzko/extraDistr")
    (synopsis "Additional univariate and multivariate distributions")
    (description
     "This package implements density, distribution functions, quantile
functions and random generation functions for a large number of univariate and
multivariate distributions.")
    (license license:gpl2)))

(define-public r-fractal
  (package
    (name "r-fractal")
    (version "2.0-4")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "fractal" version))
       (sha256
        (base32
         "18lr9z0gslvfc3z8vyj3krqj3bfhg60zv1fzinrwwkc4cpk1w7mp"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-ifultools" ,r-ifultools)
       ("r-mass" ,r-mass)
       ("r-sapa" ,r-sapa)
       ("r-scatterplot3d" ,r-scatterplot3d)
       ("r-splus2r" ,r-splus2r)
       ("r-wmtsa" ,r-wmtsa)))
    (home-page "https://cran.r-project.org/web/packages/fractal/")
    (synopsis "Fractal time series modeling and analysis")
    (description
     "This package provides tools for stochastic fractal and deterministic
chaotic time series analysis.")
    (license license:gpl2)))

(define-public r-urca
  (package
    (name "r-urca")
    (version "1.3-0")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "urca" version))
       (sha256
        (base32
         "1akaqwf3fvvvx4sgfn641fd4sj51s0701pvfl6s5hnz2k0iwh732"))))
    (build-system r-build-system)
    (propagated-inputs `(("r-nlme" ,r-nlme)))
    (native-inputs `(("gfortran" ,gfortran)))
    (home-page "https://cran.r-project.org/web/packages/urca/")
    (synopsis "Unit root and cointegration tests for time series data")
    (description
     "This package provides unit root and cointegration tests encountered in
applied econometric analysis.")
    (license license:gpl2+)))

(define-public r-cubature
  (package
    (name "r-cubature")
    (version "1.4")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "cubature" version))
       (sha256
        (base32
         "1hd23b8v2kpqp5gr0va8p2q7j8w9rik6ks7zrr4b8mb2mwrakk74"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-rcpp" ,r-rcpp)))
    (home-page "https://github.com/bnaras/cubature")
    (synopsis "Adaptive multivariate integration over hypercubes")
    (description
     "This package is an R wrapper around the cubature C library for adaptive
multivariate integration over hypercubes.  This version provides both
@code{hcubature} and @code{pcubature} routines in addition to a vector
interface.")
    ;; The included cubature C library is released under GPLv2+, but the
    ;; wrapper declares the license to be GPLv3+.
    (license (list license:gpl2+ license:gpl3+))))

(define-public r-trend
  (package
    (name "r-trend")
    (version "1.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "trend" version))
       (sha256
        (base32
         "1bd567n15k2vpmgbx02584k5kglrc58mlb5kgd07wdss3knpa48q"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-extradistr" ,r-extradistr)))
    (native-inputs
     `(("gfortran" ,gfortran)))
    (home-page "https://cran.r-project.org/web/packages/trend/")
    (synopsis "Non-parametric trend tests and change-point detection")
    (description
     "The analysis of environmental data often requires the detection of
trends and change-points.  This package includes tests for trend
detection (Cox-Stuart Trend Test, Mann-Kendall Trend Test, (correlated)
Hirsch-Slack Test, partial Mann-Kendall Trend Test, multivariate (multisite)
Mann-Kendall Trend Test, (Seasonal) Sen's slope, partial Pearson and Spearman
correlation trend test), change-point detection (Lanzante's test procedures,
Pettitt's test, Buishand Range Test, Buishand U Test, Standard Normal
Homogeinity Test), detection of non-randomness (Wallis-Moore Phase Frequency
Test, Bartels rank von Neumann's ratio test, Wald-Wolfowitz Test) and the two
sample Robust Rank-Order Distributional Test.")
    (license license:gpl3)))

(define-public r-expm
  (package
    (name "r-expm")
    (version "0.999-2")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "expm" version))
       (sha256
        (base32
         "1mihl67kvv1xv0figp25jkmwfn4iwkcx15cng2348y8gm6zybw9q"))))
    (build-system r-build-system)
    (propagated-inputs `(("r-matrix" ,r-matrix)))
    (native-inputs `(("gfortran" ,gfortran)))
    (home-page "https://r-forge.r-project.org/projects/expm/")
    (synopsis "Tools for matrix exponentials and related quantities")
    (description
     "This package provides tools for the computation of the matrix
exponential, logarithm, square root, and related quantities.")
    (license license:gpl2+)))

(define-public r-complexplus
  (package
    (name "r-complexplus")
    (version "2.1")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "complexplus" version))
       (sha256
        (base32
         "16w9v7d1ckavqmr86l34frr37pkvdn0iqnb17ssb8xaggns5lgqx"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-expm" ,r-expm)
       ("r-matrix" ,r-matrix)))
    (home-page "https://cran.r-project.org/web/packages/complexplus/")
    (synopsis "Functions of complex or real variables")
    (description
     "This package extends several functions to the complex domain, including
the matrix exponential and logarithm, and the determinant.")
    (license license:gpl2)))

(define-public r-phontools
  (package
    (name "r-phontools")
    (version "0.2-2.1")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "phonTools" version))
       (sha256
        (base32
         "01i481mhswsys3gpasw9gn6nxkfmi7bz46g5c84m13pg0cv8hxc7"))))
    (properties `((upstream-name . "phonTools")))
    (build-system r-build-system)
    (home-page "http://www.santiagobarreda.com/rscripts.html")
    (synopsis "Tools for phonetic and acoustic analyses")
    (description
     "This package contains tools for the organization, display, and analysis
of the sorts of data frequently encountered in phonetics research and
experimentation, including the easy creation of IPA vowel plots, and the
creation and manipulation of WAVE audio files.")
    (license license:bsd-2)))

(define-public r-np
  (package
    (name "r-np")
    (version "0.60-8")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "np" version))
       (sha256
        (base32
         "17h67a510wh83800ri6g02wvznrlhigxni8shyijz1iaxcpk8k4j"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-boot" ,r-boot)
       ("r-cubature" ,r-cubature)
       ("r-quadprog" ,r-quadprog)
       ("r-quantreg" ,r-quantreg)))
    (home-page "https://github.com/JeffreyRacine/R-Package-np")
    (synopsis "Non-parametric kernel smoothing methods for mixed data types")
    (description "This package provides non-parametric (and semi-parametric)
kernel methods that seamlessly handle a mix of continuous, unordered, and
ordered factor data types.")
    ;; Any version of the GPL.
    (license license:gpl3+)))

(define-public r-powerplus
  (package
    (name "r-powerplus")
    (version "3.1")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "powerplus" version))
       (sha256
        (base32
         "0ayp6x34hkzgris4j3zbbs0r23n81bhww3wgfyy630ri4sk6brrn"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-complexplus" ,r-complexplus)
       ("r-expm" ,r-expm)
       ("r-mass" ,r-mass)
       ("r-matrix" ,r-matrix)
       ("r-phontools" ,r-phontools)))
    (home-page "https://cran.r-project.org/web/packages/powerplus/")
    (synopsis "Exponentiation operations")
    (description
     "This package provides tools for the computation of matrix and scalar
exponentiation.")
    (license license:gpl2)))

(define-public r-heatmaply
  (package
    (name "r-heatmaply")
    (version "0.15.2")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "heatmaply" version))
       (sha256
        (base32
         "0h8s5djzj4mrmaswlcaap6jbwxrkbzc43bbqik3qf8vrqz335w04"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-assertthat" ,r-assertthat)
       ("r-colorspace" ,r-colorspace)
       ("r-dendextend" ,r-dendextend)
       ("r-ggplot2" ,r-ggplot2)
       ("r-gplots" ,r-gplots)
       ("r-htmlwidgets" ,r-htmlwidgets)
       ("r-knitr" ,r-knitr) ; needed for vignettes
       ("r-magrittr" ,r-magrittr)
       ("r-plotly" ,r-plotly)
       ("r-rcolorbrewer" ,r-rcolorbrewer)
       ("r-reshape2" ,r-reshape2)
       ("r-scales" ,r-scales)
       ("r-seriation" ,r-seriation)
       ("r-viridis" ,r-viridis)
       ("r-webshot" ,r-webshot)))
    (home-page "https://cran.r-project.org/package=heatmaply")
    (synopsis "Interactive cluster heat maps using plotly")
    (description
     "This package enables you to create interactive cluster heatmaps that can
be saved as a stand-alone HTML file, embedded in R Markdown documents or in a
Shiny app, and made available in the RStudio viewer pane.  Hover the mouse
pointer over a cell to show details or drag a rectangle to zoom.  A heatmap is
a popular graphical method for visualizing high-dimensional data, in which a
table of numbers is encoded as a grid of colored cells.  The rows and columns
of the matrix are ordered to highlight patterns and are often accompanied by
dendrograms.")
    ;; Either version of the license.
    (license (list license:gpl2 license:gpl3))))

(define-public r-cgdsr
  (package
    (name "r-cgdsr")
    (version "1.2.10")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "cgdsr" version))
       (sha256
        (base32
         "1xyhw7mhmjichr1l6f9y1qvfj9wm87kfbm87ji7lcwf36gxh5g23"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-r-methodss3" ,r-r-methodss3)
       ("r-r-oo" ,r-r-oo)))
    (home-page "https://github.com/cBioPortal/cgdsr")
    (synopsis "R-based API for accessing the MSKCC Cancer Genomics Data Server")
    (description
     "This package provides a basic set of R functions for querying the Cancer
Genomics Data Server (CGDS), hosted by the Computational Biology Center at
Memorial-Sloan-Kettering Cancer Center (MSKCC).")
    (license license:lgpl3)))

(define-public r-import
  (package
    (name "r-import")
    (version "1.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "import" version))
       (sha256
        (base32
         "0blf9539rbfwcmw8zsb4k58slb4pdnc075v34vmyjw752fznhcji"))))
    (build-system r-build-system)
    (home-page "https://github.com/smbache/import")
    (synopsis "Import mechanism for R")
    (description
     "This is an alternative mechanism for importing objects from packages.
The syntax allows for importing multiple objects from a package with a single
command in an expressive way.  The import package bridges some of the gap
between using @code{library} (or @code{require}) and direct (single-object)
imports.  Furthermore the imported objects are not placed in the current
environment.  It is also possible to import objects from stand-alone @code{.R}
files.")
    (license license:expat)))

(define-public r-shinyace
  (package
    (name "r-shinyace")
    (version "0.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "shinyAce" version))
       (sha256
        (base32
         "1hqgszbiv99dibhwr21v21ll4s2hjn3ccqdicsm0z3gk77bh8iyb"))))
    (properties `((upstream-name . "shinyAce")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-shiny" ,r-shiny)
       ("r-jsonlite" ,r-jsonlite)))
    (home-page "http://cran.r-project.org/web/packages/shinyAce")
    (synopsis "Ace editor bindings for Shiny")
    (description
     "This package provides Ace editor bindings to enable a rich text editing
environment within Shiny.")
    (license license:expat)))

(define-public r-radiant-data
  (package
    (name "r-radiant-data")
    (version "0.9.5")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "radiant.data" version))
       (sha256
        (base32
         "0mbxfqn79nphii4hb6kxl2wc0w0ra16y378rp2yw9a9926zdb7mb"))
       (modules '((guix build utils)))
       (snippet
        '(begin
           ;; Delete files that are under CC-NC-SA.
           (delete-file-recursively "inst/app/tools/help")
           #t))))
    (properties `((upstream-name . "radiant.data")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-base64enc" ,r-base64enc)
       ("r-broom" ,r-broom)
       ("r-car" ,r-car)
       ("r-curl" ,r-curl)
       ("r-dplyr" ,r-dplyr)
       ("r-dt" ,r-dt)
       ("r-glue" ,r-glue)
       ("r-ggplot2" ,r-ggplot2)
       ("r-gridextra" ,r-gridextra)
       ("r-import" ,r-import)
       ("r-jsonlite" ,r-jsonlite)
       ("r-knitr" ,r-knitr)
       ("r-lubridate" ,r-lubridate)
       ("r-magrittr" ,r-magrittr)
       ("r-markdown" ,r-markdown)
       ("r-plotly" ,r-plotly)
       ("r-psych" ,r-psych)
       ("r-readr" ,r-readr)
       ("r-readxl" ,r-readxl)
       ("r-rlang" ,r-rlang)
       ("r-rmarkdown" ,r-rmarkdown)
       ("r-rstudioapi" ,r-rstudioapi)
       ("r-scales" ,r-scales)
       ("r-shiny" ,r-shiny)
       ("r-shinyace" ,r-shinyace)
       ("r-tibble" ,r-tibble)
       ("r-tidyr" ,r-tidyr)
       ("r-writexl" ,r-writexl)))
    (home-page "https://github.com/radiant-rstats/radiant.data")
    (synopsis "Data menu for Radiant: business analytics using R and Shiny")
    (description
     "The Radiant Data menu includes interfaces for loading, saving, viewing,
visualizing, summarizing, transforming, and combining data.  It also contains
functionality to generate reproducible reports of the analyses conducted in
the application.")
    (license license:agpl3)))

(define-public r-algdesign
  (package
    (name "r-algdesign")
    (version "1.1-7.3")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "AlgDesign" version))
       (sha256
        (base32
         "0bl7mx4dnmkgs2x1fj7cqnrp7jx18mqwxyga0rzlniq12h8mc3fz"))))
    (properties `((upstream-name . "AlgDesign")))
    (build-system r-build-system)
    (home-page "https://github.com/jvbraun/AlgDesign")
    (synopsis "Algorithmic experimental design")
    (description
     "This package provides tools to calculate exact and approximate theory
experimental designs for D, A, and I criteria.  Very large designs may be
created.  Experimental designs may be blocked or blocked designs created from
a candidate list, using several criteria.  The blocking can be done when whole
and within plot factors interact.")
    (license license:gpl2+)))

(define-public r-signal
  (package
    (name "r-signal")
    (version "0.7-6")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "signal" version))
       (sha256
        (base32
         "1vsxramz5qd9q9s3vlqzmfdpmwl2rhlb2n904zw6f0fg0xxjfq3b"))))
    (build-system r-build-system)
    (propagated-inputs `(("r-mass" ,r-mass)))
    (native-inputs `(("gfortran" ,gfortran)))
    (home-page "https://cran.r-project.org/web/packages/signal/")
    (synopsis "Signal processing")
    (description
     "This package provides a set of signal processing functions originally
written for Matlab and GNU Octave.  It includes filter generation utilities,
filtering functions, resampling routines, and visualization of filter models.
It also includes interpolation functions.")
    (license license:gpl2)))

(define-public r-gsubfn
  (package
    (name "r-gsubfn")
    (version "0.7")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "gsubfn" version))
       (sha256
        (base32
         "00j6b8b6xsx6v370h220x233rpk6asca78165y3d48jpwvwisdc9"))))
    (build-system r-build-system)
    (propagated-inputs `(("r-proto" ,r-proto)))
    (home-page "http://gsubfn.googlecode.com")
    (synopsis "Utilities for strings and function arguments.")
    (description
     "This package provides @code{gsubfn} which is like @code{gsub} but can
take a replacement function or certain other objects instead of the
replacement string.  Matches and back references are input to the replacement
function and replaced by the function output.  @code{gsubfn} can be used to
split strings based on content rather than delimiters and for quasi-perl-style
string interpolation.  The package also has facilities for translating
formulas to functions and allowing such formulas in function calls instead of
functions.")
    (license license:gpl2+)))

(define-public r-sqldf
  (package
    (name "r-sqldf")
    (version "0.4-11")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "sqldf" version))
       (sha256
        (base32
         "0q12vsb53p2wchgp8wfz5bk08wfnm0jxjrakclj4jyy6x3a7ksff"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-chron" ,r-chron)
       ("r-dbi" ,r-dbi)
       ("r-gsubfn" ,r-gsubfn)
       ("r-proto" ,r-proto)
       ("r-rsqlite" ,r-rsqlite)))
    (home-page "https://github.com/ggrothendieck/sqldf")
    (synopsis "Manipulate R data frames using SQL")
    (description
     "The @code{sqldf} function is typically passed a single argument which is
an SQL select statement where the table names are ordinary R data frame names.
@code{sqldf} transparently sets up a database, imports the data frames into
that database, performs the SQL statement and returns the result using a
heuristic to determine which class to assign to each column of the returned
data frame.  The @code{sqldf} or @code{read.csv.sql} functions can also be
used to read filtered files into R even if the original files are larger than
R itself can handle.")
    (license license:gpl2)))

(define-public r-abind
  (package
    (name "r-abind")
    (version "1.4-5")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "abind" version))
       (sha256
        (base32
         "0b1zd8jbnl6l292cr9rb50m09fy3ylxvzkpgi5lfb1nbzddcwfis"))))
    (build-system r-build-system)
    (home-page "https://cran.r-project.org/web/packages/abind/")
    (synopsis "Combine multidimensional arrays")
    (description
     "This package provides tools to combine multidimensional arrays into a
single array.  This is a generalization of @code{cbind} and @code{rbind}.  It
works with vectors, matrices, and higher-dimensional arrays.  It also provides
the functions @code{adrop}, @code{asub}, and @code{afill} for manipulating,
extracting and replacing data in arrays.")
    (license license:lgpl2.0+)))

(define-public r-prroc
  (package
    (name "r-prroc")
    (version "1.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "PRROC" version))
       (sha256
        (base32
         "1m28h8pcd78049lz2qixhkcr9h5b3jik3maqzfbvq9y58z71i4a7"))))
    (properties `((upstream-name . "PRROC")))
    (build-system r-build-system)
    (home-page "https://cran.r-project.org/web/packages/PRROC/")
    (synopsis "Precision-Recall and ROC curves for weighted and unweighted data")
    (description
     "This package computes the areas under the @dfn{precision-recall} (PR)
and ROC curve for weighted (e.g. soft-labeled) and unweighted data.  In
contrast to other implementations, the interpolation between points of the PR
curve is done by a non-linear piecewise function.  In addition to the areas
under the curves, the curves themselves can also be computed and plotted by a
specific S3-method.")
    (license license:gpl3)))

(define-public r-vim
  (package
    (name "r-vim")
    (version "4.7.0")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "VIM" version))
       (sha256
        (base32
         "1vjcs5wvjv94ln01d94h9rs4j50d3ky4n26mm3prgh13raylrmnd"))))
    (properties `((upstream-name . "VIM")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-car" ,r-car)
       ("r-colorspace" ,r-colorspace)
       ("r-data-table" ,r-data-table)
       ("r-e1071" ,r-e1071)
       ("r-laeken" ,r-laeken)
       ("r-mass" ,r-mass)
       ("r-nnet" ,r-nnet)
       ("r-rcpp" ,r-rcpp)
       ("r-robustbase" ,r-robustbase)
       ("r-sp" ,r-sp)
       ("r-vcd" ,r-vcd)))
    (home-page "https://github.com/alexkowa/VIM")
    (synopsis "Visualization and imputation of missing values")
    (description
     "This package provides tools for the visualization of missing and/or
imputed values are introduced, which can be used for exploring the data and
the structure of the missing and/or imputed values.  Depending on this
structure of the missing values, the corresponding methods may help to
identify the mechanism generating the missing values and allows to explore the
data including missing values.  In addition, the quality of imputation can be
visually explored using various univariate, bivariate, multiple and
multivariate plot methods.")
    (license license:gpl2+)))

(define-public r-fnn
  (package
    (name "r-fnn")
    (version "1.1.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "FNN" version))
       (sha256
        (base32
         "1n61jrcmakqif8f827x4qnlhm2jqpj5fgjj65c4p0kdd8lzw8pqp"))))
    (properties `((upstream-name . "FNN")))
    (build-system r-build-system)
    (home-page "https://cran.r-project.org/web/packages/FNN")
    (synopsis "Fast nearest neighbor search algorithms and applications")
    (description
     "This package provides cover-tree and kd-tree fast k-nearest neighbor
search algorithms.  Related applications including KNN classification,
regression and information measures are implemented.")
    ;; The DESCRIPTION file erroneously states that GPL version 2.1 or
    ;; later can be used.
    (license license:gpl2+)))

(define-public r-smoother
  (package
    (name "r-smoother")
    (version "1.1")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "smoother" version))
       (sha256
        (base32
         "0nqr1bvlr5bnasqg74zmknjjl4x28kla9h5cxpga3kq5z215pdci"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-ttr" ,r-ttr)))
    (home-page "http://cran.r-project.org/web/packages/smoother")
    (synopsis "Functions relating to the smoothing of numerical data")
    (description
     "This package provides a collection of methods for smoothing numerical
data, commencing with a port of the Matlab gaussian window smoothing function.
In addition, several functions typically used in smoothing of financial data
are included.")
    (license license:gpl2)))

(define-public r-riverplot
  (package
    (name "r-riverplot")
    (version "0.6")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "riverplot" version))
       (sha256
        (base32
         "0q1icpny8nkxyjhawyjzwrw8qlz0ayn2xyrsqrm4vkxyv6c9xk8z"))))
    (build-system r-build-system)
    (home-page "https://logfc.wordpress.com")
    (synopsis "Sankey or ribbon plots")
    (description
     "Sankey plots are a type of diagram that is convenient to illustrate how
flow of information, resources etc. separates and joins, much like observing
how rivers split and merge.  For example, they can be used to compare
different clusterings.  This package provides an implementation of Sankey
plots for R.")
    (license license:gpl2+)))

(define-public r-dyn
  (package
    (name "r-dyn")
    (version "0.2-9.6")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "dyn" version))
       (sha256
        (base32
         "16fqv9k7yxdgybwzafjkyqm16qpgqz13lcjpi6a1nc8xbzlzh0gb"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-zoo" ,r-zoo)))
    (home-page "https://cran.r-project.org/web/packages/dyn")
    (synopsis "Time series regression")
    (description
     "This package provides the dyn class interfaces @code{ts}, @code{irts},
@code{zoo} and @code{zooreg} time series classes to @code{lm}, @code{glm},
@code{loess}, @code{quantreg::rq}, @code{MASS::rlm},
@code{MCMCpack::MCMCregress()}, @code{quantreg::rq()},
@code{randomForest::randomForest()} and other regression functions, allowing
those functions to be used with time series including specifications that may
contain lags, diffs and missing values.")
    ;; Any GPL version.
    (license license:gpl2+)))

(define-public r-catdap
  (package
    (name "r-catdap")
    (version "1.3.4")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "catdap" version))
       (sha256
        (base32
         "0i877l61f6c75pczi235rzci67w29zv1d7z5zn5p5ymndclvlpl2"))))
    (build-system r-build-system)
    (native-inputs
     `(("gfortran" ,gfortran)))
    (home-page "https://cran.r-project.org/web/packages/catdap/")
    (synopsis "Tools for categorical data analysis")
    (description
     "This package provides functions for analyzing multivariate data.
Dependencies of the distribution of the specified variable (response
variable) to other variables (explanatory variables) are derived and
evaluated by the @dfn{Akaike Information Criterion} (AIC).")
    (license license:gpl2+)))

(define-public r-arules
  (package
    (name "r-arules")
    (version "1.6-1")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "arules" version))
       (sha256
        (base32
         "0glfqgxr87900kigmkby2ff7qrjvd6aq595q85y056i5ckjcp615"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-matrix" ,r-matrix)))
    (home-page "https://github.com/mhahsler/arules")
    (synopsis "Mining association rules and frequent itemsets")
    (description
     "This package provides an infrastructure for representing, manipulating
and analyzing transaction data and patterns (frequent itemsets and association rules).
It also provides C implementations of the association mining algorithms Apriori
and Eclat.")
    (license license:gpl3)))

(define-public r-parsedate
  (package
    (name "r-parsedate")
    (version "1.1.3")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "parsedate" version))
       (sha256
        (base32
         "0mg7hbm3903iwvmpn51gjpaaq03rsp72hjb1g8h5g84r81iha002"))))
    (build-system r-build-system)
    (home-page "https://github.com/gaborcsardi/parsedate")
    (synopsis
     "Recognize and parse dates in various formats")
    (description
     "This package provides three functions for dealing with dates:
@code{parse_iso_8601} recognizes and parses all valid ISO 8601 date and
time formats, @code{parse_date} parses dates in unspecified formats,
and @code{format_iso_8601} formats a date in ISO 8601 format.")
    (license license:gpl2)))

(define-public r-abc-data
  (package
    (name "r-abc-data")
    (version "1.0")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "abc.data" version))
       (sha256
        (base32
         "1bv1n68ah714ws58cf285n2s2v5vn7382lfjca4jxph57lyg8hmj"))))
    (properties `((upstream-name . "abc.data")))
    (build-system r-build-system)
    (home-page "https://cran.r-project.org/web/packages/abc.data/")
    (synopsis "Data for Approximate Bayesian Computation (ABC) package")
    (description
     "This package contains data which are used by functions of the abc
package which implements several @dfn{Approximate Bayesian Computation} (ABC)
algorithms for performing parameter estimation, model selection, and
goodness-of-fit.")
    (license license:gpl3+)))

(define-public r-abc
  (package
    (name "r-abc")
    (version "2.1")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "abc" version))
       (sha256
        (base32
         "0ngzaaz2y2s03fhngvwipmy4kq38xrmyddaz6a6l858rxvadrlhb"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-abc-data" ,r-abc-data)
       ("r-locfit" ,r-locfit)
       ("r-mass" ,r-mass)
       ("r-nnet" ,r-nnet)
       ("r-quantreg" ,r-quantreg)))
    (home-page "https://cran.r-project.org/web/packages/abc/")
    (synopsis "Tools for Approximate Bayesian Computation (ABC)")
    (description
     "This package implements several @dfn{Approximate Bayesian
Computation} (ABC) algorithms for performing parameter estimation, model
selection, and goodness-of-fit.  Cross-validation tools are also available for
measuring the accuracy of ABC estimates, and to calculate the
misclassification probabilities of different models.")
    (license license:gpl3+)))

(define-public r-zip
  (package
    (name "r-zip")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "zip" version))
       (sha256
        (base32
         "0rgr9pcdhdq3k8n29h2ircp3ri1ibhrx81gja1y7331v15xyrabg"))))
    (build-system r-build-system)
    (home-page "https://github.com/gaborcsardi/zip")
    (synopsis "Cross-platform Zip compression")
    (description
     "This package provides a cross-platform Zip compression library for R.
It is a replacement for the @code{zip} function, that does not require any
additional external tools on any platform.")
    (license license:cc0)))

(define-public r-openxlsx
  (package
    (name "r-openxlsx")
    (version "4.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "openxlsx" version))
       (sha256
        (base32
         "1n7z22pm78xa77fvn77kdn68az6xzxk36y11sqf0w6h6adri4yxb"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-rcpp" ,r-rcpp)
       ("r-zip" ,r-zip)))
    (home-page "https://github.com/awalker89/openxlsx")
    (synopsis "Read, write and edit XLSX files")
    (description
     "This package simplifies the creation of Excel @code{.xlsx} files by
providing a high level interface to writing, styling and editing worksheets.
Through the use of Rcpp, read/write times are comparable to the @code{xlsx}
and @code{XLConnect} packages with the added benefit of removing the
dependency on Java.")
    (license license:gpl3)))

(define-public r-rio
  (package
    (name "r-rio")
    (version "0.5.10")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "rio" version))
       (sha256
        (base32
         "158xg3vj0glk3fslwi6fywwmfym2b6kn3fdmjligdfy5lf68khix"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-curl" ,r-curl)
       ("r-data-table" ,r-data-table)
       ("r-foreign" ,r-foreign)
       ("r-haven" ,r-haven)
       ("r-openxlsx" ,r-openxlsx)
       ("r-readxl" ,r-readxl)
       ("r-tibble" ,r-tibble)))
    (home-page "https://github.com/leeper/rio")
    (synopsis "Swiss-army knife for data I/O")
    (description
     "This package provides streamlined data import and export infrastructure
by making assumptions that the user is probably willing to make: @code{import}
and @code{export} determine the data structure from the file extension,
reasonable defaults are used for data import and export (e.g.,
@code{stringsAsFactors=FALSE}), web-based import is natively
supported (including from SSL/HTTPS), compressed files can be read directly
without explicit decompression, and fast import packages are used where
appropriate.  An additional convenience function, @code{convert}, provides a
simple method for converting between file types.")
    (license license:gpl2)))

(define-public r-maptools
  (package
    (name "r-maptools")
    (version "0.9-3")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "maptools" version))
       (sha256
        (base32
         "0hxbv01im9zk1qrwgigpc510w6x0kzdzip4gx2jzfqmmwr8m17r8"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-foreign" ,r-foreign)
       ("r-lattice" ,r-lattice)
       ("r-sp" ,r-sp)))
    (home-page "http://r-forge.r-project.org/projects/maptools/")
    (synopsis "Tools for reading and handling spatial objects")
    (description
     "This package provides a set of tools for manipulating and reading
geographic data, in particular ESRI Shapefiles.  It includes binary access to
GSHHG shoreline files.  The package also provides interface wrappers for
exchanging spatial objects with other R packages.")
    ;; The C source files from shapelib are released under the Expat license.
    ;; The R code is released under GPL version 2 or later.
    (license (list license:gpl2+
                   license:expat))))

(define-public r-later
  (package
    (name "r-later")
    (version "0.7.4")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "later" version))
       (sha256
        (base32
         "125zc499gj702x2bch95lsfzk2qb4dzv3604x9afym2i3ylrmm64"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-bh" ,r-bh)
       ("r-rcpp" ,r-rcpp)
       ("r-rlang" ,r-rlang)))
    (home-page "https://github.com/r-lib/later")
    (synopsis "Utilities for delaying function execution")
    (description
     "This package provides tools to execute arbitrary R or C functions some
time after the current time, after the R execution stack has emptied.")
    (license license:gpl2+)))

(define-public r-promises
  (package
    (name "r-promises")
    (version "1.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "promises" version))
       (sha256
        (base32
         "0n2mlv6bvfb4yhgcml696l9vkbw21pz0smqylivr606z99rwgny2"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-later" ,r-later)
       ("r-magrittr" ,r-magrittr)
       ("r-r6" ,r-r6)
       ("r-rcpp" ,r-rcpp)
       ("r-rlang" ,r-rlang)))
    (home-page "https://rstudio.github.io/promises")
    (synopsis "Abstractions for promise-based asynchronous programming")
    (description
     "This package provides fundamental abstractions for doing asynchronous
programming in R using promises.  Asynchronous programming is useful for
allowing a single R process to orchestrate multiple tasks in the background
while also attending to something else.  Semantics are similar to JavaScript
promises, but with a syntax that is idiomatic R.")
    (license license:expat)))

(define-public r-dosnow
  (package
    (name "r-dosnow")
    (version "1.0.16")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "doSNOW" version))
       (sha256
        (base32
         "13ir4a8252h4yvp5ir9xnwack1kn58i4ny6sf2qdc12zspn3850n"))))
    (properties `((upstream-name . "doSNOW")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-foreach" ,r-foreach)
       ("r-iterators" ,r-iterators)
       ("r-snow" ,r-snow)))
    (home-page "https://cran.r-project.org/web/packages/doSNOW")
    (synopsis "Foreach parallel adaptor for the snow package")
    (description
     "This package provides a parallel backend for the @code{%dopar%} function
using the @code{snow} package.")
    (license license:gpl2)))

(define-public r-snowfall
  (package
   (name "r-snowfall")
   (version "1.84-6.1")
   (source (origin
            (method url-fetch)
            (uri (cran-uri "snowfall" version))
            (sha256
             (base32 "13941rlw1jsdjsndp1plzj1cq5aqravizkrqn6l25r9im7rnsi2w"))))
   (build-system r-build-system)
   (propagated-inputs
    `(("r-snow" ,r-snow)))
   (home-page "http://cran.r-project.org/web/packages/snowfall/")
   (synopsis "Easier cluster computing")
   (description "This package is a usability wrapper around snow for easier
development of parallel R programs.  This package offers e.g. extended error
checks, and additional functions.  All functions work in sequential mode, too,
if no cluster is present or wished.  The package is also designed as connector
to the cluster management tool @code{sfCluster}, but can also used without
it.")
   (license license:gpl2+)))

(define-public r-rappdirs
  (package
    (name "r-rappdirs")
    (version "0.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "rappdirs" version))
       (sha256
        (base32
         "0ji6sg3bdn5gazkq14xmmcq7jnbsyxw4lzmmbgv6526j2vn93n1g"))))
    (build-system r-build-system)
    (home-page "https://cran.r-project.org/web/packages/rappdirs/")
    (synopsis "Determine where to save data, caches, and logs")
    (description
     "This package provides an easy way to determine which directories on the
user's computer should be used to save data, caches and logs.  It is a port of
Python's @url{https://github.com/ActiveState/appdirs,Appdirs} to R.")
    (license license:expat)))

(define-public r-learnr
  (package
    (name "r-learnr")
    (version "0.9.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "learnr" version))
       (sha256
        (base32
         "0jbk0g6fkw7zs8ykzhsvh9vvz8xmc4v03bqzjsa5mmpxpqan5vx5"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-evaluate" ,r-evaluate)
       ("r-htmltools" ,r-htmltools)
       ("r-htmlwidgets" ,r-htmlwidgets)
       ("r-jsonlite" ,r-jsonlite)
       ("r-knitr" ,r-knitr)
       ("r-markdown" ,r-markdown)
       ("r-rappdirs" ,r-rappdirs)
       ("r-rmarkdown" ,r-rmarkdown)
       ("r-rprojroot" ,r-rprojroot)
       ("r-shiny" ,r-shiny)
       ("r-withr" ,r-withr)))
    (home-page "https://rstudio.github.io/learnr/")
    (synopsis "Interactive tutorials for R")
    (description
     "This package provides tools to create interactive tutorials using R
Markdown.  Use a combination of narrative, figures, videos, exercises, and
quizzes to create self-paced tutorials for learning about R and R packages.")
    (license license:asl2.0)))

(define-public r-analytics
  (package
    (name "r-analytics")
    (version "2.0")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "analytics" version))
       (sha256
        (base32
         "1jkdjqc3fnvvsgi6x9ncf36rxzq0a55cmgkcv92mfmpcramg2lk6"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-car" ,r-car)
       ("r-cluster" ,r-cluster)
       ("r-fractal" ,r-fractal)
       ("r-lmtest" ,r-lmtest)
       ("r-mass" ,r-mass)
       ("r-np" ,r-np)
       ("r-powerplus" ,r-powerplus)
       ("r-robust" ,r-robust)
       ("r-trend" ,r-trend)
       ("r-tsa" ,r-tsa)
       ("r-urca" ,r-urca)))
    (home-page "https://cran.r-project.org/web/packages/analytics/")
    (synopsis "Collection of data analysis tools")
    (description
     "This package is a collection of data analysis tools.  It includes tools
for regression outlier detection in a fitted linear model, stationary
bootstrap using a truncated geometric distribution, a comprehensive test for
weak stationarity, column means by group, weighted biplots, and a heuristic to
obtain a better initial configuration in non-metric MDS.")
    (license license:gpl2)))

(define-public r-reticulate
  (package
    (name "r-reticulate")
    (version "1.10")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "reticulate" version))
       (sha256
        (base32
         "0bz3lxbisjwn6cv23090zivpy0bxcncr82g5qja13l37i8xnvqsq"))))
    (build-system r-build-system)
    (inputs `(("python" ,python)))
    (propagated-inputs
     `(("r-jsonlite" ,r-jsonlite)
       ("r-matrix" ,r-matrix)
       ("r-rcpp" ,r-rcpp)))
    (home-page "https://github.com/rstudio/reticulate")
    (synopsis "R interface to Python")
    (description
     "This package provides an interface from R to Python modules, classes,
and functions.  When calling into Python, R data types are automatically
converted to their equivalent Python types.  When values are returned from
Python to R they are converted back to R types.")
    (license license:asl2.0)))

(define-public r-bibtex
  (package
    (name "r-bibtex")
    (version "0.4.2")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "bibtex" version))
       (sha256
        (base32
         "0wl3925ryd54g1nv3ncwllc493d39dpgy5md61940h69c0van1hz"))))
    (build-system r-build-system)
    (propagated-inputs `(("r-stringr" ,r-stringr)))
    (home-page "https://github.com/romainfrancois/bibtex")
    (synopsis "Bibtex parser")
    (description "This package provides a utility for R to parse a bibtex
file.")
    (license license:gpl2+)))

(define-public r-ggseqlogo
  (package
    (name "r-ggseqlogo")
    (version "0.1")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "ggseqlogo" version))
       (sha256
        (base32
         "13q6kcpxrqxqbji889fx63p0nsi08lk5yymkchig75r5k1d18ky1"))))
    (build-system r-build-system)
    (propagated-inputs `(("r-ggplot2" ,r-ggplot2)))
    (home-page "https://github.com/omarwagih/ggseqlogo")
    (synopsis "ggplot2 extension for drawing genetic sequence logos")
    (description
     "The range of functions provided by this package makes it possible to
draw highly versatile genomic sequence logos.  Features include, but are not
limited to, modifying colour schemes and fonts used to draw the logo,
generating multiple logo plots, and aiding the visualisation with annotations.
Sequence logos can easily be combined with other ggplot2 plots.")
    ;; Unspecified version of the LGPL.
    (license license:lgpl3+)))

(define-public r-ggsci
  (package
    (name "r-ggsci")
    (version "2.9")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "ggsci" version))
       (sha256
        (base32
         "0g73x6grbka7ahjh6z23m3wrcifp5rdfdiasbl8lq4sp6rplxwaa"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-ggplot2" ,r-ggplot2)
       ("r-scales" ,r-scales)))
    (home-page "https://nanx.me/ggsci/")
    (synopsis "Scientific journal and sci-fi themed color palettes for ggplot2")
    (description
     "This package provides a collection of ggplot2 color palettes inspired by
plots in scientific journals, data visualization libraries, science fiction
movies, and TV shows.")
    (license license:gpl3)))

(define-public r-ggsignif
  (package
    (name "r-ggsignif")
    (version "0.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "ggsignif" version))
       (sha256
        (base32
         "1rn58d7pb3axk6chiihryykrzw76adaa2yiafq4d0j6qbhax78f7"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-ggplot2" ,r-ggplot2)))
    (home-page "https://github.com/const-ae/ggsignif")
    (synopsis "Significance brackets for ggplot2")
    (description
     "Enrich your ggplots with group-wise comparisons.  This package provides
an easy way to indicate if two groups are significantly different.  Commonly
this is shown by a bracket on top connecting the groups of interest which
itself is annotated with the level of significance.  The package provides a
single layer that takes the groups for comparison and the test as arguments
and adds the annotation to the plot.")
    (license license:gpl3)))

(define-public r-ggpubr
  (package
    (name "r-ggpubr")
    (version "0.1.8")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "ggpubr" version))
       (sha256
        (base32
         "0psl2zndm4wk6nnj1nv305islpxfvfgd87gjh2ph8yqn4mxpnfi1"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-cowplot" ,r-cowplot)
       ("r-dplyr" ,r-dplyr)
       ("r-ggplot2" ,r-ggplot2)
       ("r-ggrepel" ,r-ggrepel)
       ("r-ggsci" ,r-ggsci)
       ("r-ggsignif" ,r-ggsignif)
       ("r-glue" ,r-glue)
       ("r-gridextra" ,r-gridextra)
       ("r-magrittr" ,r-magrittr)
       ("r-polynom" ,r-polynom)
       ("r-purrr" ,r-purrr)
       ("r-scales" ,r-scales)
       ("r-tidyr" ,r-tidyr)))
    (home-page "http://www.sthda.com/english/rpkgs/ggpubr")
    (synopsis "ggplot2-based publication-ready plots")
    (description
     "The ggplot2 package is an excellent and flexible package for elegant
data visualization in R.  However the default generated plots require some
formatting before we can send them for publication.  The ggpubr package
provides some easy-to-use functions for creating and customizing ggplot2-based
publication-ready plots.")
    (license license:gpl2)))

(define-public r-ellipse
  (package
    (name "r-ellipse")
    (version "0.4.1")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "ellipse" version))
       (sha256
        (base32
         "0g82vc51m3c1k0hnpp2zla6amxxgk2mmkl8ssnsc49jv3599r6hs"))))
    (build-system r-build-system)
    (home-page "https://cran.r-project.org/web/packages/ellipse/")
    (synopsis "Functions for drawing ellipses and ellipse-like confidence regions")
    (description
     "This package contains various routines for drawing ellipses and
ellipse-like confidence regions, implementing the plots described in Murdoch
and Chow (1996), A graphical display of large correlation matrices, The
American Statistician 50, 178-180.  There are also routines implementing the
profile plots described in Bates and Watts (1988), Nonlinear Regression
Analysis and its Applications.")
    (license license:gpl2+)))

(define-public r-flashclust
  (package
    (name "r-flashclust")
    (version "1.01-2")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "flashClust" version))
       (sha256
        (base32
         "0l4lpz451ll7f7lfxmb7ds24ppzhfg1c3ypvydglcc35p2dq99s8"))))
    (properties `((upstream-name . "flashClust")))
    (build-system r-build-system)
    (native-inputs `(("gfortran" ,gfortran)))
    (home-page "https://cran.r-project.org/web/packages/flashClust/")
    (synopsis "Implementation of optimal hierarchical clustering")
    (description
     "This package provides a fast implementation of hierarchical
clustering.")
    (license license:gpl2+)))

(define-public r-factominer
  (package
    (name "r-factominer")
    (version "1.41")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "FactoMineR" version))
       (sha256
        (base32
         "1h20hydav6l2b7bngqw1av4l5rrh0wk58nhailga1f4qw9lrv259"))))
    (properties `((upstream-name . "FactoMineR")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-car" ,r-car)
       ("r-cluster" ,r-cluster)
       ("r-ellipse" ,r-ellipse)
       ("r-flashclust" ,r-flashclust)
       ("r-lattice" ,r-lattice)
       ("r-leaps" ,r-leaps)
       ("r-mass" ,r-mass)
       ("r-scatterplot3d" ,r-scatterplot3d)))
    (home-page "http://factominer.free.fr")
    (synopsis "Multivariate exploratory data analysis and data mining")
    (description
     "This package provides exploratory data analysis methods to summarize,
visualize and describe datasets.  The main principal component methods are
available, those with the largest potential in terms of applications:
principal component analysis (PCA) when variables are quantitative,
correspondence analysis (CA) and multiple correspondence analysis (MCA) when
variables are categorical, Multiple Factor Analysis when variables are
structured in groups, etc. and hierarchical cluster analysis.")
    (license license:gpl2+)))

(define-public r-factoextra
  (package
    (name "r-factoextra")
    (version "1.0.5")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "factoextra" version))
       (sha256
        (base32
         "1l6m8k7qhdw8ndar8nhmym0lfyd1i2iszl1cicjax0vq23ss6xw1"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-abind" ,r-abind)
       ("r-cluster" ,r-cluster)
       ("r-dendextend" ,r-dendextend)
       ("r-factominer" ,r-factominer)
       ("r-ggplot2" ,r-ggplot2)
       ("r-ggpubr" ,r-ggpubr)
       ("r-ggrepel" ,r-ggrepel)
       ("r-reshape2" ,r-reshape2)
       ("r-tidyr" ,r-tidyr)))
    (home-page "http://www.sthda.com/english/rpkgs/factoextra")
    (synopsis "Extract and visualize the results of multivariate data analyses")
    (description
     "This package provides some easy-to-use functions to extract and
visualize the output of multivariate data analyses, including
@code{PCA} (Principal Component Analysis), @code{CA} (Correspondence
Analysis), @code{MCA} (Multiple Correspondence Analysis), @code{FAMD} (Factor
Analysis of Mixed Data), @code{MFA} (Multiple Factor Analysis) and
@code{HMFA} (Hierarchical Multiple Factor Analysis) functions from different R
packages.  It contains also functions for simplifying some clustering analysis
steps and provides ggplot2-based elegant data visualization.")
    (license license:gpl2)))

(define-public r-fansi
  (package
    (name "r-fansi")
    (version "0.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "fansi" version))
       (sha256
        (base32
         "135qj7bcc3mwn0vg55hiiadf66lx6zaxvkicfmfw9x0zr7ah2r6x"))))
    (build-system r-build-system)
    (native-inputs
     `(("r-knitr" ,r-knitr))) ; for vignettes
    (home-page "https://github.com/brodieG/fansi")
    (synopsis "ANSI control sequence aware string functions")
    (description
     "This package provides counterparts to R string manipulation functions
that account for the effects of ANSI text formatting control sequences.")
    (license license:gpl2+)))

(define-public r-nbclust
  (package
    (name "r-nbclust")
    (version "3.0")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "NbClust" version))
       (sha256
        (base32
         "1vwb48zy6ln1ddpqmfngii1i80n8qmqyxnzdp6gbaq96lakl3w3c"))))
    (properties `((upstream-name . "NbClust")))
    (build-system r-build-system)
    (home-page "https://sites.google.com/site/malikacharrad/research/nbclust-package")
    (synopsis "Determine the best number of clusters in a data set")
    (description
     "NbClust provides 30 indexes for determining the optimal number of
clusters in a data set and offers the best clustering scheme from different
results to the user.")
    (license license:gpl2)))

(define-public r-hdf5r
  (package
    (name "r-hdf5r")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "hdf5r" version))
       (sha256
        (base32
         "1s6p4cj909kc635fh5xpl87bqlcdj3dn3r1wk5g40abimk2b0pva"))))
    (build-system r-build-system)
    (inputs
     `(("hdf5" ,hdf5)
       ("zlib" ,zlib)))
    (propagated-inputs
     `(("r-bit64" ,r-bit64)
       ("r-r6" ,r-r6)))
    (home-page "https://hhoeflin.github.io/hdf5r")
    (synopsis "Interface to the HDF5 binary data format")
    (description
     "HDF5 is a data model, library and file format for storing and managing
large amounts of data.  This package provides a nearly feature complete,
object oriented wrapper for the HDF5 API using R6 classes.  Additionally,
functionality is added so that HDF5 objects behave very similar to their
corresponding R counterparts.")
    (license license:asl2.0)))

(define-public r-itertools
  (package
    (name "r-itertools")
    (version "0.1-3")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "itertools" version))
       (sha256
        (base32
         "1ls5biiva10pb1dj3ph4griykb9vam02hkrdmlr5a5wf660hg6xn"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-iterators" ,r-iterators)))
    (home-page "https://cran.r-project.org/web/packages/itertools/")
    (synopsis "Iterator tools")
    (description
     "This package provides various tools for creating iterators, many
patterned after functions in the Python @code{itertools} module, and others
patterned after functions in the snow package.")
    (license license:gpl2)))

(define-public r-polynom
  (package
    (name "r-polynom")
    (version "1.3-9")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "polynom" version))
       (sha256
        (base32
         "1s4xxv5rvpigawknvq27v9vzvs83phfsj5h8mim2lmf5bj950nnk"))))
    (build-system r-build-system)
    (home-page "https://cran.r-project.org/web/packages/polynom/")
    (synopsis "Functions for univariate polynomial manipulations")
    (description
     "This package provides a collection of functions to implement a class for
univariate polynomial manipulations.")
    (license license:gpl2)))

(define-public r-gbrd
  (package
    (name "r-gbrd")
    (version "0.4-11")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "gbRd" version))
       (sha256
        (base32
         "06x97rw5i6v6cgjxkfhxnw4dn7lghn5q6ra7ri5ag1x9dkfzcl82"))))
    (properties `((upstream-name . "gbRd")))
    (build-system r-build-system)
    (home-page "https://cran.r-project.org/web/packages/gbRd/")
    (synopsis "Utilities for processing Rd objects and files")
    (description
     "This package provides utilities for processing Rd objects and files.
Extract argument descriptions and other parts of the help pages of
functions.")
    (license license:gpl2+)))

(define-public r-rdpack
  (package
    (name "r-rdpack")
    (version "0.9-0")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "Rdpack" version))
       (sha256
        (base32
         "067w0w6kza0hkzcnx58danl83yfvl9yjacr47mnid2bg856gdd1b"))))
    (properties `((upstream-name . "Rdpack")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-bibtex" ,r-bibtex)
       ("r-gbrd" ,r-gbrd)))
    (home-page "https://github.com/GeoBosh/Rdpack")
    (synopsis "Update and manipulate Rd documentation objects")
    (description
     "This package provides functions for manipulation of R documentation
objects, including functions @code{reprompt()} and @code{ereprompt()} for
updating Rd documentation for functions, methods and classes; it also includes
Rd macros for citations and import of references from bibtex files for use in
Rd files and roxygen2 comments, as well as many functions for manipulation of
references and Rd files.")
    (license license:gpl2+)))

(define-public r-officer
  (package
    (name "r-officer")
    (version "0.3.2")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "officer" version))
       (sha256
        (base32
         "14b6ii9h3fi5g8ja929mfhxps9r7x78flqjdy437y9aygkhmiz2i"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-base64enc" ,r-base64enc)
       ("r-digest" ,r-digest)
       ("r-htmltools" ,r-htmltools)
       ("r-magrittr" ,r-magrittr)
       ("r-r6" ,r-r6)
       ("r-rcpp" ,r-rcpp)
       ("r-uuid" ,r-uuid)
       ("r-xml2" ,r-xml2)
       ("r-zip" ,r-zip)))
    (home-page "https://davidgohel.github.io/officer")
    (synopsis "Manipulation of Word and PowerPoint documents")
    (description
     "This package provides tools to access and manipulate Word and PowerPoint
documents from R.  The package focuses on tabular and graphical reporting from
R; it also provides two functions that let users get document content into
data objects.  A set of functions lets add and remove images, tables and
paragraphs of text in new or existing documents.  When working with PowerPoint
presentations, slides can be added or removed; shapes inside slides can also
be added or removed.  When working with Word documents, a cursor can be used
to help insert or delete content at a specific location in the document.")
    (license license:gpl3)))

(define-public r-snakecase
  (package
    (name "r-snakecase")
    (version "0.9.2")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "snakecase" version))
       (sha256
        (base32
         "1g6xai53dl24ws0mwhqrkcv583ziaq505cv3z8v5dhjgy98kilyj"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-stringi" ,r-stringi)
       ("r-stringr" ,r-stringr)))
    (home-page "https://github.com/Tazinho/snakecase")
    (synopsis "Convert strings into any case")
    (description
     "This package provides a consistent, flexible and easy to use tool to
parse and convert strings into cases like snake or camel among others.")
    (license license:gpl3)))

(define-public r-prediction
  (package
    (name "r-prediction")
    (version "0.3.6")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "prediction" version))
       (sha256
        (base32
         "19d7312f5lkqfglfvlgssnvyw7gl161s0xradcry44r1i6qp05j1"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-data-table" ,r-data-table)))
    (home-page "https://github.com/leeper/prediction")
    (synopsis "Tidy, type-safe prediction methods")
    (description
     "This package provides the @code{prediction()} function, a type-safe
alternative to @code{predict()} that always returns a data frame.  The package
currently supports common model types (e.g., @code{\"lm\"}, @code{\"glm\"})
from the @code{stats} package, as well as numerous other model classes from
other add-on packages.")
    (license license:expat)))

(define-public r-sjlabelled
  (package
    (name "r-sjlabelled")
    (version "1.0.13")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "sjlabelled" version))
       (sha256
        (base32
         "0xizj7mrhnbn8kwjgm076si9w68a7lgrx4vj1sbqmv9jx055h8wv"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-broom" ,r-broom)
       ("r-dplyr" ,r-dplyr)
       ("r-haven" ,r-haven)
       ("r-magrittr" ,r-magrittr)
       ("r-prediction" ,r-prediction)
       ("r-purrr" ,r-purrr)
       ("r-rlang" ,r-rlang)
       ("r-snakecase" ,r-snakecase)
       ("r-tibble" ,r-tibble)
       ("r-tidyselect" ,r-tidyselect)))
    (home-page "https://github.com/strengejacke/sjlabelled")
    (synopsis "Labelled data utility functions")
    (description
     "This package provides a collection of functions dealing with labelled
data, like reading and writing data between R and other statistical software
packages.  This includes easy ways to get, set or change value and variable
label attributes, to convert labelled vectors into factors or numeric (and
vice versa), or to deal with multiple declared missing values.")
    (license license:gpl3)))

(define-public r-sjmisc
  (package
    (name "r-sjmisc")
    (version "2.7.4")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "sjmisc" version))
       (sha256
        (base32
         "11cy09k1d2y5wwqvafqxr01hzk4x68ji2pqlwj7fnpw27i3ap4q4"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-broom" ,r-broom)
       ("r-crayon" ,r-crayon)
       ("r-dplyr" ,r-dplyr)
       ("r-haven" ,r-haven)
       ("r-magrittr" ,r-magrittr)
       ("r-pillar" ,r-pillar)
       ("r-purrr" ,r-purrr)
       ("r-rlang" ,r-rlang)
       ("r-sjlabelled" ,r-sjlabelled)
       ("r-stringdist" ,r-stringdist)
       ("r-stringr" ,r-stringr)
       ("r-tibble" ,r-tibble)
       ("r-tidyr" ,r-tidyr)
       ("r-tidyselect" ,r-tidyselect)))
    (home-page "https://github.com/strengejacke/sjmisc")
    (synopsis "Data and variable transformation functions")
    (description
     "This package is a collection of miscellaneous utility functions,
supporting data transformation tasks like recoding, dichotomizing or grouping
variables, setting and replacing missing values.  The data transformation
functions also support labelled data, and all integrate seamlessly into a
tidyverse workflow.")
    (license license:gpl3)))

(define-public r-nortest
  (package
    (name "r-nortest")
    (version "1.0-4")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "nortest" version))
       (sha256
        (base32
         "17r0wpz72z9312c70nwi1i1kp1v9fm1h6jg7q5cx1mc1h420m1d3"))))
    (build-system r-build-system)
    (home-page "https://cran.r-project.org/web/packages/nortest/")
    (synopsis "Tests for normality")
    (description
     "This package provides five omnibus tests for testing the composite
hypothesis of normality.")
    (license license:gpl2+)))

(define-public r-moonbook
  (package
    (name "r-moonbook")
    (version "0.2.3")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "moonBook" version))
       (sha256
        (base32
         "0hys56mwbm776ff7dibi8wzyf69qiais9rs1jazv79lk6h56s9s6"))))
    (properties `((upstream-name . "moonBook")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-magrittr" ,r-magrittr)
       ("r-nortest" ,r-nortest)
       ("r-purrr" ,r-purrr)
       ("r-sjmisc" ,r-sjmisc)
       ("r-stringr" ,r-stringr)
       ("r-survival" ,r-survival)))
    (home-page "https://github.com/cardiomoon/moonBook")
    (synopsis "Functions and datasets for the book by Keon-Woong Moon")
    (description
     "This package provides several analysis-related functions for the book
entitled \"R statistics and graph for medical articles\" (written in Korean),
version 1, by Keon-Woong Moon with Korean demographic data with several plot
functions.")
    (license license:gpl2)))

(define-public r-flextable
  (package
    (name "r-flextable")
    (version "0.4.5")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "flextable" version))
       (sha256
        (base32
         "09j2y0z7rkc0w1cl9pp1cpk6fnzzfr6245mxa3ca42z9k2cy2jfl"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-gdtools" ,r-gdtools)
       ("r-htmltools" ,r-htmltools)
       ("r-knitr" ,r-knitr)
       ("r-officer" ,r-officer)
       ("r-r6" ,r-r6)
       ("r-rmarkdown" ,r-rmarkdown)
       ("r-stringr" ,r-stringr)
       ("r-xml2" ,r-xml2)))
    (home-page "https://davidgohel.github.io/flextable")
    (synopsis "Functions for tabular reporting")
    (description
     "This package provides tools to create pretty tables for HTML documents
and other formats.  Functions are provided to let users create tables, modify
and format their content.  It extends the @code{officer} package and can be
used within R markdown documents when rendering to HTML and to Word
documents.")
    (license license:gpl3)))

(define-public r-writexl
  (package
    (name "r-writexl")
    (version "1.0")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "writexl" version))
       (sha256
        (base32
         "0r2v12dc4zqmr1agp6vbw0fc48i278018684x84psjjqfmnv14cf"))))
    (build-system r-build-system)
    (inputs `(("zlib" ,zlib)))
    (home-page "https://github.com/ropensci/writexl")
    (synopsis "Export data frames to xlsx format")
    (description
     "This package provides a data frame to xlsx exporter based on
libxlsxwriter.")
    (license license:bsd-2)))

(define-public r-biasedurn
  (package
    (name "r-biasedurn")
    (version "1.07")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "BiasedUrn" version))
       (sha256
        (base32
         "13i2lgfnjhlbbm2yxfc2l5hswqw6x03pwba5csjmirv8kpjw4xr3"))))
    (properties `((upstream-name . "BiasedUrn")))
    (build-system r-build-system)
    (home-page "https://cran.r-project.org/web/packages/BiasedUrn/")
    (synopsis "Biased Urn model distributions")
    (description
     "This package provides statistical models of biased sampling in the form
of univariate and multivariate noncentral hypergeometric distributions,
including Wallenius' noncentral hypergeometric distribution and Fisher's
noncentral hypergeometric distribution (also called extended hypergeometric
distribution).")
    (license license:gpl3)))

(define-public r-goplot
  (package
    (name "r-goplot")
    (version "1.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "GOplot" version))
       (sha256
        (base32
         "1y8dv0kbzpr9za91njw0x233vx5d13vqml9hmpddcyi9s6va5nix"))))
    (properties `((upstream-name . "GOplot")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-ggdendro" ,r-ggdendro)
       ("r-ggplot2" ,r-ggplot2)
       ("r-gridextra" ,r-gridextra)
       ("r-rcolorbrewer" ,r-rcolorbrewer)))
    (home-page "https://github.com/wencke/wencke.github.io")
    (synopsis "Visualization of functional analysis data")
    (description
     "This package provides an implementation of multilayered visualizations
for enhanced graphical representation of functional analysis data.  It
combines and integrates omics data derived from expression and functional
annotation enrichment analyses.  Its plotting functions have been developed
with an hierarchical structure in mind: starting from a general overview to
identify the most enriched categories (modified bar plot, bubble plot) to a
more detailed one displaying different types of relevant information for the
molecules in a given set of categories (circle plot, chord plot, cluster plot,
Venn diagram, heatmap).")
    (license license:gpl2)))

(define-public r-getopt
  (package
    (name "r-getopt")
    (version "1.20.2")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "getopt" version))
       (sha256
        (base32
         "13p35lbpy7i578752fa71sbfvcsqw5qfa9p6kf8b5m3c5p9i4v1x"))))
    (build-system r-build-system)
    (home-page "https://github.com/trevorld/getopt")
    (synopsis "Command-line option processor for R")
    (description
     "This package is designed to be used with Rscript to write shebang
scripts that accept short and long options.  Many users will prefer to
use the packages @code{optparse} or @code{argparse} which add extra
features like automatically generated help options and usage texts,
support for default values, positional argument support, etc.")
    (license license:gpl2+)))

(define-public r-findpython
  (package
    (name "r-findpython")
    (version "1.0.3")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "findpython" version))
       (sha256
        (base32
         "1y08jk2ffmkf9zpwiz2xymjhfwqvls9vzsnq62v278ghw9d571jl"))))
    (build-system r-build-system)
    (home-page "https://github.com/trevorld/findpython")
    (synopsis "Functions to find an acceptable Python binary")
    (description
     "This package was designed to find an acceptable Python binary that
matches version and feature constraints.")
    (license license:expat)))

;; This in not the same as "r-argparser"
(define-public r-argparse
  (package
    (name "r-argparse")
    (version "1.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "argparse" version))
       (sha256
        (base32
         "0fzrbj87b274vf96azdnsjxk2nf45d5wy58vzmlah4b4h7q4j524"))))
    (build-system r-build-system)
    (inputs `(("python" ,python)))
    (propagated-inputs
     `(("r-findpython" ,r-findpython)
       ("r-getopt" ,r-getopt)
       ("r-jsonlite" ,r-jsonlite)
       ("r-proto" ,r-proto)))
    (home-page "https://github.com/trevorld/argparse")
    (synopsis "Command line optional and positional argument parser")
    (description
     "This package provides a command line parser to be used with Rscript to
write shebang scripts that gracefully accept positional and optional arguments
and automatically generate usage notices.")
    (license license:gpl2+)))

(define-public r-hash
  (package
    (name "r-hash")
    (version "2.2.6")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "hash" version))
       (sha256
        (base32
         "0mkx59bmni3b283znvbndnkbar85fzavzdfgmwrhskidsqcz34yz"))))
    (build-system r-build-system)
    (home-page "https://cran.r-project.org/web/packages/hash/")
    (synopsis "Implementation of hash/associated arrays/dictionaries")
    (description
     "This package implements a data structure similar to hashes in Perl and
dictionaries in Python but with a purposefully R flavor.  For objects of
appreciable size, access using hashes outperforms native named lists and
vectors.")
    (license license:gpl2+)))

(define-public r-orddom
  (package
    (name "r-orddom")
    (version "3.1")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "orddom" version))
       (sha256
        (base32
         "165axs15fvwhrp89xd87l81q3h2qjll1vrwcsap645cwvb85nwsh"))))
    (build-system r-build-system)
    (propagated-inputs `(("r-psych" ,r-psych)))
    (home-page "https://cran.r-project.org/web/packages/orddom/")
    (synopsis "Ordinal dominance statistics")
    (description
     "This package provides tools to compute ordinal, statistics and effect
sizes as an alternative to mean comparison: Cliff's delta or success rate
difference (SRD), Vargha and Delaney's A or the Area Under a Receiver
Operating Characteristic Curve (AUC), the discrete type of McGraw & Wong's
Common Language Effect Size (CLES) or Grissom & Kim's Probability of
Superiority (PS), and the Number needed to treat (NNT) effect size.  Moreover,
comparisons to Cohen's d are offered based on Huberty & Lowman's Percentage of
Group (Non-)Overlap considerations.")
    (license license:gpl2)))

(define-public r-doby
  (package
    (name "r-doby")
    (version "4.6-2")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "doBy" version))
       (sha256
        (base32
         "02vbv9nfgywg6lsiialkmfnax5z3rkyb9nr8j9l2cp8xi6ml95mb"))))
    (properties `((upstream-name . "doBy")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-dplyr" ,r-dplyr)
       ("r-magrittr" ,r-magrittr)
       ("r-mass" ,r-mass)
       ("r-matrix" ,r-matrix)
       ("r-plyr" ,r-plyr)))
    (home-page "http://people.math.aau.dk/~sorenh/software/doBy/")
    (synopsis "Groupwise statistics, LSmeans, linear contrasts, and utilities")
    (description
     "This package contains:

@itemize
@item facilities for working with grouped data: @code{do}
  something to data stratified @code{by} some variables.
@item implementations of least-squares means, general linear contrasts, and
@item miscellaneous other utilities.
@end itemize\n")
    (license license:gpl2+)))

(define-public r-refgenome
  (package
    (name "r-refgenome")
    (version "1.7.3")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "refGenome" version))
       (sha256
        (base32
         "15p0ra2p1pwhy5ixbhsz1g79c5sc2aap4i4c8kil0m2syg9y45sn"))))
    (properties `((upstream-name . "refGenome")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-dbi" ,r-dbi)
       ("r-doby" ,r-doby)
       ("r-rsqlite" ,r-rsqlite)))
    (home-page "https://cran.r-project.org/web/packages/refGenome/")
    (synopsis
     "Gene and splice site annotation using annotation data from Ensembl and UCSC")
    (description
     "This package contains functionality for importing and managing of
downloaded genome annotation data from the Ensembl genome browser (European
Bioinformatics Institute) and from the UCSC genome browser (University of
California, Santa Cruz) and annotation routines for genomic positions and
splice site positions.")
    (license license:gpl2)))

(define-public r-basix
  (package
    (name "r-basix")
    (version "1.1")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "BASIX" version))
       (sha256
        (base32
         "18dkvv1iwskfnlpl6xridcgqpalbbpm2616mvc3hfrc0b26v01id"))))
    (properties `((upstream-name . "BASIX")))
    (build-system r-build-system)
    (home-page "https://cran.r-project.org/web/packages/BASIX/")
    (synopsis "Efficient C/C++ toolset for R")
    (description
     "BASIX provides some efficient C/C++ implementations of native R
procedures to speed up calculations in R.")
    (license license:gpl2)))

(define-public r-blockfest
  (package
    (name "r-blockfest")
    (version "1.6")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "BlockFeST" version))
       (sha256
        (base32
         "0hj7a5as7nxbgjac7lbj6qfwffx3g8x8phpf9a55f1c9cdzi73a5"))))
    (properties `((upstream-name . "BlockFeST")))
    (build-system r-build-system)
    (propagated-inputs `(("r-basix" ,r-basix)))
    (home-page "https://cran.r-project.org/web/packages/BlockFeST/")
    (synopsis "Bayesian calculation of region-specific fixation index")
    (description
     "This package provides an R implementation of an extension of the
BayeScan software for codominant markers, adding the option to group
individual SNPs into pre-defined blocks.  A typical application of this new
approach is the identification of genomic regions, genes, or gene sets
containing one or more SNPs that evolved under directional selection.")
    (license license:gpl2)))

(define-public r-proc
  (package
    (name "r-proc")
    (version "1.12.1")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "pROC" version))
       (sha256
        (base32
         "05ad69a6fxy9k903cw3h4q59ch2jv6qfg9yjdbw3cgiiazcafrlj"))))
    (properties `((upstream-name . "pROC")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-ggplot2" ,r-ggplot2)
       ("r-plyr" ,r-plyr)
       ("r-rcpp" ,r-rcpp)))
    (home-page "http://expasy.org/tools/pROC/")
    (synopsis "Display and analyze ROC curves")
    (description
     "This package provides tools for visualizing, smoothing and comparing
receiver operating characteristic (ROC curves).  The area under the
curve (AUC) can be compared with statistical tests based on U-statistics or
bootstrap.  Confidence intervals can be computed for (p)AUC or ROC curves.")
    (license license:gpl3+)))

(define-public r-rootsolve
  (package
    (name "r-rootsolve")
    (version "1.7")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "rootSolve" version))
       (sha256
        (base32
         "08ic6ggcc5dw4nv9xsqkm3vnvswmxyhnqnv1rdjv1h2gy1ivpcq8"))))
    (properties `((upstream-name . "rootSolve")))
    (build-system r-build-system)
    (native-inputs `(("gfortran" ,gfortran)))
    (home-page "https://cran.r-project.org/web/packages/rootSolve/")
    (synopsis "Tools for the analysis of ordinary differential equations")
    (description
     "This package provides routines to find the root of nonlinear functions,
and to perform steady-state and equilibrium analysis of @dfn{ordinary
differential equations} (ODE).  It includes routines that:

@enumerate
@item generate gradient and jacobian matrices (full and banded),
@item find roots of non-linear equations by the Newton-Raphson method,
@item estimate steady-state conditions of a system of (differential) equations
  in full, banded or sparse form, using the Newton-Raphson method, or by
  dynamically running,
@item solve the steady-state conditions for uni- and multicomponent 1-D, 2-D,
  and 3-D partial differential equations, that have been converted to ordinary
  differential equations by numerical differencing (using the method-of-lines
  approach).
@end enumerate\n")
    (license license:gpl2+)))

(define-public r-abcanalysis
  (package
    (name "r-abcanalysis")
    (version "1.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "ABCanalysis" version))
       (sha256
        (base32 "0wac1ksmnxa36v99ca4hv8k0rsh3igwpcllmlv9wf7i9kgqviqwi"))))
    (properties `((upstream-name . "ABCanalysis")))
    (build-system r-build-system)
    (propagated-inputs `(("r-plotrix" ,r-plotrix)))
    (home-page "https://www.uni-marburg.de/fb12/arbeitsgruppen/datenbionik/software-en/")
    (synopsis "Computed ABC Analysis")
    (description
     "Multivariate data sets often differ in several factors or derived statistical
parameters, which have to be selected for a valid interpretation.  Basing this
selection on traditional statistical limits leads occasionally to the perception
of losing information from a data set.  This package provides tools to calculate
these limits on the basis of the mathematical properties of the distribution of
the analyzed items.")
    (license license:gpl3)))

(define-public r-slam
  (package
    (name "r-slam")
    (version "0.1-43")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "slam" version))
       (sha256
        (base32 "0hy4qzngcgafxxr6ld7n9a9wy979ji998gpcc32vidwyab66dj5h"))))
    (build-system r-build-system)
    (home-page "https://cran.r-project.org/web/packages/slam/")
    (synopsis "Sparse lightweight arrays and matrices")
    (description
     "This package contains data structures and algorithms for sparse arrays and matrices,
based on index arrays and simple triplet representations, respectively.")
    (license license:gpl2)))

(define-public r-manipulatewidget
  (package
    (name "r-manipulatewidget")
    (version "0.10.0")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "manipulateWidget" version))
       (sha256
        (base32 "1zagrbwkn2d50zzw8i2vyb1hsq4cydmfsqiy1a2qlp6zrv8a6q9x"))))
    (properties
     `((upstream-name . "manipulateWidget")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-base64enc" ,r-base64enc)
       ("r-codetools" ,r-codetools)
       ("r-htmltools" ,r-htmltools)
       ("r-htmlwidgets" ,r-htmlwidgets)
       ("r-knitr" ,r-knitr)
       ("r-miniui" ,r-miniui)
       ("r-shiny" ,r-shiny)
       ("r-webshot" ,r-webshot)))
    (home-page "https://github.com/rte-antares-rpackage/manipulateWidget/")
    (synopsis "Add even more interactivity to interactive charts")
    (description
     "This package lets you create in just a few lines of R code a nice user interface to
modify the data or the graphical parameters of one or multiple interactive
charts.  It is useful to quickly explore visually some data or for package
developers to generate user interfaces easy to maintain.")
    (license license:gpl2+)))

(define-public r-a3
  (package
    (name "r-a3")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "A3" version))
       (sha256
        (base32 "017hq9pjsv1h9i7cqk5cfx27as54shlhdsdvr6jkhb8jfkpdb6cw"))))
    (properties `((upstream-name . "A3")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-pbapply" ,r-pbapply)
       ("r-xtable" ,r-xtable)))
    (home-page "https://cran.r-project.org/web/packages/A3/")
    (synopsis "Error metrics for predictive models")
    (description
     "This package supplies tools for tabulating and analyzing the results of predictive
models.  The methods employed are applicable to virtually any predictive model
and make comparisons between different methodologies straightforward.")
    (license license:gpl2+)))

(define-public r-infotheo
  (package
    (name "r-infotheo")
    (version "1.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "infotheo" version))
       (sha256
        (base32
         "18xacczfq3z3xpy434js4nf3l19lczngzd0lq26wh22pvg1yniwv"))))
    (build-system r-build-system)
    (home-page "http://homepage.meyerp.com/software")
    (synopsis "Information-theoretic measures")
    (description
     "This package implements various measures of information theory based on
several entropy estimators.")
    (license license:gpl3+)))

(define-public r-abcoptim
  (package
    (name "r-abcoptim")
    (version "0.15.0")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "ABCoptim" version))
       (sha256
        (base32 "1ih0xk88qhsmpvnxf56041wx5sk8as2f4f2gdnpnwdym9mbr9n4b"))))
    (properties `((upstream-name . "ABCoptim")))
    (build-system r-build-system)
    (propagated-inputs `(("r-rcpp" ,r-rcpp)))
    (home-page "https://github.com/gvegayon/ABCoptim/")
    (synopsis "Optimization of Artificial Bee Colony algorithm")
    (description
     "Artificial Bee Colony (ABC) is one of the most recently defined algorithms by Dervis
Karaboga in 2005, motivated by the intelligent behavior of honey bees.  It is as
simple as Particle Swarm Optimization (PSO) and Differential Evolution (DE)
algorithms, and uses only common control parameters such as colony size and
maximum cycle number.  The @code{r-abcoptim} implements the Artificial bee
colony optimization algorithm @url{http://mf.erciyes.edu.tr/abc/pub/tr06_2005.pdf}.
  This version is a work-in-progress and is written in R code.")
    (license license:expat)))

(define-public r-abcp2
  (package
    (name "r-abcp2")
    (version "1.2")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "ABCp2" version))
       (sha256
        (base32 "1s2skkxpzss7c29i8600psgrp0hl46jcrxqrmy2b4db8hc0kcnbx"))))
    (properties `((upstream-name . "ABCp2")))
    (build-system r-build-system)
    (propagated-inputs `(("r-mass" ,r-mass)))
    (home-page "https://cran.r-project.org/web/packages/ABCp2/")
    (synopsis "Approximate Bayesian Computational Model for Estimating P2")
    (description
     "This package tests the goodness of fit of a distribution of offspring to the Normal,
Poisson, and Gamma distribution and estimates the proportional paternity of the
second male (P2) based on the best fit distribution.")
    (license license:gpl2)))

(define-public r-abcrf
  (package
    (name "r-abcrf")
    (version "1.7.1")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "abcrf" version))
       (sha256
        (base32 "06vy3inikrr9hv36q4djhrgzi9zizdfnhz17wpra8kadmr7qj441"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-mass" ,r-mass)
       ("r-matrixstats" ,r-matrixstats)
       ("r-ranger" ,r-ranger)
       ("r-rcpp" ,r-rcpp)
       ("r-rcpparmadillo" ,r-rcpparmadillo)
       ("r-readr" ,r-readr)
       ("r-stringr" ,r-stringr)))
    (home-page "https://cran.r-project.org/web/packages/abcrf/")
    (synopsis "Approximate bayesian computation via random forests")
    (description
     "This package performs approximate bayesian computation (ABC) model choice and
parameter inference via random forests.  This machine learning tool named random
forests (RF) can conduct selection among the highly complex models covered by
ABC algorithms.")
    (license license:gpl2+)))

(define-public r-abctools
  (package
    (name "r-abctools")
    (version "1.1.3")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "abctools" version))
       (sha256
        (base32 "07s9dg10i8lsxl73b4n2hynca2fjgb0ykb0dz8c3zv6cgw3cyx97"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-abc" ,r-abc)
       ("r-abind" ,r-abind)
       ("r-hmisc" ,r-hmisc)
       ("r-plyr" ,r-plyr)))
    (home-page "https://github.com/dennisprangle/abctools/")
    (synopsis "Tools for ABC analyses")
    (description
     "This @code{r-abctools} package provides tools for approximate Bayesian computation
including summary statistic selection and assessing coverage.  This includes
recent dimension reduction algorithms to tune the choice of summary statistics,
and coverage methods to tune the choice of threshold.")
    (license license:gpl2+)))

(define-public r-ggstance
  (package
    (name "r-ggstance")
    (version "0.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "ggstance" version))
       (sha256
        (base32 "0v7f3xdaaridw6d4jvnsfwxmpjrasvx5vl555wsrn50aah17fkvh"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-ggplot2" ,r-ggplot2)
       ("r-plyr" ,r-plyr)
       ("r-rlang" ,r-rlang)
       ("r-withr" ,r-withr)))
    (home-page "https://cran.r-project.org/web/packages/ggstance/")
    (synopsis "Horizontal and vertical versions of @code{r-ggplot2}")
    (description
     "This package is a @code{r-ggplot2} extension that provides flipped components:
@enumerate
@item horizontal versions of @code{r-ggplot2} stats and @code{r-ggplot2} geoms;
@item vertical versions of @code{r-ggplot2} positions.
@end enumerate")
    (license license:gpl3)))

(define-public r-mosaiccore
  (package
    (name "r-mosaiccore")
    (version "0.6.0")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "mosaicCore" version))
       (sha256
        (base32 "1klw97h6lchw1cpcl8s637ikcl428cckmjq0czi7mibh9q9mw72z"))))
    (properties `((upstream-name . "mosaicCore")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-dplyr" ,r-dplyr)
       ("r-lazyeval" ,r-lazyeval)
       ("r-mass" ,r-mass)
       ("r-rlang" ,r-rlang)
       ("r-tidyr" ,r-tidyr)))
    (home-page "https://github.com/ProjectMOSAIC/mosaicCore/")
    (synopsis "Common utilities for mosaic family packages")
    (description
     "Common utilities used in other Mosaic family packages are collected here.")
    (license license:gpl2+)))

(define-public r-ggformula
  (package
    (name "r-ggformula")
    (version "0.9.0")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "ggformula" version))
       (sha256
        (base32 "1pmpdfjfbrc6kcpq70cr1kbj2qy711hw940g2aiis6l443z706kh"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-ggplot2" ,r-ggplot2)
       ("r-ggstance" ,r-ggstance)
       ("r-magrittr" ,r-magrittr)
       ("r-mosaiccore" ,r-mosaiccore)
       ("r-rlang" ,r-rlang)
       ("r-stringr" ,r-stringr)
       ("r-tibble" ,r-tibble)
       ("r-tidyr" ,r-tidyr)))
    (home-page "https://github.com/ProjectMOSAIC/ggformula/")
    (synopsis "Formula interface for the @code{r-ggplot2}")
    (description
     "The @code{r-ggformula} introduces a family of graphics functions, gf_point(),
gf_density(), and so on, bring the formula interface to ggplot().  This captures
and extends the excellent simplicity of the lattice-graphics formula interface,
while providing the intuitive capabilities of @code{r-ggplot2}.")
    (license license:expat)))

(define-public r-mosaicdata
  (package
    (name "r-mosaicdata")
    (version "0.17.0")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "mosaicData" version))
       (sha256
        (base32 "04z0mdm52mykqsxsinhmsihn181zf6cw321gayk2rjp7lj7mwdq9"))))
    (properties `((upstream-name . "mosaicData")))
    (build-system r-build-system)
    (home-page "https://cran.r-project.org/web/packages/mosaicData/")
    (synopsis "Data sets for project Mosaic")
    (description
     "This package provides data sets from project Mosaic @url{http://mosaic-web.org}
used to teach mathematics, statistics, computation and modeling.")
    (license license:gpl2+)))

(define-public r-mosaic
  (package
   (name "r-mosaic")
   (version "1.4.0")
   (source
    (origin
     (method url-fetch)
     (uri (cran-uri "mosaic" version))
     (sha256
      (base32 "10jbrg8kli00kfgbh2f67bymm5cnlancc9dplb1j7fl552yjddn2"))))
   (build-system r-build-system)
   (propagated-inputs
    `(("r-broom" ,r-broom)
      ("r-dplyr" ,r-dplyr)
      ("r-ggdendro" ,r-ggdendro)
      ("r-ggformula" ,r-ggformula)
      ("r-ggplot2" ,r-ggplot2)
      ("r-ggrepel" ,r-ggrepel)
      ("r-glue" ,r-glue)
      ("r-gridextra" ,r-gridextra)
      ("r-lattice" ,r-lattice)
      ("r-latticeextra" ,r-latticeextra)
      ("r-lazyeval" ,r-lazyeval)
      ("r-mass" ,r-mass)
      ("r-matrix" ,r-matrix)
      ("r-mosaiccore" ,r-mosaiccore)
      ("r-mosaicdata" ,r-mosaicdata)
      ("r-readr" ,r-readr)
      ("r-tidyr" ,r-tidyr)))
   (home-page "https://github.com/ProjectMOSAIC/mosaic/")
   (synopsis "Mathematics, statistics, and computation teaching utilities")
   (description
    "This package contain data sets and utilities from
@url{http://mosaic-web.org, Project MOSAIC} used to teach mathematics,
statistics, computation and modeling.  Project MOSAIC is a community of
educators working to tie together aspects of quantitative work that students
in science, technology, engineering and mathematics will need in their
professional lives, but which are usually taught in isolation, if at all.")
   (license license:gpl2+)))

(define-public r-abd
  (package
    (name "r-abd")
    (version "0.2-8")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "abd" version))
       (sha256
        (base32 "191gspqzdv573vaw624ri0f5cm6v4j524bjs74d4a1hn3kn6r9b7"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-lattice" ,r-lattice)
       ("r-mosaic" ,r-mosaic)
       ("r-nlme" ,r-nlme)))
    (home-page "https://cran.r-project.org/web/packages/abd/")
    (synopsis "Analysis of biological data")
    (description
     "The @code{r-abd} package contains data sets and sample code for the Analysis of
biological data by Michael Whitlock and Dolph Schluter.")
    (license license:gpl2)))

(define-public r-svgui
  (package
    (name "r-svgui")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "svGUI" version))
       (sha256
        (base32 "1r7ab0p4yr8q03gj02hmj7k1ghksgkg4nx750c0ajfs2q9y1dxfc"))))
    (properties `((upstream-name . "svGUI")))
    (build-system r-build-system)
    (home-page "https://github.com/SciViews/svGUI/")
    (synopsis "Functions for managing GUI clients in R")
    (description
     "The SciViews @code{svGUI} package eases the management of Graphical User
Interfaces (GUI) in R.  It is independent from any particular GUI widgets.  It
centralizes info about GUI elements currently used, and it dispatches GUI
calls to the particular toolkits in use in function of the context.")
    (license license:gpl2)))

(define-public r-svdialogs
  (package
    (name "r-svdialogs")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "svDialogs" version))
       (sha256
        (base32 "0xqppydfawnwk84kb5qiybwbcmv38vn4imgz01mz2pnq4xb80p97"))))
    (properties `((upstream-name . "svDialogs")))
    (build-system r-build-system)
    (inputs
     `(("yad" ,yad)
       ("zenity" ,zenity)))
    (propagated-inputs
     `(("r-rstudioapi" ,r-rstudioapi)
       ("r-svgui" ,r-svgui)))
    (home-page "https://github.com/SciViews/svDialogs/")
    (synopsis "Portable dialog boxes")
    (description
     "This package helps to construct standard dialog boxes for your GUI, including
message boxes, input boxes, list, file or directory selection, and others.  In
case R cannot display GUI dialog boxes, a simpler command line version of these
interactive elements is also provided as a fallback solution.")
    (license license:gpl2)))

(define-public r-abe
  (package
    (name "r-abe")
    (version "3.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "abe" version))
       (sha256
        (base32
         "1f19h3xzzmjhvwc1rrb8z0rai3ip03y4gdi2gg9bfr5sg2nfklk6"))))
    (build-system r-build-system)
    (home-page "https://cran.r-project.org/web/packages/abe/")
    (synopsis "Augmented backward elimination")
    (description
     "This package performs augmented backward elimination and checks the
stability of the obtained model.  Augmented backward elimination combines
significance or information based criteria with the change in estimate to
either select the optimal model for prediction purposes or to serve as a tool
to obtain a practically sound, highly interpretable model.")
    (license license:gpl2+)))

(define-public r-abf2
  (package
    (name "r-abf2")
    (version "0.7-1")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "abf2" version))
       (sha256
        (base32 "0d65mc1w4pbiv7xaqzdlw1bfsxf25587rv597hh41vs0j0zlfpxx"))))
    (build-system r-build-system)
    (home-page "https://cran.r-project.org/web/packages/abf2/")
    (synopsis "Load gap-free axon @code{r-abf2} files")
    (description
     "This package loads electrophysiology data from ABF2 files, as created by
Axon Instruments/Molecular Devices software.  Only files recorded in gap-free
mode are currently supported.")
    (license license:artistic2.0)))

(define-public r-abhgenotyper
  (package
    (name "r-abhgenotyper")
    (version "1.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "ABHgenotypeR" version))
       (sha256
        (base32 "08cpmnaaxsm5c5bjifnfxdlvg5inrf13biqpcl2yq5zpqjmiki0l"))))
    (properties `((upstream-name . "ABHgenotypeR")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-ggplot2" ,r-ggplot2)
       ("r-reshape2" ,r-reshape2)))
    (home-page "https://github.com/StefanReuscher/ABHgenotypeR/")
    (synopsis "Visualize and manipulate ABH genotypes")
    (description
     "The @code{r-abhgenotyper} package provides simple imputation,
error-correction and plotting capacities for genotype data.  The package is
supposed to serve as an intermediate but independent analysis tool between the
TASSEL GBS pipeline and the @code{r-qtl} package.  It provides functionalities
not found in either TASSEL or @code{r-qtl} in addition to visualization of
genotypes as \"graphical genotypes\".")
    (license license:gpl3)))

(define-public r-abjutils
  (package
    (name "r-abjutils")
    (version "0.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "abjutils" version))
       (sha256
        (base32 "0qrsc4if7aif73qp95lw6b5986c2r0jn7m39123zij8k15vc935b"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-devtools" ,r-devtools)
       ("r-dplyr" ,r-dplyr)
       ("r-glue" ,r-glue)
       ("r-httr" ,r-httr)
       ("r-magrittr" ,r-magrittr)
       ("r-plyr" ,r-plyr)
       ("r-progress" ,r-progress)
       ("r-purrr" ,r-purrr)
       ("r-rstudioapi" ,r-rstudioapi)
       ("r-scales" ,r-scales)
       ("r-stringi" ,r-stringi)
       ("r-stringr" ,r-stringr)
       ("r-tibble" ,r-tibble)
       ("r-tidyr" ,r-tidyr)))
    (home-page "https://github.com/abjur/abjutils/")
    (synopsis "Collection of tools for jurimetrical analysis")
    (description
     "This package implements general purpose tools, such as functions for
sampling and basic manipulation of Brazilian lawsuits identification number.
It also implements functions for text cleaning, such as accentuation
removal.")
    (license license:expat)))

(define-public r-abnormality
  (package
    (name "r-abnormality")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "abnormality" version))
       (sha256
        (base32 "1fzfskl9akl06nliy8hkv2a0pznpj8pwcypg3gj5r2nzvr3kan9v"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-mass" ,r-mass)
       ("r-matrix" ,r-matrix)))
    (home-page "https://cran.r-project.org/web/packages/abnormality/")
    (synopsis "Measure a subject's abnormality with respect to a reference population")
    (description
     "This package contains functions to implement the methodology and
considerations laid out by Marks et al. in the article \"Measuring abnormality
in high dimensional spaces: applications in biomechanical gait analysis\".
Using high-dimensional datasets to measure a subject's overall level of
abnormality as compared to a reference population is often needed in outcomes
research.")
    (license license:expat)))

(define-public r-abodoutlier
  (package
    (name "r-abodoutlier")
    (version "0.1")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "abodOutlier" version))
       (sha256
        (base32 "1pvhgxmh23br84r0fbmv7g53z2427birdja96a67vqgz18r3fdvj"))))
    (properties `((upstream-name . "abodOutlier")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-cluster" ,r-cluster)))
    (home-page "https://cran.r-project.org/web/packages/abodOutlier/")
    (synopsis "Angle-based outlier detection")
    (description
     "This package performs angle-based outlier detection on a given data
frame.  It offers three methods to process data:
@enumerate
@item full but slow implementation using all the data that has cubic
  complexity;
@item a fully randomized method;
@item a method using k-nearest neighbours.
@end enumerate
These algorithms are well suited for high dimensional data outlier
detection.")
    (license license:expat)))

(define-public r-abps
  (package
    (name "r-abps")
    (version "0.2")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "ABPS" version))
       (sha256
        (base32 "1k3f5i34f4w2khkszb4qhwwcpiy7gsfh82vjr6rypwg6rx5rjclq"))))
    (properties `((upstream-name . "ABPS")))
    (build-system r-build-system)
    (propagated-inputs `(("r-kernlab" ,r-kernlab)))
    (home-page "https://cran.r-project.org/web/packages/ABPS/")
    (synopsis "Abnormal blood profile score to detect blood doping")
    (description
     "This package offers an implementation of the @dfn{Abnormal blood profile score} (ABPS).
The ABPS is a part of the Athlete biological passport program of the World
anti-doping agency, which combines several blood parameters into a single
score in order to detect blood doping.  The package also contains functions to
calculate other scores used in anti-doping programs, such as the ratio of
hemoglobin to reticulocytes (OFF-score), as well as example data.")
    (license license:gpl2+)))

(define-public r-parmigene
  (package
    (name "r-parmigene")
    (version "1.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "parmigene" version))
       (sha256
        (base32
         "1fsm6pkr17jcbzkj1hbn91jf890fviqk1lq6ls8pihsdgah1zb4d"))))
    (build-system r-build-system)
    (home-page "https://cran.r-project.org/web/packages/parmigene/")
    (synopsis "Mutual information estimation for gene network reconstruction")
    (description
     "This package provides a parallel estimation of the mutual information
based on entropy estimates from k-nearest neighbors distances and algorithms
for the reconstruction of gene regulatory networks.")
    (license license:agpl3+)))

(define-public r-pscl
  (package
    (name "r-pscl")
    (version "1.5.2")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "pscl" version))
       (sha256
        (base32 "1phf3awsfr4ncqfqzin5m1pz0g7y1zhbcm2sz7358ssw914fd7rc"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-mass" ,r-mass)))
    (home-page "https://github.com/atahk/pscl/")
    (synopsis "Political science computational laboratory")
    (description
     "The @code{pscl} is an R package providing classes and methods for:
@enumerate
@item Bayesian analysis of roll call data (item-response models);
@item elementary Bayesian statistics;
@item maximum likelihood estimation of zero-inflated and hurdle models for count
data;
@item utility functions.
@end enumerate")
    (license license:gpl2)))

(define-public r-accelmissing
  (package
    (name "r-accelmissing")
    (version "1.4")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "accelmissing" version))
       (sha256
        (base32 "1nql9inx6azdzi3z4sfm2vdml2mms6krl8wzlf1dn1c97ahn57fy"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-mice" ,r-mice)
       ("r-pscl" ,r-pscl)))
    (home-page "https://cran.r-project.org/web/packages/accelmissing/")
    (synopsis "Missing value imputation for accelerometer data")
    (description
     "This package provides a statistical method to impute the missing values in
accelerometer data.  The methodology includes both parametric and
semi-parametric multiple imputations under the zero-inflated Poisson lognormal
model.  It also provides multiple functions to preprocess the accelerometer data
previous to the missing data imputation.  These include detecting the wearing
and the non-wearing time, selecting valid days and subjects, and creating plots.")
    (license license:gpl2+)))

(define-public r-mhsmm
  (package
    (name "r-mhsmm")
    (version "0.4.16")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "mhsmm" version))
       (sha256
        (base32 "009dj0zkj1zry7jr9hf4cknb686z50a2l967if64xm0dvjmp7dgs"))))
    (build-system r-build-system)
    (propagated-inputs `(("r-mvtnorm" ,r-mvtnorm)))
    (home-page "https://github.com/jaredo/mhsmm/")
    (synopsis "Inference for hidden Markov and semi-Markov models")
    (description
     "The @code{r-mhsmm} package implements estimation and prediction methods for
hidden Markov and semi-Markov models for multiple observation sequences.  Such
techniques are of interest when observed data is thought to be dependent on some
unobserved (or hidden) state.  Also, this package is suitable for equidistant
time series data, with multivariate and/or missing data.  Allows user defined
emission distributions.")
    (license license:gpl2+)))

(define-public r-nleqslv
  (package
    (name "r-nleqslv")
    (version "3.3.2")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "nleqslv" version))
       (sha256
        (base32 "1v9znvncyigw9r25wx2ma0b7ib179b488dl0qsrhp5zrcz7mcjgm"))))
    (build-system r-build-system)
    (native-inputs `(("gfortran" ,gfortran)))
    (home-page "https://cran.r-project.org/web/packages/nleqslv/")
    (synopsis "Solve systems of nonlinear equations")
    (description
     "The @code{r-nleqslv} package solves a system of nonlinear equations using a
Broyden or a Newton method with a choice of global strategies such as line
search and trust region.  There are options for using a numerical or user
supplied Jacobian, for specifying a banded numerical Jacobian and for allowing a
singular or ill-conditioned Jacobian.")
    (license license:gpl2+)))

(define-public r-physicalactivity
  (package
    (name "r-physicalactivity")
    (version "0.2-2")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "PhysicalActivity" version))
       (sha256
        (base32 "14z6plgwyr46vs9m997rvlz8sdglfs9g087an8668zqkzzs2w4ln"))))
    (properties
     `((upstream-name . "PhysicalActivity")))
    (build-system r-build-system)
    (home-page "https://cran.r-project.org/web/packages/PhysicalActivity/")
    (synopsis "Procesing accelerometer data for physical activity measurement")
    (description
     "This @code{r-physicalactivity} package provides a function @code{wearingMarking}
for classification of monitor wear and nonwear time intervals in accelerometer
data collected to assess physical activity.  The package also contains functions
for making plots of accelerometer data and obtaining the summary of various
information including daily monitor wear time and the mean monitor wear time
during valid days.  The revised package version 0.2-1 improved the functions
regarding speed, robustness and add better support for time zones and daylight
saving.  In addition, several functions were added:
@enumerate
@item the @code{markDelivery} can classify days for ActiGraph delivery by mail;
@item the @code{markPAI} can categorize physical activity intensity level based
on user-defined cut-points of accelerometer counts.
@end enumerate
  It also supports importing ActiGraph (AGD) files with @code{readActigraph} and
@code{queryActigraph} functions.")
    (license license:gpl3+)))

(define-public r-acc
  (package
    (name "r-acc")
    (version "1.3.3")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "acc" version))
       (sha256
        (base32 "1ii2vm47djxbixa75h690q1s2f9m9x6i8nkygik93j6dayr6kr1m"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-circlize" ,r-circlize)
       ("r-dbi" ,r-dbi)
       ("r-ggplot2" ,r-ggplot2)
       ("r-iterators" ,r-iterators)
       ("r-mhsmm" ,r-mhsmm)
       ("r-nleqslv" ,r-nleqslv)
       ("r-physicalactivity" ,r-physicalactivity)
       ("r-plyr" ,r-plyr)
       ("r-r-utils" ,r-r-utils)
       ("r-rcpp" ,r-rcpp)
       ("r-rcpparmadillo" ,r-rcpparmadillo)
       ("r-rsqlite" ,r-rsqlite)
       ("r-zoo" ,r-zoo)))
    (home-page "https://cran.r-project.org/web/packages/acc/")
    (synopsis "Exploring accelerometer data")
    (description
     "This package processes accelerometer data from uni-axial and tri-axial devices
and generates data summaries.  Also, includes functions to plot, analyze, and
simulate accelerometer data.")
    (license license:gpl2+)))

(define-public r-rbenchmark
  (package
    (name "r-rbenchmark")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "rbenchmark" version))
       (sha256
        (base32 "010fn3qwnk2k411cbqyvra1d12c3bhhl3spzm8kxffmirj4p2al9"))))
    (build-system r-build-system)
    (home-page "https://cran.r-project.org/web/packages/rbenchmark/")
    (synopsis "Benchmarking routine for R")
    (description
     "This @code{r-rbenchmark} package is inspired by the Perl module Benchmark,
and is intended to facilitate benchmarking of arbitrary R code.  The library
consists of just one function, benchmark, which is a simple wrapper around
system.time.  Given a specification of the benchmarking process (counts of
replications, evaluation environment) and an arbitrary number of expressions,
benchmark evaluates each of the expressions in the specified environment,
replicating the evaluation as many times as specified, and returning the results
conveniently wrapped into a data frame.")
    (license license:gpl2+)))

(define-public r-dvmisc
  (package
    (name "r-dvmisc")
    (version "1.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "dvmisc" version))
       (sha256
        (base32 "1dy0yykskwhkql19bhzmbwsgv028afc8jh9yqwbczj6f3vpv31zh"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-mass" ,r-mass)
       ("r-rbenchmark" ,r-rbenchmark)
       ("r-rcpp" ,r-rcpp)))
    (home-page "https://cran.r-project.org/web/packages/dvmisc/")
    (synopsis "Faster computation of common statistics and miscellaneous functions")
    (description
     "This package implements faster versions of base R functions (e.g. mean, standard
deviation, covariance, weighted mean), mostly written in C++, along with
miscellaneous functions for various purposes (e.g. create the histogram with
fitted probability density function or probability mass function curve, create
the body mass index groups, assess the linearity assumption in logistic
regression).")
    (license license:gpl2)))

(define-public r-accelerometry
  (package
    (name "r-accelerometry")
    (version "3.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "accelerometry" version))
       (sha256
        (base32 "13xzrwhr4i1nj9c8vrmfdg2rmrc8n446iihcyxmy99sm99hpzyip"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-dvmisc" ,r-dvmisc)
       ("r-rcpp" ,r-rcpp)))
    (home-page "https://cran.r-project.org/web/packages/accelerometry/")
    (synopsis "Functions for processing accelerometer data")
    (description
     "This package provides a collection of functions that perform operations on
time-series accelerometer data, such as identify the non-wear time, flag minutes
that are part of an activity bout, and find the maximum 10-minute average count
value.  The functions are generally very flexible, allowing for a variety of
algorithms to be implemented.")
    (license license:gpl3)))

(define-public r-absim
  (package
    (name "r-absim")
    (version "0.2.6")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "AbSim" version))
       (sha256
        (base32 "16ddjk8b6xw80ch4jis1y751i9561wdxh0gifbf15qiz3vjckq8m"))))
    (properties `((upstream-name . "AbSim")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-ape" ,r-ape)
       ("r-powerlaw" ,r-powerlaw)))
    (home-page "https://cran.r-project.org/web/packages/AbSim/")
    (synopsis "Time resolved simulations of antibody repertoires")
    (description
     "This package provides simulation methods for the evolution of antibody repertoires.
  The heavy and light chain variable region of both human and C57BL/6 mice can
be simulated in a time-dependent fashion.  Both single lineages using one set of
V-, D-, and J-genes or full repertoires can be simulated.  The algorithm begins
with an initial V-D-J recombination event, starting the first phylogenetic tree.
  Upon completion, the main loop of the algorithm begins, with each iteration
representing one simulated time step.  Various mutation events are possible at
each time step, contributing to a diverse final repertoire.")
    (license license:gpl2)))

(define-public r-ac3net
  (package
    (name "r-ac3net")
    (version "1.2.2")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "Ac3net" version))
       (sha256
        (base32 "1ns4n0xxz6p34c11bj0k7nzgmyqr9mis2b0g5nfz37dbikndyqyz"))))
    (properties `((upstream-name . "Ac3net")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-data-table" ,r-data-table)))
    (home-page "https://cran.r-project.org/web/packages/Ac3net/")
    (synopsis "Inferring directional conservative causal core gene networks")
    (description "This package infers directional Conservative causal core
(gene) networks (C3NET).  This is a version of the algorithm C3NET with
directional network.")
    (license license:gpl3+)))

(define-public r-aca
  (package
    (name "r-aca")
    (version "1.1")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "ACA" version))
       (sha256
        (base32 "1i3hm27nvnkvc39xlh0d1blq8q0q02czmvgi3cazmjx3jvxay0vq"))))
    (properties `((upstream-name . "ACA")))
    (build-system r-build-system)
    (home-page "https://cran.r-project.org/web/packages/ACA/")
    (synopsis "Abrupt change-point or aberration detection in point series")
    (description
     "This package offers an interactive function for the detection of breakpoints in
series.")
    ;; Any version of the GPL
    (license (list license:gpl2+ license:gpl3+))))

(define-public r-acceptancesampling
  (package
    (name "r-acceptancesampling")
    (version "1.0-5")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "AcceptanceSampling" version))
       (sha256
        (base32 "18krmmyn8pn11aqd81kbvka68lnd36mnpdh7p3pz9r4m4vjj007x"))))
    (properties
     `((upstream-name . "AcceptanceSampling")))
    (build-system r-build-system)
    (home-page "https://cran.r-project.org/web/packages/AcceptanceSampling/")
    (synopsis "Creation and evaluation of acceptance sampling plans")
    (description
     "This @code{r-acceptancesampling} provides functionality for creating and evaluating
acceptance sampling plans.  Acceptance sampling is a methodology commonly used
in quality control and improvement.  International standards of acceptance
sampling provide sampling plans for specific circumstances.  The aim of this
package is to provide an easy-to-use interface to visualize single, double or
multiple sampling plans.  In addition, methods have been provided to enable the
user to assess sampling plans against pre-specified levels of performance, as
measured by the probability of acceptance for a given level of quality in the
lot.")
    (license license:gpl3+)))

(define-public r-acclma
  (package
    (name "r-acclma")
    (version "1.0")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "ACCLMA" version))
       (sha256
        (base32 "1na27sp18fq12gp6vxgqw1ffsz2yi1d8xvrxbrzx5g1kqxrayy0v"))))
    (properties `((upstream-name . "ACCLMA")))
    (build-system r-build-system)
    (home-page "https://cran.r-project.org/web/packages/ACCLMA/")
    (synopsis "ACC & LMA graph plotting")
    (description
     "This package contains a function that imports data from a @acronym{Comma-Separated
Values, @acronym{CSV}} file, or uses manually entered data from the format (x,
y, weight) and plots the appropriate @acronym{Absolute Concentration Curve,
@acronym{ACC}} vs @acronym{Line of Independence, @acronym{LOI}} graph and
@acronym{@acronym{LOI} Minus @acronym{ACC}, @acronym{LMA}} graph.  The main
function is plotLMA (source file, header) that takes a data set and plots the
appropriate @acronym{LMA} and @acronym{ACC} graphs.  If no source file (a
string) was passed, a manual data entry window is opened.  The header parameter
indicates by TRUE/FALSE (false by default) if the source @acronym{CSV} file has
a header row or not.  The dataset should contain only one independent variable
(x) and one dependent variable (y) and can contain a weight for each
observation.")
    (license license:gpl2)))
