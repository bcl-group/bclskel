;;; html-helper-mode

;; Initialization
(autoload 'html-helper-mode "html-helper-mode" "Yay HTML" t)
(setq auto-mode-alist (append
		       '(
			 ("\\.html" . html-helper-mode)
			 ("\\.shtml" . html-helper-mode))
		       auto-mode-alist))


;; Set this to be whatever signature
;; you want on the bottom of your pages. 
;(setq html-helper-address-string "who@hoge.ne.jp")


;; If not nil, then use the full HTML menu.
;(setq html-helper-use-expert-menu nil) ;; Default


;; If not nil,
;; then modify `local-write-file-hooks' to do timestamps.
;(setq html-helper-do-write-file-hooks t) ;; Default 


;;If not nil,
;; then insert `html-helper-new-buffer-strings' for new buffers.
;(setq html-helper-build-new-buffer t) ;; Default


;; Version of HTML DTD you're using.
;(setq html-helper-htmldtd-version
;      "<!DOCTYPE HTML PUBLIC \"-//IETF//DTD HTML//EN\">\n") ;; Default

 
;; Extra items to put in the HTML expert menu.
;; The value of this symbol is appended to the beginning of the expert
;; menu that is handed off to easymenu for definition.
;; It should be a list of vectors or lists
;; which themselves are vectors (for submenus).
;(setq html-helper-user-menu nil) ;; Default


;; Basic indentation size used for list indentation
;(setq html-helper-basic-offset 2) ;; Default


;; Indentation of lines that follow a <li> item.
;; Default is 4, the length of things like \"<li>\" and \"<dd>\".
;(setq html-helper-item-continue-indent 4) ;; Default


;; If not nil,
;; the indentation code for html-helper is turned off.
;(setq html-helper-never-indent nil) ;; Default


;; Template for new buffers.
;; Inserted by `html-helper-insert-new-buffer-strings'
;; if `html-helper-build-new-buffer' is set to t
;(setq html-helper-new-buffer-template
;  '(html-helper-htmldtd-version
;    "<html> <head>\n"
;    "<title>" p "</title>\n</head>\n\n"
;    "<body>\n"
;    "<h1>" p "</h1>\n\n"
;    p
;    "\n\n<hr>\n"
;    "<address>" html-helper-address-string "</address>\n"
;    html-helper-timestamp-start
;    html-helper-timestamp-end
;    "\n</body> </html>\n")) ;; Default


;; Start delimiter for timestamps.
;; Everything between `html-helper-timestamp-start' and
;; `html-helper-timestamp-end' will be deleted and
;; replaced with the output of the functions `html-helper-timestamp-hook'
;; if `html-helper-do-write-file-hooks' is t
;(setq html-helper-timestamp-start "<!-- hhmts start -->\n") ;; Default


;; End delimiter for timestamps.
;; Everything between `html-helper-timestamp-start' and
;; `html-helper-timestamp-end' will be deleted and
;; replaced with the output of the function `html-helper-insert-timestamp'
;; if `html-helper-do-write-file-hooks' is t
;(setq html-helper-timestamp-end "<!-- hhmts end -->") ;; Default


;; Change format and {start,end} delimiter for timestamps.
;; if you will be use this,
;; you should change `html-helper-new-buffer-template'. 
;(setq html-helper-timestamp-start       "<META name=\"date\" content=\""
;      html-helper-timestamp-end         "\">")
;(defun TT:html-helper-insert-timestamp ()
;  (let ((tz (car (current-time-zone)))
;        (tzh) (tzm))
;    (setq tzh (/ tz 3600)
;          tz (- tz (* tzh 3600)))
;    (setq tzm (/ tz 60)
;          tz (- tz (* tzm 60)))
;    (insert
;     (concat
;      (format-time-string "%Y-%m-%dT%H:%M:%S" (current-time))
;      (format "%s%02d:%02d" (if (> tzh 0) "+" "-") tzh tzm)))))
;(setq html-helper-timestamp-hook 'TT:html-helper-insert-timestamp)
