;;; package --- init-lsp.el.
;;; Commentary:
;;
;; lsp configurations.
;;

;;; Code:


;;-----------------------------------------------------------------------------------;;
;; lsp
;;-----------------------------------------------------------------------------------;;
(use-package lsp-mode
  :commands lsp)
(use-package lsp-ui
  :commands lsp-ui-mode)
(use-package company-lsp
  :commands company-lsp)
(provide 'init-lsp)
;;; init-lsp.el ends here
