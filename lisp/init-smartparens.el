;; config smartparens
(smartparens-global-mode t)
(sp-local-pair 'emacs-lisp-mode "'" nil :actions nil)
(sp-local-pair 'emacs-lisp-mode "`" nil :actions nil)

(use-package rainbow-delimiters
  :ensure t
  )

(provide 'init-smartparens)
