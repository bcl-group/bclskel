(if (>= emacs-major-version 21)
    (progn
      ;; Emacs21 の場合は各フォントを指定するとボールドやイタリックがでない
      ;; (Why?)
      (create-fontset-from-fontset-spec
       "-alias-fixed-medium-r-normal-*-10-*-*-*-*-*-fontset-10"
       nil t)
      (create-fontset-from-fontset-spec
       "-alias-fixed-medium-r-normal-*-12-*-*-*-*-*-fontset-12"
       nil t)
      (create-fontset-from-fontset-spec
       "-alias-fixed-medium-r-normal-*-14-*-*-*-*-*-fontset-14"
       nil t)
      (create-fontset-from-fontset-spec
       "-alias-fixed-medium-r-normal-*-16-*-*-*-*-*-fontset-16"
       nil t)
      (create-fontset-from-fontset-spec
       "-alias-fixed-medium-r-normal-*-18-*-*-*-*-*-fontset-18"
       nil t)
      (create-fontset-from-fontset-spec
       "-alias-fixed-medium-r-normal-*-20-*-*-*-*-*-fontset-20"
       nil t)
      (create-fontset-from-fontset-spec
       "-alias-fixed-medium-r-normal-*-24-*-*-*-*-*-fontset-24"
       nil t))
  (progn
    ;; Emacs20 の設定 (各サイズ 標準、ボールド、イタリックを用意)
    ;; fontset-10
    (create-fontset-from-fontset-spec
     "-alias-fixed-medium-r-normal-*-10-*-*-*-*-*-fontset-10,
      japanese-jisx0208:-alias-fixed-medium-r-normal-*-10-*-JISX0208.1983-0,
      katakana-jisx0201:-alias-fixed-medium-r-normal-*-10-*-JISX0201.1976-0,
      japanese-jisx0213-1:-alias-fixed-medium-r-normal-*-10-*-JISX0213.2000-1,
      japanese-jisx0213-2:-alias-fixed-medium-r-normal-*-10-*-JISX0213.2000-2"
     nil t)
    (create-fontset-from-fontset-spec
     "-alias-fixed-bold-r-normal-*-10-*-*-*-*-*-fontset-10,
      japanese-jisx0208:-alias-fixed-bold-r-normal-*-10-*-JISX0208.1983-0,
      katakana-jisx0201:-alias-fixed-bold-r-normal-*-10-*-JISX0201.1976-0,
      japanese-jisx0213-1:-alias-fixed-bold-r-normal-*-10-*-JISX0213.2000-1,
      japanese-jisx0213-2:-alias-fixed-bold-r-normal-*-10-*-JISX0213.2000-2"
     nil t)
    (create-fontset-from-fontset-spec
     "-alias-fixed-medium-i-normal-*-10-*-*-*-*-*-fontset-10,
      japanese-jisx0208:-alias-fixed-medium-i-normal-*-10-*-JISX0208.1983-0,
      katakana-jisx0201:-alias-fixed-medium-i-normal-*-10-*-JISX0201.1976-0,
      japanese-jisx0213-1:-alias-fixed-medium-i-normal-*-10-*-JISX0213.2000-1,
      japanese-jisx0213-2:-alias-fixed-medium-i-normal-*-10-*-JISX0213.2000-2"
     nil t)
    ;; fontset-12
    (create-fontset-from-fontset-spec
     "-alias-fixed-medium-r-normal-*-12-*-*-*-*-*-fontset-12,
      japanese-jisx0208:-alias-fixed-medium-r-normal-*-12-*-JISX0208.1983-0,
      katakana-jisx0201:-alias-fixed-medium-r-normal-*-12-*-JISX0201.1976-0,
      japanese-jisx0213-1:-alias-fixed-medium-r-normal-*-12-*-JISX0213.2000-1,
      japanese-jisx0213-2:-alias-fixed-medium-r-normal-*-12-*-JISX0213.2000-2"
     nil t)
    (create-fontset-from-fontset-spec
     "-alias-fixed-bold-r-normal-*-12-*-*-*-*-*-fontset-12,
      japanese-jisx0208:-alias-fixed-bold-r-normal-*-12-*-JISX0208.1983-0,
      katakana-jisx0201:-alias-fixed-bold-r-normal-*-12-*-JISX0201.1976-0,
      japanese-jisx0213-1:-alias-fixed-bold-r-normal-*-12-*-JISX0213.2000-1,
      japanese-jisx0213-2:-alias-fixed-bold-r-normal-*-12-*-JISX0213.2000-2"
     nil t)
    (create-fontset-from-fontset-spec
     "-alias-fixed-medium-i-normal-*-12-*-*-*-*-*-fontset-12,
      japanese-jisx0208:-alias-fixed-medium-i-normal-*-12-*-JISX0208.1983-0,
      katakana-jisx0201:-alias-fixed-medium-i-normal-*-12-*-JISX0201.1976-0,
      japanese-jisx0213-1:-alias-fixed-medium-i-normal-*-12-*-JISX0213.2000-1,
      japanese-jisx0213-2:-alias-fixed-medium-i-normal-*-12-*-JISX0213.2000-2"
     nil t)
    ;; fontset-14
    (create-fontset-from-fontset-spec
     "-alias-fixed-medium-r-normal-*-14-*-*-*-*-*-fontset-14,
      japanese-jisx0208:-alias-fixed-medium-r-normal-*-14-*-JISX0208.1983-0,
      katakana-jisx0201:-alias-fixed-medium-r-normal-*-14-*-JISX0201.1976-0,
      japanese-jisx0213-1:-alias-fixed-medium-r-normal-*-14-*-JISX0213.2000-1,
      japanese-jisx0213-2:-alias-fixed-medium-r-normal-*-14-*-JISX0213.2000-2"
     nil t)
    (create-fontset-from-fontset-spec
     "-alias-fixed-bold-r-normal-*-14-*-*-*-*-*-fontset-14,
      japanese-jisx0208:-alias-fixed-bold-r-normal-*-14-*-JISX0208.1983-0,
      katakana-jisx0201:-alias-fixed-bold-r-normal-*-14-*-JISX0201.1976-0,
      japanese-jisx0213-1:-alias-fixed-bold-r-normal-*-14-*-JISX0213.2000-1,
      japanese-jisx0213-2:-alias-fixed-bold-r-normal-*-14-*-JISX0213.2000-2"
     nil t)
    (create-fontset-from-fontset-spec
     "-alias-fixed-medium-i-normal-*-14-*-*-*-*-*-fontset-14,
      japanese-jisx0208:-alias-fixed-medium-i-normal-*-14-*-JISX0208.1983-0,
      katakana-jisx0201:-alias-fixed-medium-i-normal-*-14-*-JISX0201.1976-0,
      japanese-jisx0213-1:-alias-fixed-medium-i-normal-*-14-*-JISX0213.2000-1,
      japanese-jisx0213-2:-alias-fixed-medium-i-normal-*-14-*-JISX0213.2000-2"
     nil t)
    ;; fontset-16
    (create-fontset-from-fontset-spec
     "-alias-fixed-medium-r-normal-*-16-*-*-*-*-*-fontset-16,
      japanese-jisx0208:-alias-fixed-medium-r-normal-*-16-*-JISX0208.1983-0,
      katakana-jisx0201:-alias-fixed-medium-r-normal-*-16-*-JISX0201.1976-0,
      japanese-jisx0213-1:-alias-fixed-medium-r-normal-*-16-*-JISX0213.2000-1,
      japanese-jisx0213-2:-alias-fixed-medium-r-normal-*-16-*-JISX0213.2000-2"
     nil t)
    (create-fontset-from-fontset-spec
     "-alias-fixed-bold-r-normal-*-16-*-*-*-*-*-fontset-16,
      japanese-jisx0208:-alias-fixed-bold-r-normal-*-16-*-JISX0208.1983-0,
      katakana-jisx0201:-alias-fixed-bold-r-normal-*-16-*-JISX0201.1976-0,
      japanese-jisx0213-1:-alias-fixed-bold-r-normal-*-16-*-JISX0213.2000-1,
      japanese-jisx0213-2:-alias-fixed-bold-r-normal-*-16-*-JISX0213.2000-2"
     nil t)
    (create-fontset-from-fontset-spec
     "-alias-fixed-medium-i-normal-*-16-*-*-*-*-*-fontset-16,
      japanese-jisx0208:-alias-fixed-medium-i-normal-*-16-*-JISX0208.1983-0,
      katakana-jisx0201:-alias-fixed-medium-i-normal-*-16-*-JISX0201.1976-0,
      japanese-jisx0213-1:-alias-fixed-medium-i-normal-*-16-*-JISX0213.2000-1,
      japanese-jisx0213-2:-alias-fixed-medium-i-normal-*-16-*-JISX0213.2000-2"
     nil t)
    ;; fontset-18
    (create-fontset-from-fontset-spec
     "-alias-fixed-medium-r-normal-*-18-*-*-*-*-*-fontset-18,
      japanese-jisx0208:-alias-fixed-medium-r-normal-*-18-*-JISX0208.1983-0,
      katakana-jisx0201:-alias-fixed-medium-r-normal-*-18-*-JISX0201.1976-0,
      japanese-jisx0213-1:-alias-fixed-medium-r-normal-*-18-*-JISX0213.2000-1,
      japanese-jisx0213-2:-alias-fixed-medium-r-normal-*-18-*-JISX0213.2000-2"
     nil t)
    (create-fontset-from-fontset-spec
     "-alias-fixed-bold-r-normal-*-18-*-*-*-*-*-fontset-18,
      japanese-jisx0208:-alias-fixed-bold-r-normal-*-18-*-JISX0208.1983-0,
      katakana-jisx0201:-alias-fixed-bold-r-normal-*-18-*-JISX0201.1976-0,
      japanese-jisx0213-1:-alias-fixed-bold-r-normal-*-18-*-JISX0213.2000-1,
      japanese-jisx0213-2:-alias-fixed-bold-r-normal-*-18-*-JISX0213.2000-2"
     nil t)
    (create-fontset-from-fontset-spec
     "-alias-fixed-medium-i-normal-*-18-*-*-*-*-*-fontset-18,
      japanese-jisx0208:-alias-fixed-medium-i-normal-*-18-*-JISX0208.1983-0,
      katakana-jisx0201:-alias-fixed-medium-i-normal-*-18-*-JISX0201.1976-0,
      japanese-jisx0213-1:-alias-fixed-medium-i-normal-*-18-*-JISX0213.2000-1,
      japanese-jisx0213-2:-alias-fixed-medium-i-normal-*-18-*-JISX0213.2000-2"
     nil t)
    )
  )