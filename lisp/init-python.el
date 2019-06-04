;;; package --- init-python.el.
;;; Commentary:
;;
;; Python configurations.
;;

;;; Code:


;;-----------------------------------------------------------------------------------;;
;; python
;;-----------------------------------------------------------------------------------;;
(use-package python
  :ensure nil
  :defines gud-pdb-command-name pdb-path
  :mode (("\\.py\\'" . python-mode)
	 ("Sconscript\\'" . python-mode)
	 ("Sconstruct\\'" . python-mode))
  :interpreter ("python" . python-mode)
  :config
  (setenv "PYTHONIOENCODING" "utf-8")
  (setq python-shell-interpreter "ipython"
        python-shell-interpreter-args "-i --simple-prompt --no-color-info"
        python-shell-prompt-regexp "In \\[[0-9]+\\]: "
        python-shell-prompt-block-regexp "\\.\\.\\.\\.: "
        python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
        python-shell-completion-setup-code
        "from IPython.core.completerlib import module_completion"
        python-shell-completion-string-code
        "';'.join(get_ipython().Completer.all_completions('''%s'''))\n"
	)
  ;;Disable readline based native completion
  (setq python-shell-completion-native-enable nil)
  (add-hook 'inferior-python-mode-hook
	    (lambda ()
	      ;; (bind-key "C-c C-z" #'kill-buffer-and-window inferior-python-mode-map)
              (process-query-on-exit-flag (get-process "Python"))))
  )
;;-----------------------------------------------------------------------------------;;
;; pep8
;;-----------------------------------------------------------------------------------;;
(use-package py-autopep8
  :ensure t
  ;; :hook (python-mode . py-autopep8-enable-on-save)
  :bind ("C-c b" . py-autopep8-buffer))


;;-----------------------------------------------------------------------------------;;
;; conda and python company
;;-----------------------------------------------------------------------------------;;
(use-package anaconda-mode
  :after (python)
  :hook ((python-mode . anaconda-mode)
         (python-mode . anaconda-eldoc-mode))
  ;; :bind(:map python-mode-map
  ;; 	     ("C-f f" . 'anaconda-mode-find-file)
  ;; 	     ("C-f d" . 'anaconda-mode-find-definitions)
  ;; 	     ("C-f h" . 'anaconda-mode-show-doc)
  ;; 	     ("C-f a" . 'anaconda-mode-find-assignments)
  ;; 	     ("C-f r" . 'anaconda-mode-find-references)
  ;; 	     )
  :config
  (use-package company-anaconda
    :after (anaconda-mode company)
    :init
    (add-to-list 'company-backends '(company-anaconda company-capf company-files))
    ;; (add-hook 'python-mode-hook 
    ;; 	      (lambda ()
    ;; 		(set (make-local-variable 'company-backends) '(company-anaconda company-files company-dabbrev company-dabbrev-code company-yasnippet))))
    ))

;; Live Coding in Python

;; Format using YAPF
;; Install: pip install yapf
(use-package yapfify
  :diminish yapf-mode
  :hook (python-mode . yapf-mode))


(use-package pip-requirements
  :hook
  (pip-requirements-mode #'pip-requirements-auto-complete-setup))


;; (use-package pipenv
;;   :hook (python-mode . pipenv-mode)
;;   :init
;;   (setq pipenv-projectile-after-switch-function #'pipenv-projectile-after-switch-extended))

(use-package ein)

(use-package ob-ipython
  :after (anaconda-mode company)
  :init (cl-pushnew 'company-ob-ipython company-backends)
  ;; :config
  ;; for now I am disabling elpy only ob-ipython minor mode
  ;; what we should actually do, is just to ensure that
  ;; ob-ipython's company backend comes before elpy's (TODO)
  ;; (add-hook 'ob-ipython-mode-hookp
  ;;           (lambda ()
  ;;             (elpy-mode 0)
  ;;             (company-mode 1)))
  ;; (add-to-list 'company-backends '(company-ob-ipython company-anaconda))
  )

;;-----------------------------------------------------------------------------------;;
;; elpy
;;-----------------------------------------------------------------------------------;;
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
;; (use-package company-jedi
;;   :hook(python-mode . jedi:setup)
;;   :config
;;   (setq jedi:complete-on-dot t)
;;   (setq jedi:use-shortcuts t)
;;   (add-to-list 'company-backends 'company-jedi)
;;   ) 
(provide 'init-python)
;;; init-python.el ends here
