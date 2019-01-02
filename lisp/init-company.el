(use-package company
  :mode
  (("\\.el'" . company-elisp)
   ("\\.py'" . company-anaconda)
   ("\\.class" . company-tern))
  :init
  (add-hook 'after-init-hook 'global-company-mode)
  :bind
  (:map company-active-map ("C-n" . company-select-next)
	("C-p" . company-select-previous))
  :config
  (setq-default company-dabbrev-other-buffers 'all
		company-tooltip-align-annotations t))

(use-package company-quickhelp
  :init
  (add-hook 'after-init-hook 'company-quickhelp-mode))







(provide 'init-company)
