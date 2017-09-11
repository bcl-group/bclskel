;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  FSF Emacs 20/21 �� �桼������ե�����Υ���ץ�
;;            MATSUBAYASHI 'Shaolin' Kohji (shaolin@vinelinux.org)
;;                      modified by Jun Nishii <jun@vinelinux.org>
;;                      modified by Daisuke SUZUKI <daisuke@vinelinux.org>
;;            $Id: .emacs.el,v 1.48 2006/11/04 12:58:15 daisuke Exp $
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;  �����ƥ�Υ��åץ��졼�ɻ��ˤ��Υե������ưŪ�˹�������������
;;  ���Υե�������ѹ������� .emacs.my.el �˵��Ҥ��Ƥ���������


;;; �������ե�����λ���

(setq user-init-file "~/lib/emacs/emacs.el")

;;; �ޥ��������ѥ����ɲ�
;;; ~/lib/emacs �ʲ��˥桼���Ѥ� *.el, *.elc ���֤����Ȥ��Ǥ��ޤ�
(setq load-path (append '("~/lib/emacs") load-path))

;;; ����Ķ��λ���

(set-language-environment "Japanese")

;;; ���������ɤ�����

(if (equal (getenv "LANG") "ja_JP.UTF-8")
  (progn
    (cond ((<= emacs-major-version 21)
      (require 'un-define)))
    (set-default-coding-systems 'utf-8)
    (set-buffer-file-coding-system 'utf-8-unix)
    (set-terminal-coding-system 'utf-8)
    (set-keyboard-coding-system 'utf-8))
    ;;; ���ܸ��˥塼�С� (UTF-8�Υ�˥塼�С����Ѱ�?)
    ;(cond
    ;  (and (>= emacs-major-version 21)
    ;       (equal (substring (concat (getenv "LANG") "__") 0 2) "ja")
    ;     (load "menu-tree-utf8")))
  (progn
    (set-default-coding-systems 'euc-jp)
    (set-buffer-file-coding-system 'euc-jp-unix)
    (set-terminal-coding-system 'euc-jp)
    (set-keyboard-coding-system 'euc-jp)
    ;;; ���ܸ��˥塼�С�
    (cond
      ((and (>= emacs-major-version 21)
           (equal (substring (concat (getenv "LANG") "__") 0 2) "ja"))
         (load "menu-tree")))
))

;;; emacsclient �����Ф�ư
(server-start)

;; �Ķ��ѿ� EMACS_IME ��Ĵ�٤롣
;; EMACS_IME ���ʤ���� scim ����Ѥ���

(setq emacs-ime (getenv "EMACS_IME"))
(if (null emacs-ime)
    (setq emacs-ime "scim"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; X �� Emacs �Υե����/���顼����
;; .emacs-faces.el, .emacs-fontset.el ����
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(load "~/lib/emacs/emacs-faces.el")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; emacs-21 ������
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(cond
 ((>= emacs-major-version 21)
 
 ;;; ��˥塼�С���ä�
 ;(menu-bar-mode nil)
 ;;; �ġ���С���ä�
 ;(tool-bar-mode nil)
 ;;; cursor �� blink ��ߤ��
 ;(blink-cursor-mode nil) 
 ;;; ɽ���ιԴ֤�Ȥ���
 ;(set-default 'line-spacing 2)
 ;;; active �Ǥʤ� window �ζ� cursor ��Ф��ʤ�
 (setq cursor-in-non-selected-windows nil)
 ;;; �ե���ȤΥ�������򤷤ʤ�
 (setq scalable-fonts-allowed nil)
 ;;; [Home] Key �� [End] Key �����ư����᤹
 (define-key global-map [home] 'beginning-of-buffer)
 (define-key global-map [end] 'end-of-buffer)

 ;;; image.el �ˤ����� JPEG ��Ƚ�����ˤ��
 ;(eval-after-load "image"
 ; '(setq image-type-regexps
 ;   (cons (cons "^\377\330" 'jpeg) image-type-regexps)))

 ;;; ɽ���ιԴ֤�Ȥ���
 (setq line-spacing 2)

))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Egg (Wnn �ե��ȥ����) ������
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Wnn6/FreeWnn
(if (or (equal emacs-ime "wnn")
        (equal emacs-ime "Wnn")
        (equal emacs-ime "wnn6")
        (equal emacs-ime "Wnn6")
        (equal emacs-ime "wnn8")
        (equal emacs-ime "Wnn8"))
    (progn
      (if (>= emacs-major-version 21)

      (progn

         ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	 ;;emacs-dl-wnn�Ǥʤ��Ȥ�������( emacs-21 + tamago v4)

	 (global-set-key "\C-\\" 'toggle-input-method)
         ;; Shift-Space �ޤ��� Ⱦ��/���� �Ǥⵯư
	 (global-set-key [?\S-\ ] 'toggle-input-method)
	 (global-set-key [zenkaku-hankaku] 'toggle-input-method)
	 (load "egg")
	 
	 ;; InputMethod ������
	 ;; emacs ��ư�� ASCII
	 ;;(setq default-input-method "japanese-egg-wnn")
	 ;; emacs ��ư���������ܸ�����
	 (set-input-method "japanese-egg-wnn")
	 
	 ;; jserver�λ���
	 ;; jserver �Υꥹ�Ȥ򼡤��ͤˤ��ƻ���Ǥ��ޤ�
	 ;;(setq jserver-list '("vanilla" "espresso"))
	 (setq jserver-list (list (getenv "JSERVER") "localhost"))


	 ;;--------------------------------------------------------
	 ;; tamago v4
	 ;;--------------------------------------------------------
	 ;; ����
	 
	 ;;(setq egg-default-startup-file "eggrc-wnn") ; 95.6.1 by S.Tomura
	 (garbage-collect)
	 
	 ;; "nn" �ǡ֤�פ�����
	 (setq enable-double-n-syntax t)
	 
	 ;; "." �ǡ�.�ס�"," �ǡ�,�פ����ϡ�
	 (setq use-kuten-for-period nil)
	 (setq use-touten-for-comma nil)
	 
	 )
       
       ;; emacs-dl-wnn �ξ�� (emacs-20)
       (progn
	 (autoload 'egg "egg" "Initialize EGG." t)
	 (egg)
	 (global-set-key "\C-\\" 'toggle-egg-mode)
	 (global-set-key [\S-\ ] 'toggle-egg-mode)
	 (define-key isearch-mode-map "\C-\\" 'isearch-fep-egg)
	 (autoload 'toggle-egg-mode "egg" "Initialize EGG." t)
	 (autoload 'isearch-fep-egg "isearch-ext"
	   "Read string for incremental search by using egg." t)
	 
	 (setq egg-default-startup-file "eggrc-wnn") ; 95.6.1 by S.Tomura
	 (garbage-collect)
	 
	 ;; jserver �Υꥹ�Ȥ򼡤��ͤˤ��ƻ���Ǥ��ޤ�
	 ;;(setq jserver-list '("vanilla" "espresso"))
	 (setq jserver-list (list (getenv "JSERVER") "localhost"))
	 
	 ;; "nn" �ǡ֤�פ�����
	 (setq enable-double-n-syntax t)
	 
	 ;; "." �ǡ�.�ס�"," �ǡ�,�פ����ϡ�
	 (setq use-kuten-for-period nil)
	 (setq use-touten-for-comma nil)
	 
	 ;; 1234567890%#%"' ���Ⱦ�ѡפ�����"
	 (let ((its:*defrule-verbose* nil))
	   (its-define-mode "roma-kana")
	   (dolist (symbol '("1" "2" "3" "4" "5"
			     "6" "7" "8" "9" "0"
			     "#" "%" "\"" "'" ))
	     (its-defrule symbol symbol)))
	 
	 )
       )
      )
  )


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Wnn7Egg (Wnn7 �ե��ȥ����) ������
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(if (or (equal emacs-ime "wnn7")
        (equal emacs-ime "Wnn7"))
    (progn
      (setq load-path (append '("/usr/share/wnn7/elisp/emacs20") load-path))
      (global-set-key "\C-\\" 'toggle-input-method)
      ;; Shift-Space �ޤ��� Ⱦ��/���� �Ǥⵯư
      (global-set-key [?\S-\ ] 'toggle-input-method)
      (global-set-key [zenkaku-hankaku] 'toggle-input-method)
      ;; canna like toggle keybind
      ;;(global-set-key "\C-o" 'toggle-input-method)
      (load "wnn7egg-leim")
      (set-input-method "japanese-egg-wnn7")
      (set-language-info "Japanese" 'input-method "japanese-egg-wnn7")

      ;; "nn" �ǡ֤�פ�����
      (setq enable-double-n-syntax t)
      ;; ��������⡼��
      (egg-use-input-predict)
      (setq egg-predict-realtime nil)
      ;; ����饤���������⡼��
      (setq egg-predict-mode "inline")
      ;; ������ɥ���������⡼��
      ;(setq egg-predict-mode "window")

      ;; ����ꥹ��ɽ��
      (define-key wnn7-henkan-mode-map " " 'wnn7-henkan-select-kouho-dai)

      ;; 1234567890%#%"'/\| ���Ⱦ�ѡפ�����
      (let ((its:*defrule-verbose* nil))
        (its-define-mode "roma-kana")
        (dolist (symbol '("1" "2" "3" "4" "5" 
                          "6" "7" "8" "9" "0"
                          "#" "%" "\"" "'" "/" "\\" "|"))
                (its-defrule symbol symbol)))
    )
)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ����ʤ�����
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(if (or (equal emacs-ime "canna")
	(equal emacs-ime "Canna")
	(equal emacs-ime "canna-tamago"))

    (progn
    (if (and (or (and (boundp 'CANNA) CANNA)
		 (<= emacs-major-version 20))
	     (not (equal emacs-ime "canna-tamago")))
	(progn
	  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	  ;; emacs-dl-canna/emcws �ξ��
	  
	  (load-library "canna")
	  
	  ;; color-mate ��Ȥ�ʤ��ǡ������Ѵ��˿����դ���������
	  ;(setq canna-use-color t)
	  
	  ;; �ե��󥹥⡼�ɤǤʤ���������饤���Ȥ�
	  ;;(setq canna-with-fences nil)
	  ;;(setq canna-underline t)
	  
	  ;; Canna �����Фλ���
	  (if (null (getenv "CANNA_SERVER"))
	      (setq canna-server "unix")
	    (setq canna-server (getenv "CANNA_SERVER")))
	  (canna)
	  
	  ;; Canna �� Ctrl-\ �ǵ�ư���ޤ��������ȥ����Ȥ���С�
	  ;; Ctrl-\ �� skk ��Ω���夬��ޤ���
	  (global-set-key "\C-\\" 'canna-toggle-japanese-mode)
	  (global-set-key "\C-o" 'canna-toggle-japanese-mode)
	  ;; Shift-Space �ޤ��� Ⱦ��/���� �Ǥⵯư
          (global-set-key [?\S-\ ] 'canna-toggle-japanese-mode)
          (global-set-key [zenkaku-hankaku] 'canna-toggle-japanese-mode)
	  
	  (global-set-key "\C-_" 'canna-undo)  ;����ɥ������ꡣ
	  (setq canna-save-undo-text-predicate ;����ɥ��Хåե����������
		'(lambda (s) (> (length (car s)) 2)) )
	  (setq canna-undo-hook ;����ɥ��ܦ���
		'(lambda () (message "���Ѵ����ޤ�....")                          
		   (canna-do-function canna-func-henkan)) )
	  
	  ;;����ʤ��Ѵ���� BS & DEL ��Ȥ�
	  (define-key canna-mode-map [backspace] [?\C-h])
	  (define-key canna-mode-map [delete] [?\C-h])
	  
	  ;;����ʤ��Ѵ���� C-h ��Ȥ� (with term/keyswap)
	  (define-key canna-mode-map [?\177] [?\C-h])
	  ))
  
    (if (or (and (not (and (boundp 'CANNA) CANNA))
		 (>= emacs-major-version 21))
	    (equal emacs-ime "canna-tamago"))
	(progn
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	   ;; emacs-dl-canna/emcws �Ǥʤ��Ȥ� (tamago4)
	   
	   ;; Canna �����Фλ���
	   ;;(setq canna-hostname "unix/")

	   (require 'egg)
	   
	   ;; InputMethod ������
	   (setq default-input-method "japanese-egg-canna")
	   
	   ;; tamago v4 ��������
	   
	   (setq
	    ;; �����Ѵ�����ȡʼ�ưŪ�ˡ˼����ȿ�Ǥ��뤫
	    wnn-auto-save-dictionaries 1
	    ;; nil �ˤ���ȡ�alphanumeric ��Ⱦ�����Ϥˤʤ�餷����
	    its-enable-fullwidth-alphabet nil
	    ;; Backspace �Ǿä��Ȥ��ˡ����ʤ����Ϥ������޻���Ÿ������
	    ;; ���޻�ñ�̤Ǿä���
	    its-delete-by-keystroke t
	    ;; �����������ˡ���Ѥ��ߤ����Ǥ����褯ʬ����ޤ���
	    egg-mode-preference t
	    ;; "nn" �ǡ֤�פ�����
	    enable-double-n-syntax t
	    ;; "." �ǡ֡��ס�"," �ǡ֡��פ����ϡ� 
	    use-kuten-for-period nil
	    use-touten-for-comma nil
	    ;; ����κǸ�ޤǹԤä�����Ƭ�����
	    egg-conversion-wrap-select t
	    ;; ���������ɽ������ޤǤ��Ѵ������0����ɽ��
	    egg-conversion-auto-candidate-menu 2)
	   
	   ;; F7 �� toroku-region
	   (global-set-key [f7] 'egg-toroku-region)

	   ;; Canna ������ (Canna ����������)
	   (load "its")
	   (define-key global-map "\C-o" 'toggle-input-method)
           (global-set-key [?\S-\ ] 'toggle-input-method)
           (global-set-key [zenkaku-hankaku] 'toggle-input-method)
	   (define-key isearch-mode-map "\C-o" 'isearch-toggle-input-method)
           (define-key isearch-mode-map [?\S-\ ] 'isearch-toggle-input-method)
           (define-key isearch-mode-map [zenkaku-hankaku] 'isearch-toggle-input-method)
	   (define-key its-mode-map "\C-h" 'its-delete-backward-SYL)
	   (define-key its-mode-map "\C-p" 'its-hiragana)
	   (define-key its-mode-map "\C-y" 'its-hiragana)
	   (define-key its-mode-map "\C-n" 'its-katakana)
	   (define-key its-mode-map [up] 'its-hiragana)
	   (define-key its-mode-map [down] 'its-katakana)
	   (define-key egg-conversion-map "\C-g" 'egg-abort-conversion)
	   (cond ((eq window-system 'x)
		  (define-key its-mode-map [henkan] 'its-kick-convert-region)
		  (define-key its-mode-map [hiragana-katakana] 'its-katakana)
		  (define-key its-mode-map [muhenkan] 'its-hiragana)
		  (define-key its-mode-map [f6] 'its-hiragana)
		  (define-key its-mode-map [f7] 'its-katakana)
		  (define-key its-mode-map [f8] 'its-half-width)
		  (define-key its-mode-map [backspace] 'its-delete-backward-SYL)
		  ;(define-key menudiag-mode-map [backspace] 'menudiag-exit-one-level)
		  (define-key its-mode-map [delete] 'its-delete-SYL))
		 ((null window-system)
		  (define-key its-mode-map "\e[17~" 'its-hiragana)
		  (define-key its-mode-map "\e[18~" 'its-katakana)
		  (define-key its-mode-map "\e[19~" 'its-half-width)
		  (define-key its-mode-map [8] 'its-delete-backward-SYL)
		  ;(define-key menudiag-mode-map [8] 'menudiag-exit-one-level)
		  (define-key its-mode-map "\e[3~" 'its-delete-SYL)))
	   )
      )
    )
  )


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Atok for X ������
;;  IIIMP ��ͳ�Ǽ¹Ԥ��ޤ�
;; (�� MULE-UCS, IIIMECF)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(if (equal emacs-ime "atokx")
    (progn

      (require 'un-define)      
      (setq coding-category-utf-8 'utf-8)

      (setq iiimcf-server-control-hostlist '("localhost"))
      (setq iiimcf-server-control-default-language "ja")
      (setq default-input-method 'iiim-server-control)
      (require 'iiimcf-sc)

      ;; �Ѵ��ȥ��������
      (define-key global-map "\C-\\" 'toggle-input-method)
      ;; Shift-Space �ޤ��� Ⱦ��/���� �Ǥⵯư
      (global-set-key [?\S-\ ] 'toggle-input-method)
      (global-set-key [zenkaku-hankaku] 'toggle-input-method)

      ;;�⡼�ɥ饤��ɽ���򤹤ä����
      ;;(setcar default-mode-line-format "")

      )
  )


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; anthy.el ������
;; (�ܤ����� /usr/share/doc/anthy-*/doc/ELISP �򻲾Ȥ��Ƥ�������)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(if (or (equal emacs-ime "anthy-el")
	(equal emacs-ime "Anthy-el"))
    (progn
      (require 'anthy)
      ;; �Ѵ����ϥ���
      (define-key global-map "\C-\\" 'toggle-input-method)
      (define-key global-map "\C-o" 'toggle-input-method)
      (define-key global-map [kanji] 'toggle-input-method)
      (define-key global-map [M-kanji] 'toggle-input-method)
      (global-set-key [?\S-\ ] 'toggle-input-method)
      (global-set-key [zenkaku-hankaku] 'toggle-input-method)
      
      ;; �Хå����ڡ����ǥ��޻�ñ�̤Ǿä�
      ;(anthy-set-break-into-roman 't)
    )
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; tamago-anthy ������
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(if (and (boundp 'input-method-alist)
         (or (equal emacs-ime "scim")
             (equal emacs-ime "SCIM")
	     (equal emacs-ime "anthy")
	     (equal emacs-ime "Anthy")
	     (equal emacs-ime "egg-anthy")
	     (equal emacs-ime "tamago-anthy"))
	 (assoc "japanese-egg-anthy" input-method-alist))
    (progn
	   (require 'egg)
	   ;; InputMethod ������
	   (setq default-input-method "japanese-egg-anthy")
	   
	   ;; tamago v4 ��������
	   (setq
	    ;; �����Ѵ�����ȡʼ�ưŪ�ˡ˼����ȿ�Ǥ��뤫
	    wnn-auto-save-dictionaries 1
	    ;; nil �ˤ���ȡ�alphanumeric ��Ⱦ�����Ϥˤʤ�餷����
	    its-enable-fullwidth-alphabet nil
	    ;; Backspace �Ǿä��Ȥ��ˡ����ʤ����Ϥ������޻���Ÿ������
	    ;; ���޻�ñ�̤Ǿä���
	    its-delete-by-keystroke t
	    ;; �����������ˡ���Ѥ��ߤ����Ǥ����褯ʬ����ޤ���
	    egg-mode-preference t
	    ;; "nn" �ǡ֤�פ�����
	    enable-double-n-syntax t
	    ;; "." �ǡ֡��ס�"," �ǡ֡��פ����ϡ� 
	    use-kuten-for-period nil
	    use-touten-for-comma nil
	    ;; ����κǸ�ޤǹԤä�����Ƭ�����
	    egg-conversion-wrap-select t
	    ;; ���������ɽ������ޤǤ��Ѵ������0����ɽ��
	    egg-conversion-auto-candidate-menu 2
	    ;; �����ʥ����������󥹤�ٹ𤹤�
	    its-barf-on-invalid-keyseq t)
	   
	   ;; F7 �� toroku-region
	   (global-set-key [f7] 'egg-toroku-region)

	   ;; egg-anthy.el
	   (add-hook 'anthy-load-hook '(lambda () (load "egg-anthy")))

	   (load "its")
	   (define-key global-map "\C-o" 'toggle-input-method)
           (global-set-key [?\S-\ ] 'toggle-input-method)
           (global-set-key [zenkaku-hankaku] 'toggle-input-method)
	   (define-key isearch-mode-map "\C-o" 'isearch-toggle-input-method)
           (define-key isearch-mode-map [?\S-\ ] 'isearch-toggle-input-method)
           (define-key isearch-mode-map [zenkaku-hankaku] 'isearch-toggle-input-method)
	   (define-key its-mode-map "\C-h" 'its-delete-backward-SYL)
	   (define-key its-mode-map "\C-p" 'its-hiragana)
	   (define-key its-mode-map "\C-y" 'its-hiragana)
	   (define-key its-mode-map "\C-n" 'its-katakana)
	   (define-key its-mode-map "\C-k" 'its-katakana)
	   (define-key its-mode-map [up] 'its-hiragana)
	   (define-key its-mode-map [down] 'its-katakana)
	   (define-key egg-conversion-map "\C-g" 'egg-abort-conversion)
	   (cond ((eq window-system 'x)
		  (define-key its-mode-map [henkan] 'its-kick-convert-region)
		  (define-key its-mode-map [hiragana-katakana] 'its-katakana)
		  (define-key its-mode-map [muhenkan] 'its-hiragana)
		  (define-key its-mode-map [f6] 'its-hiragana)
		  (define-key its-mode-map [f7] 'its-katakana)
		  (define-key its-mode-map [f8] 'its-half-width)
		  (define-key its-mode-map [backspace] 'its-delete-backward-SYL)
		  (define-key its-mode-map [delete] 'its-delete-SYL))
		 ((null window-system)
		  (define-key its-mode-map "\e[17~" 'its-hiragana)
		  (define-key its-mode-map "\e[18~" 'its-katakana)
		  (define-key its-mode-map "\e[19~" 'its-half-width)
		  (define-key its-mode-map [8] 'its-delete-backward-SYL)
		  (define-key its-mode-map "\e[3~" 'its-delete-SYL)))
	   )
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; uim.el ������
;; (�ܤ����� /usr/share/doc/uim-el-*/README.ja �򻲾Ȥ��Ƥ�������)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(if (or (equal emacs-ime "uim")
        (equal emacs-ime "UIM"))
    (progn
      (require 'uim)
      ;; �Ѵ����ϥ���
      (global-set-key "\C-\\" 'uim-mode)
      (global-set-key "\C-o" 'uim-mode)
      (global-set-key [kanji] 'uim-mode)
      (global-set-key [M-kanji] 'uim-mode)
      (global-set-key [?\S-\ ] 'uim-mode)
      (global-set-key [zenkaku-hankaku] 'uim-mode)

      ;; Anthy �λ��ϥǥե���ȤǤҤ餬�����Ϥ�
      (setq uim-default-im-prop '("action_anthy_hiragana"
                                  "action_canna_hiragana"
				  "action_skk_hiragana"))
      
      ;; �Ѵ������ǥե���Ȥǥ���饤��ɽ���ˤ���
      ;(setq uim-candidate-display-inline t)
    )
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; SKK-9.6m 
;;   Mule ��β�̾�����Ѵ������ƥ� SKK ������
;;   C-x t �ǥ��塼�ȥꥢ�뤬��ư���ޤ�
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;; ���Ѥ��뼭������� ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; SKK-JISYO.L ��������ɤ߹�������Ѥ�����
(setq skk-large-jisyo "/usr/share/skk/SKK-JISYO.L")

;;; SKK-JISYO.M ��������ɤ߹��ߡ�
;;; ���դ���ʤ����� skkserv ��ư���� SKK-JISYO.L ���鸡��������
;;; (skkexdic �ѥå�������ɬ�פǤ�)
;;(setq skk-large-jisyo "/usr/share/skk/SKK-JISYO.M")
;;(setq skk-aux-large-jisyo "/usr/share/skk/SKK-JISYO.L")
;;(setq skk-server-portnum 1178)
;;(setq skk-server-host "localhost")
;;(setq skk-server-prog "/usr/libexec/skkserv")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(global-set-key "\C-x\C-j" 'skk-mode)
(global-set-key "\C-xj" 'skk-auto-fill-mode)
(global-set-key "\C-xt" 'skk-tutorial)
(autoload 'skk-mode "skk" nil t)
(autoload 'skk-auto-fill-mode "skk" nil t)
(autoload 'skk-tutorial "skk-tut" nil t)
(autoload 'skk-isearch-mode-setup "skk-isearch" nil t)
(autoload 'skk-isearch-mode-cleanup "skk-isearch" nil t)
(add-hook 'isearch-mode-hook
	  (function (lambda ()
		      (and (boundp 'skk-mode) skk-mode
			   (skk-isearch-mode-setup) ))))
(add-hook 'isearch-mode-end-hook
	  (function (lambda ()
		      (and (boundp 'skk-mode) skk-mode
			   (skk-isearch-mode-cleanup)
			   (skk-set-cursor-color-properly) ))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; T-Gnus 6.13.3 (����)
;;   NetNews �꡼���� GNUS (SEMI �б���)
;;   M-x gnus �ǵ�ư���ޤ�
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; News Server ̾��ɥᥤ��̾��Ŭ�ڤ˻��ꤷ�Ƥ�������
;(setq gnus-nntp-server "news.hoge.hoge.or.jp")
;(setq gnus-local-domain "hoge.hoge.or.jp")
;(setq gnus-local-organization "HogeHoGe Org.")
;(setq gnus-use-generic-from t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Mew 3.3  -  Messaging in the Emacs World
;;   �᡼��꡼���� Mew
;;   M-x mew �ǵ�ư���ޤ�
;;
;;   �Ŀ��Ѥ�����ե������ ~/.mew.el �����Ѥ��Ƥ���������
;;   �ǿ��� .mew.el �� /usr/share/doc/mew-common-*/vine.dot.mew �ˤ���ޤ���
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(autoload 'mew "mew" nil t)
(autoload 'mew-send "mew" nil t)

(if (file-exists-p (expand-file-name "~/lib/emacs/mew.emacs-4.1.el"))
    (load (expand-file-name "~/lib/emacs/mew.emacs-4.1.el") nil t nil))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; X-Face-Mule
;;   Mew �� Wanderlust �ʤɤǡ�X-Face �����Ĥ��Υ�å�������ɽ�����ޤ�
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(if (and window-system (module-installed-p 'bitmap))
    (progn
      (require 'bitmap)
      (require 'x-face-e21)
      (mapcar (lambda (fontset)
                (set-fontset-font
                  fontset 'bitmap
                  "-etl-fixed-medium-r-*--16-*-100-100-m-*-bitmap.8x16-0"))
              (fontset-list))

      ; for Wanderlust
      (setq wl-highlight-x-face-function
	    'x-face-decode-message-header)

      ; for Mew
      (setq mew-use-highlight-x-face t)
      (setq mew-use-highlight-x-face-function
	    (function
	     (lambda (beg end)
	       (x-face-mule-x-face-decode-message-header beg end))))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; irchat-pj-2.4.24.07
;;   IRC (����å�) ���饤����Ȥ�����
;;   M-x irchat �ǵ�ư���ޤ�
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(autoload 'irchat "irchat" nil t)

;;; IRC server �λ���
;;; (�����줫��Ĥ򥳥��ȥ����Ȥ��ޤ�)
;;(setq irchat-server "irc.tohoku.ac.jp")
;;(setq irchat-server "irc.kyutech.ac.jp")
;;(setq irchat-server "irc.tokyo.wide.ad.jp")
;;(setq irchat-server "irc.kyoto.wide.ad.jp")
;;(setq irchat-server "irc.huie.hokudai.ac.jp")
;;(setq irchat-server "irc.cc.yamaguchi-u.ac.jp")
;;(setq irchat-server "irc.karrn.ad.jp")
;;(setq irchat-server "irc.kyoto.wide.ad.jp")

;;; �桼����̾�ȥ˥å��͡���
;;; (nick ��Ⱦ�ѱѿ������ []{}_\^ ����ʤ���� 9 ʸ����ʸ����Ǥ�)
(setq irchat-name "IRC sample user")
(setq irchat-nickname "VineUser")

;;; �ǥե���Ȥǻ��ä�������ͥ�Υꥹ��
;;;  �ʤ����˽񤤤������ͥ�ˤ� irchat �ε�ư��Ʊ���˻��äǤ��ޤ���
;;(setq irchat-startup-channel-list '("#linuxjp,#vinetest"))
(setq irchat-startup-channel-list '("#vinetest"))

;;; ���ץ����
;;;   �ܺ٤� /usr/doc/irchat-pj-2.4.24.07/doc �ʲ��Υե�����򻲾�
(setq irchat-reconnect-automagic t)      ; �ڤ줿���˺���³���ߤ�
;;(setq irchat-channel-buffer-mode t)    ; ����ͥ�ʬ��ɽ���⡼��
;;(setq irchat-display-channel-always t)
;;(setq irchat-default-freeze-local nil)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; YaTeX 1.72
;;   [La]TeX ���ϥ⡼��
;;   M-x yatex �Ȥ��뤫��.tex �ǽ����ե�������ɤ߹���ȵ�ư���ޤ�
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;(autoload 'yatex-mode "yatex" "Yet Another LaTeX mode" t)

;; YaTeX-mode
;(setq auto-mode-alist
;      (cons (cons "\\.tex$" 'yatex-mode) auto-mode-alist))
;(setq dvi2-command "xdvi"
;      tex-command "platex -src-specials"
;      dviprint-command-format "dvips %s | lpr"
;      YaTeX-kanji-code 3)

;; YaHtml-mode
;(setq auto-mode-alist
;      (cons (cons "\\.html$" 'yahtml-mode) auto-mode-alist))
;(autoload 'yahtml-mode "yahtml" "Yet Another HTML mode" t)
;(setq yahtml-www-browser "firefox")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; dic (eldic.el)
;;   Mule ��� dic �����Ѥ��뤿�������Ǥ�
;;   ~/lib/emacs �� /usr/doc/dic/eldic.el �򥳥ԡ�����
;;   dic-shell-file-name ���դ��Ŭ�ڤ����ꤷ�Ƥ���������
;;   C-c C-c C-e �Ǳ��¡�C-c C-c C-j ���±Ѥ������ޤ���
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;(global-set-key "\C-c\C-c\C-e" 'lookup-edic)
;;(global-set-key "\C-c\C-c\C-j" 'lookup-jdic)
;;(autoload 'lookup-edic "eldic" nil t)
;;(autoload 'lookup-jdic "eldic" nil t)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; �ۥ�����ޥ����б�
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun up-slightly () (interactive) (scroll-up 5))
(defun down-slightly () (interactive) (scroll-down 5))
(global-set-key [mouse-4] 'down-slightly)
(global-set-key [mouse-5] 'up-slightly)
                     
(defun up-one () (interactive) (scroll-up 1))
(defun down-one () (interactive) (scroll-down 1))
(global-set-key [S-mouse-4] 'down-one)
(global-set-key [S-mouse-5] 'up-one)

(defun up-a-lot () (interactive) (scroll-up))
(defun down-a-lot () (interactive) (scroll-down))
(global-set-key [C-mouse-4] 'down-a-lot)
(global-set-key [C-mouse-5] 'up-a-lot)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Liece
;;  IRC ���饤����ȤǤ���
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(autoload 'liece "liece" nil t)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; rpm-mode
;;  RPM �� spec �ե���������ѥ⡼��
;;  ~/lib/emacs �� /usr/doc/rpm/rpm-mode.el �򥳥ԡ����ưʲ��������
;;  �ԤäƤ�������
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;(setq auto-mode-alist (nconc '(("\\.spec" . rpm-mode)) auto-mode-alist))
;(autoload 'rpm-mode "rpm-mode" "Major mode for editing SPEC file of RPM." t) 
;(setq packager "Vine User <vine@hoge.fuga>");��ʬ��̾��
;      (setq buildrootroot "/var/tmp");BuildRoot�ξ��
;      (setq projectoname "Project Vine");�ץ�������̾ 


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ����¾������
;;
;; ������������ѹ�������ϡ�~/.emacs.my.el �˽񤯤���
;; �����ᤷ�ޤ���etcskel �ѥå������Υ��åץǡ��Ȼ��� 
;; /etc/skel/.emacs.el �򤽤Τޤ޾�񤭤Ǥ��ޤ���
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; Dired ������
;; Dired �Υꥹ�ȥե����ޥå����� (ls �ؤΥ��ץ����)
;; (setq dired-listing-switches "-aoFLt")
;; ls �ν��Ϥ�Ѹ�ˤ���(ls �� LANG=C �Ǽ¹�)
(add-hook 'dired-mode-hook  '(lambda ()(setenv "LANG" "C")))


;;; C-h �� Del �������ؤ�
;;; Help �� Shift + Ctrl + h ����� Del �˳����Ƥ�졢
;;; ����ʸ������� Ctrl + h �˳����Ƥ��ޤ�
;(load-library "term/keyswap")
;(if (eq window-system 'x)
;    (progn
;      (define-key function-key-map [delete] [8])
;      (put 'delete 'ascii-character 8)))

;;; Ctrl-H ����1ʸ��������ѹ�
(define-key global-map "" 'backward-delete-char)

;;; ��������С���¦��ɽ������
(set-scroll-bar-mode 'right)

;;; gz�ե�������Խ��Ǥ���褦��
(auto-compression-mode t)

;;; ��Ԥ� 80 ���ʾ�ˤʤä����ˤϼ�ư���Ԥ���
(setq fill-column 80)
(setq text-mode-hook 'turn-on-auto-fill)
(setq default-major-mode 'text-mode)

;;; ���ơ������饤��˻��֤�ɽ������
(if (or (and (>= emacs-major-version 20)
             (not (equal (getenv "LANG") "ja_JP.UTF-8")))
        (>= emacs-major-version 22))
    (progn
      (setq dayname-j-alist
           '(("Sun" . "��") ("Mon" . "��") ("Tue" . "��") ("Wed" . "��")
             ("Thu" . "��") ("Fri" . "��") ("Sat" . "��")))
      (setq display-time-string-forms
           '((format "%sǯ%s��%s��(%s) %s:%s %s"
                     year month day
                     (cdr (assoc dayname dayname-j-alist))
                     24-hours minutes
		     load)))
      ))
(display-time)

;;; visible-bell
(setq visible-bell t)

;;; ���ֹ��ɽ������
(line-number-mode t)

;;; mule/emacs -nw �ǵ�ư�������˥�˥塼�С���ä�
;(if window-system (menu-bar-mode 1) (menu-bar-mode -1))

;;; ��������
;(setq-default lpr-switches '("-Pepson"))
(setq-default lpr-switches '("-2P"))
(setq-default lpr-command "mpage")

;;; ps-print
(setq ps-multibyte-buffer 'non-latin-printer)
(if (>= emacs-major-version 21)
    (progn
      (require 'ps-mule)
      (defalias 'ps-mule-header-string-charsets 'ignore)))

;;; �Хåե��κǸ��newline�ǿ����Ԥ��ɲä���Τ�ػߤ���
(setq next-line-add-newlines nil)

;;; ���̺ǲ��Ԥ�[��]�򲡤����Ȥ��Υ��������
;(setq scroll-step 1)
 
;;; mark �ΰ�˿��դ�
;(setq transient-mark-mode t)

;;; �ǽ��������μ�ư����
;;;   �ե��������Ƭ���� 8 �԰���� Time-stamp: <> �ޤ���
;;;   Time-stamp: " " �Ƚ񤤤Ƥ���С������ֻ��˼�ưŪ�����դ���������ޤ�
(if (not (memq 'time-stamp write-file-hooks))
    (setq write-file-hooks
          (cons 'time-stamp write-file-hooks)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; �桼���ѽ�����ե�����
;; ~/.emacs.my.el �˸Ŀ��������񤱤ޤ���
;; ���Υե������ľ�ܤ����ꤿ���ʤ����ϡ��Ŀ������ʬΥ���Ƥ�������

(if (file-exists-p (expand-file-name "~/.emacs.my.el"))
    (load (expand-file-name "~/.emacs.my.el") nil t nil))


(load "emacs-local.el")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ���Υե�����˴ְ㤤�����ä��������Ƥ�̵���ˤ��ޤ�
(put 'eval-expression 'disabled nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Local Variables:
;; mode: emacs-lisp
;; End:
