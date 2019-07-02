;;; package --- init-helm.el

;;; Commentary:

;; helm configure

;;; Code:
(use-package helm
  ;; :hook
  ;; (after-init . global-helm-mode)
  :bind(("C-x r b" . helm-filtered-bookmarks)
	("C-x C-f" . helm-find-files)
	("C-x b" . helm-mini)
	("M-x" . helm-M-x)
	("M-s o" . helm-occur)
	:map helm-map
	("<tab>" . helm-execute-persistent-action) ;rebind tab to do persistent action
	("TAB" . helm-execute-persistent-action) ;rebind tab to do persistent action
 	)
  
  :config
  (setq helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
	helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
	helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
	helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
	helm-ff-file-name-history-use-recentf t
	helm-quick-update t ; do not display invisible candidates
	helm-idle-delay 0.01 ; be idle for this many seconds, before updating in delayed sources.
	helm-input-idle-delay 0.01 ; be idle for this many seconds, before updating candidate buffer
	helm-echo-input-in-header-line t)
  (setq helm-autoresize-max-height 0)
  (setq helm-autoresize-min-height 40)
  (helm-autoresize-mode 1)
  )

(use-package helm-descbinds
  :config
  (helm-descbinds-mode)
  )
(use-package helm-ag)

(use-package helm-projectile
  :functions hydra-helm-projectile/body
  :config
  (helm-projectile-on)
  (defhydra hydra-helm-projectile(:color blue :hint none)
    "
                       projectile
───────────────────────────────────────────────
_f_: projectile-find-file
_p_: projectile-switch-project
_b_: projectile-switch-buffer
_r_: projectile-replace
_s_: projectile-ag
───────────────────────────────────────────────
                       _q_: quit
"
    ("f" helm-projectile-find-file "projectile-find-file")
    ("p" helm-projectile-switch-project "projectile-switch-project")
    ("b" helm-projectile-switch-to-buffer "projectile-switch-buffer")
    ("r" projectile-replace "projectile-replace")
    ("s" helm-projectile-ag "projectile-ag")
    ("q" nil "quit")
    )

  )
(use-package helm-make)

(provide 'init-helm) 
;;; init-helm ends here
