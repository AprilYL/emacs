;;config python

(use-package python
  :ensure t
  :mode ("\\.py\\'" . python-mode)
  :interpreter ("python" . python-mode)
  :config
  (use-package py-autopep8
    :ensure t
    :hook (python-mode . py-autopep8-enable-on-save)
    :bind ("C-c b" . py-autopep8-buffer))
  )


;;configure anaconda
(use-package anaconda-mode
  :config
  (add-hook 'python-mode-hook 'anaconda-mode)
  (add-hook 'python-mode-hook 'anaconda-eldoc-mode)
  (use-package company-anaconda
    :ensure t
    :after (company)
    :config
    (add-hook 'python-mode-hook
	    (lambda ()
	      (set (make-local-variable 'company-backends) '(company-anaconda company-files company-dabbrev company-dabbrev-code company-yasnippet)))))
  )



(use-package pip-requirements
  :hook
  (pip-requirements-mode #'pip-requirements-auto-complete-setup))

(use-package pyvenv
  :ensure t)

(use-package pipenv
  :hook (python-mode . pipenv-mode)
  :init
  (setq pipenv-projectile-after-switch-function #'pipenv-projectile-after-switch-extended))

(use-package ein
 )
  
(provide 'init-python)
