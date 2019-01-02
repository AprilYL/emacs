;;config helm
(use-package helm
  :demand t
  :bind
  (("M-x" . helm-M-x)
   ("M-s o" . helm-occur)
   ("C-x C-f" . helm-find-files)
   ("C-x b" . helm-mini)
   (:map helm-map
	 ("<tab>" . 'helm-execute-persistent-action)
	 )
  )
  :config
  (helm-mode 1)
  (setq helm-split-window-in-side-p nil)
  
  (use-package helm-descbinds
    :config(helm-descbinds-mode)))
(use-package helm-ag)

(use-package helm-projectile
  :config
  (helm-projectile-on))

(provide 'init-helm) 
