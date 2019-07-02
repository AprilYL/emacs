;;; init-dashboard.el --- configure dashboard

;;; Commentary:

;; Copyright (C) 2019  杨霖

;;; Code:

(use-package dashboard
  :ensure t
  :demand dashboard-modify-heading-icons
  :custom
  (dashboard-items '((recents . 15)
		     (bookmarks . 5)
		     (projects . 5)))
  ;; (dashboard-startup-banner 4)
  (dashboard-center-content t)
  :hook
  (after-init . dashboard-setup-startup-hook)
  :config
  ;; (dashboard-setup-startup-hook)
  ;; (setq dashboard-banner-logo-title "Happy Hacking")
  (setq dashboard-set-heading-icons t)
  (setq dashboard-set-file-icons t)
  (dashboard-modify-heading-icons '((recents . "file-text")
  				    (bookmarks . "book")))
  )
(provide 'init-dashboard)
;;; init-dashboard.el ends here
