(use-package auto-yasnippet
  :bind
  ("C-c c" . #'aya-create)
  ("C-c e" . #'aya-expand))

(use-package yasnippet
  :init
  (add-hook 'after-init-hook 'yas-global-mode)
  :config
  )
(provide 'init-auto-yasnippet)
