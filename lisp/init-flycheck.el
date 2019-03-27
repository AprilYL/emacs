;;; package --- init-ui.el

;;; Commentary:

;; flycheck cofigure

;;; Code:
(use-package flycheck
  :demand flycheck
  :hook (after-init . global-flycheck-mode)
  )

(provide 'init-flycheck) 
;;; init-flycheck ends here
