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


;;configure anaconda
;; (use-package anaconda-mode
;;   ;; :diminish anaconda-mode
;;   :hook
;;   ((python-mode . anaconda-mode)
;;    (python-mode . anaconda-eldoc-mode))
;;   :config
;;   (use-package company-anaconda
;;     :ensure t
;;     :after (company)
;;     :config
;;     (add-hook 'python-mode-hook
;; 	      (lambda ()
;; 		(set (make-local-variable 'company-backends) '(company-anaconda company-files company-dabbrev company-dabbrev-code company-yasnippet)))))
;;   )

(use-package anaconda-mode
  :defines anaconda-mode-localhost-address
  :diminish anaconda-mode
  :hook ((python-mode . anaconda-mode)
         (python-mode . anaconda-eldoc-mode))
  :config
  ;; WORKAROUND: https://github.com/proofit404/anaconda-mode#faq
  (when sys/macp
    (setq anaconda-mode-localhost-address "localhost"))
  (use-package company-anaconda
    :after company
    :defines company-backends
    :init (cl-pushnew 'company-anaconda company-backends)))

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

(use-package ein
  :bind
  (:map ein:notebook-mode-map
	("C-c M-d" . ein:worksheet-delete-cell))
  )

(provide 'init-python)
;;; init-python.el ends here
