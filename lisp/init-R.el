;; package --- init-R.el.
;;; Commentary:
;;;
;;; R configuration.
;;
;;; Code:
(use-package ess

  :config
  (add-hook 'ess-mode-hook (lambda() (add-to-list (make-local-variable 'company-backends) '(company-R-args company-R-library company-R-objects))))
  (speedbar-add-supported-extension ".R")
  ;; create a new frame for each help instance
  ;; (setq ess-help-own-frame t)
  ;; If you want all help buffers to go into one frame do:
  ;; (setq ess-help-own-frame 'one)
  
  ;; I want the *R* process in its own frame
  ;; This was a broken feature in ESS, fixed now. Helps massively!
  (setq inferior-ess-own-frame t)
  ;;(setq inferior-ess-same-window nil)
  )
(provide 'init-R)
;;; init-R.el ends here
