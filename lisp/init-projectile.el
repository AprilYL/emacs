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

(use-package helm-projectile
  :pretty-hydra
  (
   (:title "helm-projectile" :color blue :quit-when-no-cand 1)
   ("Find"
    (
     ("f" helm-projectile-find-file "projectile-find-file")
     ("F" helm-projectile-find-dir "find dir")
     ("S" helm-projectile-find-file-in-known-projects "find file in kown project")
     ("s" helm-projectile-ag "projectile-ag")
     ("p" helm-projectile-switch-project "projectile-switch-project")
     ("b" helm-projectile-switch-to-buffer "projectile-switch-buffer")
     )
    "Replace"
    (("r" projectile-replace "project replace")
     ("R" projectile-replace-regexp "project replace regexp")
     )
    )
   )
  :config
  (helm-projectile-on)
  )
(provide 'init-projectile)
;; init-projectile ends here
