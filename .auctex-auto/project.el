;; -*- lexical-binding: t; -*-

(TeX-add-style-hook
 "project"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("article" "letterpaper" "12pt")))
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("amsmath" "") ("amsfonts" "") ("amssymb" "") ("amsthm" "") ("braket" "") ("geometry" "margin=1.0in") ("bbold" "") ("ragged2e" "") ("tikz" "") ("tkz-euclide" "") ("svg" "") ("setspace" "") ("physics" "") ("float" "") ("caption" "") ("subcaption" "") ("changepage" "") ("appendix" "title") ("lipsum" "") ("listings" "") ("titling" "") ("hyperref" "colorlinks=true" "linkcolor=blue")))
   (add-to-list 'LaTeX-verbatim-environments-local "lstlisting")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "href")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperimage")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperbaseurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "nolinkurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "lstinline")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "lstinline")
   (TeX-run-style-hooks
    "latex2e"
    "article"
    "art12"
    "amsmath"
    "amsfonts"
    "amssymb"
    "amsthm"
    "braket"
    "geometry"
    "bbold"
    "ragged2e"
    "tikz"
    "tkz-euclide"
    "svg"
    "setspace"
    "physics"
    "float"
    "caption"
    "subcaption"
    "changepage"
    "appendix"
    "lipsum"
    "listings"
    "titling"
    "hyperref")
   (LaTeX-add-labels
    "eq:1"
    "eq:2"
    "eq:3"
    "fig:1"
    "fig:2"
    "fig:3"
    "fig:4a"
    "fig:4b"
    "fig:4c"
    "fig:4"
    "fig:5a"
    "fig:5b"
    "fig:5c"
    "fig:5d"
    "fig:5"
    "appendix:A"
    "appendix:B"
    "appendix:C"
    "appendix:D"))
 :latex)

