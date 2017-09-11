;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  FSF Emacs 20/21 用 ユーザ設定ファイルのサンプル
;;            MATSUBAYASHI 'Shaolin' Kohji (shaolin@vinelinux.org)
;;                      modified by Jun Nishii <jun@vinelinux.org>
;;                      modified by Daisuke SUZUKI <daisuke@vinelinux.org>
;;            $Id: .emacs.el,v 1.48 2006/11/04 12:58:15 daisuke Exp $
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;  システムのアップグレード時にこのファイルを自動的に更新したい場合は
;;  このファイルを変更せずに .emacs.my.el に記述してください。


;;; 初期設定ファイルの指定

(setq user-init-file "~/lib/emacs/emacs.el")

;;; マクロサーチパスの追加
;;; ~/lib/emacs 以下にユーザ用の *.el, *.elc を置くことができます
(setq load-path (append '("~/lib/emacs") load-path))

;;; 言語環境の指定

(set-language-environment "Japanese")

;;; 漢字コードの設定

(if (equal (getenv "LANG") "ja_JP.UTF-8")
  (progn
    (cond ((<= emacs-major-version 21)
      (require 'un-define)))
    (set-default-coding-systems 'utf-8)
    (set-buffer-file-coding-system 'utf-8-unix)
    (set-terminal-coding-system 'utf-8)
    (set-keyboard-coding-system 'utf-8))
    ;;; 日本語メニューバー (UTF-8のメニューバーを用意?)
    ;(cond
    ;  (and (>= emacs-major-version 21)
    ;       (equal (substring (concat (getenv "LANG") "__") 0 2) "ja")
    ;     (load "menu-tree-utf8")))
  (progn
    (set-default-coding-systems 'euc-jp)
    (set-buffer-file-coding-system 'euc-jp-unix)
    (set-terminal-coding-system 'euc-jp)
    (set-keyboard-coding-system 'euc-jp)
    ;;; 日本語メニューバー
    (cond
      ((and (>= emacs-major-version 21)
           (equal (substring (concat (getenv "LANG") "__") 0 2) "ja"))
         (load "menu-tree")))
))

;;; emacsclient サーバを起動
(server-start)

;; 環境変数 EMACS_IME を調べる。
;; EMACS_IME がなければ scim を使用する

(setq emacs-ime (getenv "EMACS_IME"))
(if (null emacs-ime)
    (setq emacs-ime "scim"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; X 版 Emacs のフォント/カラー設定
;; .emacs-faces.el, .emacs-fontset.el 参照
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(load "~/lib/emacs/emacs-faces.el")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; emacs-21 の設定
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(cond
 ((>= emacs-major-version 21)
 
 ;;; メニューバーを消す
 ;(menu-bar-mode nil)
 ;;; ツールバーを消す
 ;(tool-bar-mode nil)
 ;;; cursor の blink を止める
 ;(blink-cursor-mode nil) 
 ;;; 表示の行間を拡げる
 ;(set-default 'line-spacing 2)
 ;;; active でない window の空 cursor を出さない
 (setq cursor-in-non-selected-windows nil)
 ;;; フォントのスケールをしない
 (setq scalable-fonts-allowed nil)
 ;;; [Home] Key と [End] Key を従来の動作に戻す
 (define-key global-map [home] 'beginning-of-buffer)
 (define-key global-map [end] 'end-of-buffer)

 ;;; image.el における JPEG の判定基準を緩める
 ;(eval-after-load "image"
 ; '(setq image-type-regexps
 ;   (cons (cons "^\377\330" 'jpeg) image-type-regexps)))

 ;;; 表示の行間を拡げる
 (setq line-spacing 2)

))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Egg (Wnn フロントエンド) の設定
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
	 ;;emacs-dl-wnnでないときの設定( emacs-21 + tamago v4)

	 (global-set-key "\C-\\" 'toggle-input-method)
         ;; Shift-Space または 半角/全角 でも起動
	 (global-set-key [?\S-\ ] 'toggle-input-method)
	 (global-set-key [zenkaku-hankaku] 'toggle-input-method)
	 (load "egg")
	 
	 ;; InputMethod の設定
	 ;; emacs 起動時 ASCII
	 ;;(setq default-input-method "japanese-egg-wnn")
	 ;; emacs 起動時から日本語入力
	 (set-input-method "japanese-egg-wnn")
	 
	 ;; jserverの指定
	 ;; jserver のリストを次の様にして指定できます
	 ;;(setq jserver-list '("vanilla" "espresso"))
	 (setq jserver-list (list (getenv "JSERVER") "localhost"))


	 ;;--------------------------------------------------------
	 ;; tamago v4
	 ;;--------------------------------------------------------
	 ;; 全般
	 
	 ;;(setq egg-default-startup-file "eggrc-wnn") ; 95.6.1 by S.Tomura
	 (garbage-collect)
	 
	 ;; "nn" で「ん」を入力
	 (setq enable-double-n-syntax t)
	 
	 ;; "." で「.」、"," で「,」を入力。
	 (setq use-kuten-for-period nil)
	 (setq use-touten-for-comma nil)
	 
	 )
       
       ;; emacs-dl-wnn の場合 (emacs-20)
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
	 
	 ;; jserver のリストを次の様にして指定できます
	 ;;(setq jserver-list '("vanilla" "espresso"))
	 (setq jserver-list (list (getenv "JSERVER") "localhost"))
	 
	 ;; "nn" で「ん」を入力
	 (setq enable-double-n-syntax t)
	 
	 ;; "." で「.」、"," で「,」を入力。
	 (setq use-kuten-for-period nil)
	 (setq use-touten-for-comma nil)
	 
	 ;; 1234567890%#%"' を「半角」で入力"
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
;; Wnn7Egg (Wnn7 フロントエンド) の設定
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(if (or (equal emacs-ime "wnn7")
        (equal emacs-ime "Wnn7"))
    (progn
      (setq load-path (append '("/usr/share/wnn7/elisp/emacs20") load-path))
      (global-set-key "\C-\\" 'toggle-input-method)
      ;; Shift-Space または 半角/全角 でも起動
      (global-set-key [?\S-\ ] 'toggle-input-method)
      (global-set-key [zenkaku-hankaku] 'toggle-input-method)
      ;; canna like toggle keybind
      ;;(global-set-key "\C-o" 'toggle-input-method)
      (load "wnn7egg-leim")
      (set-input-method "japanese-egg-wnn7")
      (set-language-info "Japanese" 'input-method "japanese-egg-wnn7")

      ;; "nn" で「ん」を入力
      (setq enable-double-n-syntax t)
      ;; 候補選択モード
      (egg-use-input-predict)
      (setq egg-predict-realtime nil)
      ;; インライン候補選択モード
      (setq egg-predict-mode "inline")
      ;; ウインドウ候補選択モード
      ;(setq egg-predict-mode "window")

      ;; 候補リスト表示
      (define-key wnn7-henkan-mode-map " " 'wnn7-henkan-select-kouho-dai)

      ;; 1234567890%#%"'/\| を「半角」で入力
      (let ((its:*defrule-verbose* nil))
        (its-define-mode "roma-kana")
        (dolist (symbol '("1" "2" "3" "4" "5" 
                          "6" "7" "8" "9" "0"
                          "#" "%" "\"" "'" "/" "\\" "|"))
                (its-defrule symbol symbol)))
    )
)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; かんなの設定
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
	  ;; emacs-dl-canna/emcws の場合
	  
	  (load-library "canna")
	  
	  ;; color-mate を使わないで、漢字変換に色を付けたい時に
	  ;(setq canna-use-color t)
	  
	  ;; フェンスモードでなくアンダーラインを使う
	  ;;(setq canna-with-fences nil)
	  ;;(setq canna-underline t)
	  
	  ;; Canna サーバの指定
	  (if (null (getenv "CANNA_SERVER"))
	      (setq canna-server "unix")
	    (setq canna-server (getenv "CANNA_SERVER")))
	  (canna)
	  
	  ;; Canna を Ctrl-\ で起動します。コメントアウトすれば、
	  ;; Ctrl-\ で skk が立ち上がります。
	  (global-set-key "\C-\\" 'canna-toggle-japanese-mode)
	  (global-set-key "\C-o" 'canna-toggle-japanese-mode)
	  ;; Shift-Space または 半角/全角 でも起動
          (global-set-key [?\S-\ ] 'canna-toggle-japanese-mode)
          (global-set-key [zenkaku-hankaku] 'canna-toggle-japanese-mode)
	  
	  (global-set-key "\C-_" 'canna-undo)  ;アンドゥの設定。
	  (setq canna-save-undo-text-predicate ;アンドゥバッファへ入れる条件
		'(lambda (s) (> (length (car s)) 2)) )
	  (setq canna-undo-hook ;アンドゥ＋α。
		'(lambda () (message "再変換します....")                          
		   (canna-do-function canna-func-henkan)) )
	  
	  ;;かんなの変換中に BS & DEL を使う
	  (define-key canna-mode-map [backspace] [?\C-h])
	  (define-key canna-mode-map [delete] [?\C-h])
	  
	  ;;かんなの変換中に C-h を使う (with term/keyswap)
	  (define-key canna-mode-map [?\177] [?\C-h])
	  ))
  
    (if (or (and (not (and (boundp 'CANNA) CANNA))
		 (>= emacs-major-version 21))
	    (equal emacs-ime "canna-tamago"))
	(progn
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	   ;; emacs-dl-canna/emcws でないとき (tamago4)
	   
	   ;; Canna サーバの指定
	   ;;(setq canna-hostname "unix/")

	   (require 'egg)
	   
	   ;; InputMethod の設定
	   (setq default-input-method "japanese-egg-canna")
	   
	   ;; tamago v4 共通設定
	   
	   (setq
	    ;; 何回変換すると（自動的に）辞書に反映するか
	    wnn-auto-save-dictionaries 1
	    ;; nil にすると、alphanumeric が半角入力になるらしい。
	    its-enable-fullwidth-alphabet nil
	    ;; Backspace で消すときに、かなを入力したローマ字に展開して
	    ;; ローマ字単位で消す？
	    its-delete-by-keystroke t
	    ;; 外すと操作方法が変わるみたいです。よく分かりません。
	    egg-mode-preference t
	    ;; "nn" で「ん」を入力
	    enable-double-n-syntax t
	    ;; "." で「．」、"," で「，」を入力。 
	    use-kuten-for-period nil
	    use-touten-for-comma nil
	    ;; 候補の最後まで行ったら先頭に戻る
	    egg-conversion-wrap-select t
	    ;; 候補一覧を表示するまでの変換回数、0で非表示
	    egg-conversion-auto-candidate-menu 2)
	   
	   ;; F7 で toroku-region
	   (global-set-key [f7] 'egg-toroku-region)

	   ;; Canna 用設定 (Canna 風キー設定)
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
;; Atok for X の設定
;;  IIIMP 経由で実行します
;; (要 MULE-UCS, IIIMECF)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(if (equal emacs-ime "atokx")
    (progn

      (require 'un-define)      
      (setq coding-category-utf-8 'utf-8)

      (setq iiimcf-server-control-hostlist '("localhost"))
      (setq iiimcf-server-control-default-language "ja")
      (setq default-input-method 'iiim-server-control)
      (require 'iiimcf-sc)

      ;; 変換トグルの設定
      (define-key global-map "\C-\\" 'toggle-input-method)
      ;; Shift-Space または 半角/全角 でも起動
      (global-set-key [?\S-\ ] 'toggle-input-method)
      (global-set-key [zenkaku-hankaku] 'toggle-input-method)

      ;;モードライン表示をすっきりと
      ;;(setcar default-mode-line-format "")

      )
  )


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; anthy.el の設定
;; (詳しくは /usr/share/doc/anthy-*/doc/ELISP を参照してください)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(if (or (equal emacs-ime "anthy-el")
	(equal emacs-ime "Anthy-el"))
    (progn
      (require 'anthy)
      ;; 変換開始キー
      (define-key global-map "\C-\\" 'toggle-input-method)
      (define-key global-map "\C-o" 'toggle-input-method)
      (define-key global-map [kanji] 'toggle-input-method)
      (define-key global-map [M-kanji] 'toggle-input-method)
      (global-set-key [?\S-\ ] 'toggle-input-method)
      (global-set-key [zenkaku-hankaku] 'toggle-input-method)
      
      ;; バックスペースでローマ字単位で消す
      ;(anthy-set-break-into-roman 't)
    )
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; tamago-anthy の設定
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
	   ;; InputMethod の設定
	   (setq default-input-method "japanese-egg-anthy")
	   
	   ;; tamago v4 共通設定
	   (setq
	    ;; 何回変換すると（自動的に）辞書に反映するか
	    wnn-auto-save-dictionaries 1
	    ;; nil にすると、alphanumeric が半角入力になるらしい。
	    its-enable-fullwidth-alphabet nil
	    ;; Backspace で消すときに、かなを入力したローマ字に展開して
	    ;; ローマ字単位で消す？
	    its-delete-by-keystroke t
	    ;; 外すと操作方法が変わるみたいです。よく分かりません。
	    egg-mode-preference t
	    ;; "nn" で「ん」を入力
	    enable-double-n-syntax t
	    ;; "." で「．」、"," で「，」を入力。 
	    use-kuten-for-period nil
	    use-touten-for-comma nil
	    ;; 候補の最後まで行ったら先頭に戻る
	    egg-conversion-wrap-select t
	    ;; 候補一覧を表示するまでの変換回数、0で非表示
	    egg-conversion-auto-candidate-menu 2
	    ;; 不正なキーシーケンスを警告する
	    its-barf-on-invalid-keyseq t)
	   
	   ;; F7 で toroku-region
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
;; uim.el の設定
;; (詳しくは /usr/share/doc/uim-el-*/README.ja を参照してください)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(if (or (equal emacs-ime "uim")
        (equal emacs-ime "UIM"))
    (progn
      (require 'uim)
      ;; 変換開始キー
      (global-set-key "\C-\\" 'uim-mode)
      (global-set-key "\C-o" 'uim-mode)
      (global-set-key [kanji] 'uim-mode)
      (global-set-key [M-kanji] 'uim-mode)
      (global-set-key [?\S-\ ] 'uim-mode)
      (global-set-key [zenkaku-hankaku] 'uim-mode)

      ;; Anthy の時はデフォルトでひらがな入力に
      (setq uim-default-im-prop '("action_anthy_hiragana"
                                  "action_canna_hiragana"
				  "action_skk_hiragana"))
      
      ;; 変換候補をデフォルトでインライン表示にする
      ;(setq uim-candidate-display-inline t)
    )
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; SKK-9.6m 
;;   Mule 上の仮名漢字変換システム SKK の設定
;;   C-x t でチュートリアルが起動します
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;; 使用する辞書の設定 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; SKK-JISYO.L をメモリ上に読み込んで利用する場合
(setq skk-large-jisyo "/usr/share/skk/SKK-JISYO.L")

;;; SKK-JISYO.M をメモリ上に読み込み、
;;; 見付からない場合は skkserv を起動して SKK-JISYO.L から検索する場合
;;; (skkexdic パッケージが必要です)
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
;; T-Gnus 6.13.3 (参考)
;;   NetNews リーダー GNUS (SEMI 対応版)
;;   M-x gnus で起動します
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; News Server 名やドメイン名を適切に指定してください
;(setq gnus-nntp-server "news.hoge.hoge.or.jp")
;(setq gnus-local-domain "hoge.hoge.or.jp")
;(setq gnus-local-organization "HogeHoGe Org.")
;(setq gnus-use-generic-from t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Mew 3.3  -  Messaging in the Emacs World
;;   メールリーダー Mew
;;   M-x mew で起動します
;;
;;   個人用の設定ファイルは ~/.mew.el を利用してください。
;;   最新の .mew.el は /usr/share/doc/mew-common-*/vine.dot.mew にあります。
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(autoload 'mew "mew" nil t)
(autoload 'mew-send "mew" nil t)

(if (file-exists-p (expand-file-name "~/lib/emacs/mew.emacs-4.1.el"))
    (load (expand-file-name "~/lib/emacs/mew.emacs-4.1.el") nil t nil))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; X-Face-Mule
;;   Mew や Wanderlust などで、X-Face 画像つきのメッセージを表示します
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
;;   IRC (チャット) クライアントの設定
;;   M-x irchat で起動します
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(autoload 'irchat "irchat" nil t)

;;; IRC server の指定
;;; (いずれか一つをコメントアウトします)
;;(setq irchat-server "irc.tohoku.ac.jp")
;;(setq irchat-server "irc.kyutech.ac.jp")
;;(setq irchat-server "irc.tokyo.wide.ad.jp")
;;(setq irchat-server "irc.kyoto.wide.ad.jp")
;;(setq irchat-server "irc.huie.hokudai.ac.jp")
;;(setq irchat-server "irc.cc.yamaguchi-u.ac.jp")
;;(setq irchat-server "irc.karrn.ad.jp")
;;(setq irchat-server "irc.kyoto.wide.ad.jp")

;;; ユーザー名とニックネーム
;;; (nick は半角英数および []{}_\^ からなる最大 9 文字の文字列です)
(setq irchat-name "IRC sample user")
(setq irchat-nickname "VineUser")

;;; デフォルトで参加するチャンネルのリスト
;;;  （ここに書いたチャンネルには irchat の起動と同時に参加できます）
;;(setq irchat-startup-channel-list '("#linuxjp,#vinetest"))
(setq irchat-startup-channel-list '("#vinetest"))

;;; オプション
;;;   詳細は /usr/doc/irchat-pj-2.4.24.07/doc 以下のファイルを参照
(setq irchat-reconnect-automagic t)      ; 切れた場合に再接続を試みる
;;(setq irchat-channel-buffer-mode t)    ; チャネル分割表示モード
;;(setq irchat-display-channel-always t)
;;(setq irchat-default-freeze-local nil)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; YaTeX 1.72
;;   [La]TeX 入力モード
;;   M-x yatex とするか、.tex で終わるファイルを読み込むと起動します
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
;;   Mule 上で dic を利用するための設定です
;;   ~/lib/emacs に /usr/doc/dic/eldic.el をコピーして
;;   dic-shell-file-name の辺りを適切に設定してください。
;;   C-c C-c C-e で英和、C-c C-c C-j で和英が引けます。
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;(global-set-key "\C-c\C-c\C-e" 'lookup-edic)
;;(global-set-key "\C-c\C-c\C-j" 'lookup-jdic)
;;(autoload 'lookup-edic "eldic" nil t)
;;(autoload 'lookup-jdic "eldic" nil t)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ホイールマウス対応
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
;;  IRC クライアントです。
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(autoload 'liece "liece" nil t)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; rpm-mode
;;  RPM の spec ファイル作成用モード
;;  ~/lib/emacs に /usr/doc/rpm/rpm-mode.el をコピーして以下の設定を
;;  行ってください
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;(setq auto-mode-alist (nconc '(("\\.spec" . rpm-mode)) auto-mode-alist))
;(autoload 'rpm-mode "rpm-mode" "Major mode for editing SPEC file of RPM." t) 
;(setq packager "Vine User <vine@hoge.fuga>");自分の名前
;      (setq buildrootroot "/var/tmp");BuildRootの場所
;      (setq projectoname "Project Vine");プロジェクト名 


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; その他の設定
;;
;; これらの設定を変更する場合は、~/.emacs.my.el に書くこと
;; をお薦めします。etcskel パッケージのアップデート時に 
;; /etc/skel/.emacs.el をそのまま上書きできます。
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; Dired の設定
;; Dired のリストフォーマット設定 (ls へのオプション)
;; (setq dired-listing-switches "-aoFLt")
;; ls の出力を英語にする(ls を LANG=C で実行)
(add-hook 'dired-mode-hook  '(lambda ()(setenv "LANG" "C")))


;;; C-h と Del の入れ替え
;;; Help が Shift + Ctrl + h および Del に割当てられ、
;;; 前一文字削除が Ctrl + h に割当てられます
;(load-library "term/keyswap")
;(if (eq window-system 'x)
;    (progn
;      (define-key function-key-map [delete] [8])
;      (put 'delete 'ascii-character 8)))

;;; Ctrl-H を前1文字削除に変更
(define-key global-map "" 'backward-delete-char)

;;; スクロールバーを右側に表示する
(set-scroll-bar-mode 'right)

;;; gzファイルも編集できるように
(auto-compression-mode t)

;;; 一行が 80 字以上になった時には自動改行する
(setq fill-column 80)
(setq text-mode-hook 'turn-on-auto-fill)
(setq default-major-mode 'text-mode)

;;; ステータスラインに時間を表示する
(if (or (and (>= emacs-major-version 20)
             (not (equal (getenv "LANG") "ja_JP.UTF-8")))
        (>= emacs-major-version 22))
    (progn
      (setq dayname-j-alist
           '(("Sun" . "日") ("Mon" . "月") ("Tue" . "火") ("Wed" . "水")
             ("Thu" . "木") ("Fri" . "金") ("Sat" . "土")))
      (setq display-time-string-forms
           '((format "%s年%s月%s日(%s) %s:%s %s"
                     year month day
                     (cdr (assoc dayname dayname-j-alist))
                     24-hours minutes
		     load)))
      ))
(display-time)

;;; visible-bell
(setq visible-bell t)

;;; 行番号を表示する
(line-number-mode t)

;;; mule/emacs -nw で起動した時にメニューバーを消す
;(if window-system (menu-bar-mode 1) (menu-bar-mode -1))

;;; 印刷設定
;(setq-default lpr-switches '("-Pepson"))
(setq-default lpr-switches '("-2P"))
(setq-default lpr-command "mpage")

;;; ps-print
(setq ps-multibyte-buffer 'non-latin-printer)
(if (>= emacs-major-version 21)
    (progn
      (require 'ps-mule)
      (defalias 'ps-mule-header-string-charsets 'ignore)))

;;; バッファの最後でnewlineで新規行を追加するのを禁止する
(setq next-line-add-newlines nil)

;;; 画面最下行で[↓]を押したときのスクロール数
;(setq scroll-step 1)
 
;;; mark 領域に色付け
;(setq transient-mark-mode t)

;;; 最終更新日の自動挿入
;;;   ファイルの先頭から 8 行以内に Time-stamp: <> または
;;;   Time-stamp: " " と書いてあれば、セーブ時に自動的に日付が挿入されます
(if (not (memq 'time-stamp write-file-hooks))
    (setq write-file-hooks
          (cons 'time-stamp write-file-hooks)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ユーザ用初期化ファイル
;; ~/.emacs.my.el に個人用設定を書けます。
;; このファイルを直接いじりたくない場合は、個人設定を分離してください

(if (file-exists-p (expand-file-name "~/.emacs.my.el"))
    (load (expand-file-name "~/.emacs.my.el") nil t nil))


(load "emacs-local.el")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; このファイルに間違いがあった場合に全てを無効にします
(put 'eval-expression 'disabled nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Local Variables:
;; mode: emacs-lisp
;; End:
