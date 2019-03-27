;;; package  --- init-csv;

;;; Commentary:
;; csv config
;;; Code:
(use-package csv-mode
  :mode "\\.[Cc][Ss][Vv]\\'"
  :config
(setq csv-separators '("," ";" "|" " "))
)

(provide 'init-csv)
;;; init-csv ends here
