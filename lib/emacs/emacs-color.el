;;; Dot.emacs.default -- Coloring mule/emacs to more easier and more fun. -*-emacs-lisp-*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;   Color-Mate  Ver.10.1
;;         by 横田 裕思 (yokota@netlab.is.tsukuba.ac.jp)
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;   Coloring mule/emacs to more easier and more fun.
;;   mule / emacs で、色を使用して見やすい画面にします
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Author: YOKOTA Hiroshi <yokota@netlab.is.tsukuba.ac.jp>
;; Maintainer: YOKOTA Hiroshi <yokota@netlab.is.tsukuba.ac.jp>
;; Version: 10.1
;; Keywords: color hilit19 font-lock color-mate
;; Content-Type: text/plain; charset=x-euc-jp

;$Id: .emacs-color.el,v 1.2 2000/10/01 16:33:54 jun Exp $

;----------------------------------;
; 設定ファイルの読み込みパスの設定
;----------------------------------;
; Add "~/elisp/color-mate" to your load path.
;
; Color-Mate のファイルが ~/elisp/color-mate 以外の場所に有る時はここを
; 変更して下さい。
;(setq load-path
;      (cons
;       (expand-file-name
;	"~/elisp/color-mate") load-path))


(if (string-match "XEmacs" emacs-version)
  (setq color-mate:base-path "/usr/lib/xemacs/site-packages/lisp/color-mate")
  (setq color-mate:base-path "/usr/share/emacs/site-lisp/color-mate")
)
(setq load-path
      (append
       (list color-mate:base-path
	     (concat color-mate:base-path "/theme")
	     (concat color-mate:base-path "/contrib")
	     (concat color-mate:base-path "/kanakan-cursor"))
       load-path))

;-------------------------------------------------------;
; フォントの大きさの設定 10,12,14,16,18,20,24 から選べます
;-------------------------------------------------------;
;(setq default-fontset "fontset-14")

;-------------------------------------------------------;
; テーマ設定 お気に入りのテーマファイルを選んでください
;-------------------------------------------------------;
;; theme file name (default "SunnyDay")

;(setq color-mate:theme-file "SunnyDay")
;(setq color-mate:theme-file "SunnyDay-LCD")
;(setq color-mate:theme-file "GreenTea")
;(setq color-mate:theme-file "Maron")
;(setq color-mate:theme-file "MidNight")
;(setq color-mate:theme-file "Null")
;(setq color-mate:theme-file "Stone")
;(setq color-mate:theme-file "WaterWorld")
;(setq color-mate:theme-file "Wine")

; cm_select でテーマ選択してemacs/xemacs を起動する時はこちら
; emacs-color (or xemacs-color) [テーマ名]  で起動できます
(load "cm_select")

;-------------------------------------------------------;
; その他の設定 詳しくは該当elのヘッダに説明を見てください
;-------------------------------------------------------;
;;; summary-color の設定
;
;(setq summary-color-mailer 'mew)
;(setq summary-color-list 
;                   '(("Charley"  "Yellow" "black") ; 文字:黄色,  背景: 黒
;                     ("Bob" "Red")             ; 文字:赤,  背景: 変えない.
;                     ("Taro" "Gray")))         ; 文字:灰色,  背景: 変えない.
;; (require 'summary-color)

;;; vregister の設定
;
;(load "vregister.el")

;------------------------------------------;
; Drag & Drop Support for "Mule for Win32"
;------------------------------------------;
(if (and (boundp 'MULE)
	 (eq window-system 'win32))
    (load "win32dropfiles"))

;-----------------;
; Color-Mate 起動
;-----------------;
; start Color-Mate
(if (and (>= (string-to-int emacs-version) 19)
	 window-system )
    (progn
      (require 'color-mate)
      (color-mate)
      (require 'color-mate-face)
      (color-mate:face)
      ))

;----------------------;
; kanakan-cursor の使用
;----------------------;
;; cursor color with Input Method. (for mule/emacs20/xemacs20)
;
(if (and (>= (string-to-int emacs-version) 19)
	 window-system )
    (progn

      ;; color-mate:theme からカーソル色の設定を抜きだすようにする。
      (require 'assoc)
      (require 'color-mate-util)

      ;; skk (mule/xemacs)
      ;; skk version 9.6 のカーソル着色機能を使用する。
      ;; 事前に skk の設定をしておく事。
      ;; skk-cursor2 は色の再定義をしているだけなので skk を使用していなくても
      ;; 他に悪影響を与える事はない。
      (if (and (fboundp 'skk-mode)
	      (not (color-mate:is-xemacs)))
	  (require 'skk-cursor2))

      ;; これは skk version 8 用
;      (if (fboundp 'skk-mode)
;	  (progn
;	    ;; 色を Color-Mate の設定と合わせる
;	    (setq skk-cursor-color-for-default     color-mate-cursor-color)
;	    (global-unset-key "\C-x\C-j")
;	    (global-unset-key "\C-xj")
;	    (global-set-key   "\C-x\C-j" 'skk-mode-with-color-cursor)
;	    (global-set-key   "\C-xj" 'skk-auto-fill-mode-with-color-cursor)
;	    (autoload 'skk-mode-with-color-cursor "skk-cursor" nil t)
;	    (autoload 'skk-auto-fill-mode-with-color-cursor "skk-cursor" nil t)
;	    ))

      ;; leim
      ;; leim とは Emacs/XEmacs20 用の多言語入力ライブラリです。
      ;; leim-cursor は日本語だけでなく、他の言語の入力時にも有効となります。
      ;; ただし、 leim は Emacs19 の skk と機能が衝突するため、 Emacs20 に
      ;; おいて leim と skk は同時使用が出来ません。
      (if (>= (string-to-int emacs-version) 20)
	  (progn
	    (setq leim-mode-off-cursor-color
		  (aget color-mate:theme 'cursor-background-color))
	    (require 'leim-cursor)))

      ;; Wnn
      (if (and (boundp 'WNN)
	       (not (color-mate:is-xemacs)))
	  (progn
	    ;; 色を Color-Mate の設定と合わせる
	    (setq egg-mode-off-cursor-color
		  (aget color-mate:theme 'cursor-background-color))
	    (require 'egg-cursor)))

      ;; canna
      ;; Canna 版 mule では canna.el が既ににロードされているので
      ;; (featurep 'canna) では (canna) を実行したか分からない。
      ;; そこでこれで正しいかどうかは分からないが、 canna-empty-info
      ;; という変数が一度 Canna を起動すると t になる事を利用して
      ;; ユーザーが Canna を使っているか(既に起動しているか)を判定する。
      ;;
      (if (and (boundp 'CANNA) canna-empty-info
	       (not (color-mate:is-xemacs)))
	  (progn
	    ;; 色を Color-Mate の設定と合わせる
	    (setq canna-mode-off-cursor-color
		  (aget color-mate:theme 'cursor-background-color))
	    (require 'canna-cursor)))

      ;; SJ3
      (if (and (boundp 'SJ3)
	       (not (color-mate:is-xemacs)))
	  (progn
	    ;; 色を Color-Mate の設定と合わせる
	    (setq sj3-mode-off-cursor-color
		  (aget color-mate:theme 'cursor-background-color))
	    (require 'sj3-cursor)))

      ;; Windows IME (Mule for Windows)
      (if (and (boundp 'MULE)
	       (eq window-system 'win32))
          (progn
            (setq win32-ime-mode-off-cursor-color
                  (aget color-mate:theme 'cursor-background-color))
            (require 'win32-cursor)))
      ))

;;; Dot.emacs.default ends here
