;; inti-dired.el --- Initialize dired configurations.
;;; Commentary:
;;
;;Directory: configurations.
;;
;;; Code:

(use-package dired-x
  :ensure nil
  :bind
  (:map dired-mode-map ("RET" . dired-find-alternate-file))
  :config
  (progn (setq dired-recursive-copies 'always)
	 (setq dired-recursive-deletes 'always)
	 (setq dired-copy-preserve-time 'always)))


(provide 'init-dired)
