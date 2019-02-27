;; init-python.el --- Initialize python configurations.
;;; Commentary:
;;
;; Python configurations.
;;

;;; Code:

(use-package python
  :ensure nil
  :defines gud-pdb-command-name pdb-path
  :mode ("\\.py\\'" . python-mode)
  :interpreter ("python" . python-mode)
  :config
  (setq python-shell-interpreter "ipython"
	python-shell-prompt-regexp ""
	python-shell-prompt-block-regexp "\\.\\.\\.\\.:"
	python-shell-prompt-output-regexp ""
	python-shell-interpreter-args "-i --pylab --simple-prompt --no-color-info")
  ;;Disable readline based native completion
  (setq python-shell-completion-native-enable nil)
  (add-hook 'inferior-python-mode-hook
	    (lambda ()
	      ;; (bind-key "C-c C-z" #'kill-buffer-and-window inferior-python-mode-map)
              (process-query-on-exit-flag (get-process "Python"))))
  (use-package py-autopep8
    :ensure t
    :hook (python-mode . py-autopep8-enable-on-save)
    :bind ("C-c b" . py-autopep8-buffer))
  )

;; (use-package anaconda-mode
;;   :config
;;   (add-hook 'python-mode-hook 'anaconda-mode)
;;   (add-hook 'python-mode-hook 'anaconda-eldoc-mode)
;;   (use-package company-anaconda
;;     :ensure t
;;     :after (company)
;;     :config
;;     (add-hook 'python-mode-hook
;; 	      (lambda ()
;; 		(set (make-local-variable 'company-backends) '(company-anaconda company-files company-dabbrev company-dabbrev-code company-yasnippet)))))
;;   )


(use-package anaconda-mode
  :delight
  :hook ((python-mode . anaconda-mode)
         (python-mode . anaconda-eldoc-mode))
  :config
  ;; WORKAROUND: https://github.com/proofit404/anaconda-mode#faq
  (setq url-proxy-service
	'(("no_proxy" . "^\\(127.0.0.1\\|localhost\\|10.*\\)")
          ("http" . "127.0.0.1:6152")
          ("https" . "127.0.0.1:6152")))
  (use-package company-anaconda
    :after (anaconda-mode company)
    :config (add-to-list 'company-backends '(company-anaconda :with company-capf))
    ))

;; Live Coding in Python
(use-package live-py-mode)

;; Format using YAPF
;; Install: pip install yapf
(use-package yapfify
  :diminish yapf-mode
  :hook (python-mode . yapf-mode))


(use-package pip-requirements
  :hook
  (pip-requirements-mode #'pip-requirements-auto-complete-setup))

(use-package pyvenv
  :ensure t)

(use-package pipenv
  :hook (python-mode . pipenv-mode)
  :init
  (setq pipenv-projectile-after-switch-function #'pipenv-projectile-after-switch-extended))

(use-package ein)

(use-package ob-ipython
  :after company
  ;; :defines company-backends
  ;; :init (cl-pushnew 'company-ob-ipython company-backends)
  :config
  ;; for now I am disabling elpy only ob-ipython minor mode
  ;; what we should actually do, is just to ensure that
  ;; ob-ipython's company backend comes before elpy's (TODO)
  (add-hook 'ob-ipython-mode-hookp
            (lambda ()
              (elpy-mode 0)
              (company-mode 1)))
  (add-to-list 'company-backends '(company-ob-ipython company-anaconda))
  )

;; elpy
(use-package elpy
  :ensure t
  :init
  (setq elpy-rpc-backend "jedi")
  (elpy-enable)
  :config
  (add-hook 'python-mode-hook 'elpy-mode)
  ;; (with-eval-after-load 'elpy
  ;;   (add-hook 'elpy-mode-hook 'elpy-use-ipython))
  :bind (("M-*" . pop-tag-mark))
  )

;;company-jedi
(use-package company-jedi
  :config
  (setq jedi:complete-on-dot t)
  (setq jedi:use-shortcuts t)
  (add-to-list 'company-backends 'company-jedi)
  )

(provide 'init-python)
;;; init-python.el ends here
