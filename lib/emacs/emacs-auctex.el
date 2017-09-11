;;
;; setting for auc-tex
;;
;(setq load-path
;    (cons (expand-file-name "/usr/local/lib/xemacs/site-lisp/auctex/") 
;		load-path))

(require 'tex-site)
(require 'tex-jp)

(add-hook 'LaTeX-mode-hook 'outline-minor-mode)

(setq TeX-command-list
      (append (list (list "jTeX" "jtex '\\nonstopmode\\input %t'"
                          'TeX-run-TeX nil t)
                    (list "jLaTeX" "jlatex '\\nonstopmode\\input{%t}'"
                          'TeX-run-LaTeX nil t)
                    (list "pTeX" "ptex '\\nonstopmode\\input %t'"
                          'TeX-run-TeX nil t)
                    (list "pLaTeX" "platex '\\nonstopmode\\input{%t}'"
                          'TeX-run-LaTeX nil t)
                    (list "jBibTeX" "jbibtex %s" 'TeX-run-BibTeX nil nil)
                    (list "mendex" "mendex %s" 'TeX-run-Mendex nil nil))
              TeX-command-list))

;(setq TeX-print-command "dvi2ps -R 600 %s -P%p")
;(setq TeX-printer-list 
;    '(("Local" "dvi2ps -R 600 %s | lpr" "lpq") ("quill") ("plume")))

(setq TeX-print-command "dvips -f %s | lpr -P%p")
(setq TeX-printer-list 
    '(("Local" "dvips -f %s | lpr" "lpq") ("quill") ("plume")))

; LaTeX 209 のソースも platex でフォーマットする
(add-hook 'LaTeX-mode-hook
  (function (lambda ()
    (setq TeX-command-default "pLaTeX")
  )))

; LaTeX 2e のソースは platex2e で
(add-hook 'LaTeX2e-hook
  (function (lambda ()
    (setq TeX-command-default "pLaTeX")
 )))

