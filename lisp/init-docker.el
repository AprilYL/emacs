;;config docker 
(use-package docker)

(use-package dockerfile-mode
  :mode
  ("Dockerfile\\'" . dockerfile-mode))

(provide 'init-docker)
