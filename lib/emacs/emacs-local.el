;; Use UTF-8
;(require 'un-define)
;(require 'jisx0213)

;;; auctex mode
(load "auctex.el" nil t t)
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(add-hook 'LaTeX-mode-hook 'outline-minor-mode)

;;; preview tex
(load "preview-latex.el" nil t t)
(setq preview-image-type 'dvipng)

;; cc-mode
;;

(autoload 'c-mode          "cc-mode" "C Editing Mode"                   t)
(autoload 'c++-mode        "cc-mode" "C++ Editing Mode"                 t)
(autoload 'hide-ifdef-mode "hideif"  "Hides selected code within ifdef" t)
;(fmakunbound 'c-mode)
(setq compile-command "make -k")

(add-hook 'c++-mode-hook
    (lambda ()
        (setq comment-column 40)
	(define-key c++-mode-map "\C-m" 'newline-and-indent)
	(define-key c++-mode-map "\C-j" 'newline)
        (define-key c++-mode-map "\C-c\C-c" 'compile)
        (define-key c++-mode-map "\C-cc" 'comment-region)
	(define-key c++-mode-map "\C-cg" 'gdb)
	 ))


(add-hook 'c-mode-hook
    (lambda ()
        (setq comment-column 40)
	(define-key c-mode-map "\C-m" 'newline-and-indent)
	(define-key c-mode-map "\C-j" 'newline)
        (define-key c-mode-map "\C-c\C-c" 'compile)
        (define-key c-mode-map "\C-cc" 'comment-region)
	(define-key c-mode-map "\C-cg" 'gdb)
	 ))

;; html-helper-mode
(load "hhm.dot.emacs")

;; psgml
(autoload 'sgml-mode "psgml" "Major mode to edit SGML files." t)
(autoload 'xml-mode "psgml" "Major mode to edit XML files." t)

;;; rpm-mode ���ɤ߹���
;;; rpm-mode.el �� spec �ե�����κ����������Ǥ���
;;;   ~/lib/emacs �� /usr/doc/rpm/rpm-mode.el �򥳥ԡ����ưʲ��������
;;; �ԤäƤ���������

(setq auto-mode-alist (nconc '(("\\.spec" . rpm-mode)) auto-mode-alist))
(autoload 'rpm-mode "rpm-mode" "Major mode for editing SPEC file of RPM." t) 
(setq packager "Your Name <?????@bcl.sci.yamaguchi-u.ac.jp>");��ʬ��̾��
      (setq buildrootroot "/tmp");BuildRoot�ξ��
      (setq projectoname "BCL");�ץ�������̾ 

;;; ruby-mode
(autoload 'ruby-mode "ruby-mode")
(setq auto-mode-alist
      (append (list (cons "//.rb$" 'ruby-mode)) auto-mode-alist))
(setq interpreter-mode-alist
      (append '(("ruby" . ruby-mode)) interpreter-mode-alist))

;;;; seimei handan
(autoload 'seimei "seimei" "seimei" t)
(autoload 'seimei-region "seimei" "seimei" t)
