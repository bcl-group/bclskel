;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  Emacs / XEmacs 用ユーザ設定ファイル
;;    MATSUBAYASHI 'Shaolin' Kohji (shaolin@vinelinux.org)
;;         Irokawa '烈風戦士' Hiroaki (irorin@terra.dti.ne.jp)
;;                         Time-stamp: <02/04/01 23:12:59 shaolin>

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  Emacs か XEmacs かの判定
;;  ここで Emacs 用、XEmacs 用の設定ファイルを切替えます
;;
;;  ~/.emacs.el  -  Emacs  用設定ファイル
;;  ~/.xemacs.el -  XEmacs-21.1 用設定ファイル
;;  ~/.xemacs/init.el -  XEmacs 用設定ファイル

(if (string-match "XEmacs" emacs-version)
    (if (string-match "21.1" emacs-version)
        (load (expand-file-name "~/lib/emacs/xemacs.el") nil t nil)
      (load (expand-file-name "~/.xemacs/init.el") nil t nil))
    (load (expand-file-name "~/lib/emacs/emacs.el") nil t nil)
)

;; C-c c でcompileコマンド呼び出し
(define-key mode-specific-map "c" compile)
