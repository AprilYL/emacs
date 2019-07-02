;;; package --- init-file.el

;;; Commentary:

;; the sets of file

;;; Code:

;; file always refresh automatically
(use-package autorevert
  :ensure nil
  :diminish
  :hook
  (after-init . global-auto-revert-mode))

;; close auto generate backup
(setq make-backup-files nil)

;; close auto save buffer
(setq auto-save-default nil)


;; -----------------------------------------------------------------------------------;;
;; treemacs configurations,which is a file tree
;; -----------------------------------------------------------------------------------;;
(use-package recentf
  :demand recentf
  :hook
  (after-init . recentf-mode)
  :config
  (setq recentf-max-menu-items 10)
  (setq recentf-max-saved-items 100)
  )

;; -----------------------------------------------------------------------------------;;
;; treemacs configurations,which is a file tree
;; -----------------------------------------------------------------------------------;;
(use-package treemacs
  :ensure t
  ;; :config
  ;; (setq treemacs-deferred-git-apply-delay      0.5
  ;; 	treemacs-display-in-side-window        t
  ;; 	treemacs-file-event-delay              5000
  ;; 	treemacs-file-follow-delay             0.2
  ;; 	treemacs-follow-after-init             t
  ;; 	treemacs-git-command-pipe              ""
  ;; 	treemacs-goto-tag-strategy             'refetch-index
  ;; 	treemacs-indentation                   2
  ;; 	treemacs-indentation-string            " "
  ;; 	treemacs-is-never-other-window         nil
  ;; 	treemacs-max-git-entries               5000
  ;; 	treemacs-no-png-images                 nil
  ;; 	treemacs-no-delete-other-windows       t
  ;; 	treemacs-project-follow-cleanup        nil
  ;; 	treemacs-persist-file                  (expand-file-name ".cache/treemacs-persist" user-emacs-directory)
  ;; 	treemacs-recenter-distance             0.1
  ;; 	treemacs-recenter-after-file-follow    nil
  ;; 	treemacs-recenter-after-tag-follow     nil
  ;; 	treemacs-recenter-after-project-jump   'always
  ;; 	treemacs-recenter-after-project-expand 'on-distance
  ;; 	treemacs-show-cursor                   nil
  ;; 	treemacs-show-hidden-files             t
  ;; 	treemacs-silent-filewatch              nil
  ;; 	treemacs-silent-refresh                nil
  ;; 	treemacs-sorting                       'alphabetic-desc
  ;; 	treemacs-space-between-root-nodes      t
  ;; 	treemacs-tag-follow-cleanup            t
  ;; 	treemacs-tag-follow-delay              1.5
  ;; 	treemacs-width                         35)

  ;; ;; The default width and height of the icons is 22 pixels. If you are
  ;; ;; using a Hi-DPI display, uncomment this to double the icon size.
  ;; ;;(treemacs-resize-icons 44)

  ;; (treemacs-follow-mode t)
  ;; (treemacs-filewatch-mode t)
  ;; (treemacs-fringe-indicator-mode t)
  )

(use-package treemacs-evil
  :after treemacs evil
  :ensure t)

(use-package treemacs-projectile
  :after treemacs projectile
  :ensure t)

;; (use-package treemacs-icons-dired
;;   :after treemacs dired
;;   :ensure t
;;   :config (treemacs-icons-dired-mode))

(use-package treemacs-magit
  :after treemacs magit
  :ensure t)

;; -----------------------------------------------------------------------------------;;
;; dried configurations
;; -----------------------------------------------------------------------------------;;
(use-package dired-x
  :ensure nil
  :bind
  (:map dired-mode-map ("RET" . dired-find-alternate-file))
  :config
  (progn (setq dired-recursive-copies 'always)
	 (setq dired-recursive-deletes 'always)
	 (setq dired-copy-preserve-time 'always)))
(provide 'init-file)
;;; init-file ends here
