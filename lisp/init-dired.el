(use-package dired-x
  :bind
  (:map dired-mode-map ("RET" . dired-find-alternate-file))
  :config
  (progn (setq dired-recursive-copies 'always)
	 (setq dired-copy-preserve-time 'always)))


(provide 'init-dired)
