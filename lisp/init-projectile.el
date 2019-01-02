;;config projectile
(use-package projectile
  :ensure t
  :config
  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
  (setq projectile-project-search-path '("~/Documents/algorithm/"))
  (projectile-mode +1))
(provide 'init-projectile)
