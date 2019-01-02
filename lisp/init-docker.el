;;config docker 
(use-package docker
  :ensure t
  :bind ("C-c d" . docker))

(use-package dockerfile-mode
  :mode
  ("Dockerfile\\'" . dockerfile-mode))

(provide 'init-docker)
