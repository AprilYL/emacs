;;; package --- init-es.el

;;; Commentary:

;; helm configure

;;; Code:
(use-package es-mode
  :mode "\\.es$"
  :hook
  (es-result-mode . hs-minor-mode)
  )
(provide 'init-es)
;;; init-es ends here
