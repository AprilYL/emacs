(use-package git-commit
  :hook
  (git-commit-mode . goto-address-mode))
(use-package magit
  :ensure t
  :bind
  (("C-x g s" . magit-status)
   ("C-x g c" . magit-commit)
   ("C-x g d" . magit-dispatch-popup)
   )
  :config
  (setq-default magit-diff-refine-hunk t)
  )
(provide 'init-git)
