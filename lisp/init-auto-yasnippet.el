;; init-yasnippet.el --- Initialize yasnippet configurations.
;;; Commentary:
;;
;; Yasnippet configurations.
;;

;;; Code:

(use-package auto-yasnippet
  :bind
  ("C-c c" . #'aya-create)
  ("C-c e" . #'aya-expand))

(use-package yasnippet
  :diminish yas-minor-mode
  :hook
  (after-init . yas-global-mode)
  )
(provide 'init-auto-yasnippet)
;;; init-auto-yasnippet.el ends here
