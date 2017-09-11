;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  -*- coding: utf-8-unix -*-
;;  FSF Emacs 23 用 vine-default 設定ファイル
;;    Munehiro Yamamoto <munepi@vinelinux.org>
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Vine Linux のデフォルト設定を無効にしたい場合は、
;; 以下を有効にしてください。
;; (setq vine-default nil)

;; 環境変数 EMACS_IME と異なる IME を使いたい場合は、
;; 以下を有効にして設定することができます。
;; (setq emacs-ime "atokx3");; anthy-el atokx3 ibus-el mozc tamago scim scim-bridge skk wnn7egg

;; マクロサーチパスの追加
;; 例えば、~/.emacs.d/local 以下にユーザ用の *.el, *.elc を置けます。
(add-to-list 'load-path "~/.emacs.d/local")
(add-to-list 'load-path "~/lib/emacs")
(add-to-list 'load-path "~/.emacs.d/auto-install")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Local Variables:
;; mode: emacs-lisp
;; End:
