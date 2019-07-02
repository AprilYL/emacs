;;; package  --- emacs init file ;

;;; Commentary:

;;; Code:
(use-package projectile
  :demand projectile
  :hook
  (after-init . projectile-mode)
  :ensure t
  :bind(:map projectile-mode-map
	     ("s-p" . projectile-command-map))
;;  :config
  ;;(setq projectile-project-search-path '("~/Documents/Code/Web" "~/Documents/Code/java/" "~/Documents/Code/python/"  "~/Documents/" "~/Documents/Code/github_python/"))
  )
(provide 'init-projectile)
;; init-projectile ends here
