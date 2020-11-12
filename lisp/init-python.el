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
  :mode (("\\.py\\'" . python-mode)
	 ("Sconscript\\'" . python-mode)
	 ("Sconstruct\\'" . python-mode))
  :interpreter ("python" . python-mode)
  :custom
  (python-indent-guess-indent-offset 4)
  :hook
  (python-mode . (lambda() (set (make-local-variable 'company-backends)
				'((company-anaconda :with company-capf ) (company-files company-keywords company-capf company-yasnippet company-dabbrev )))))
  :config
  (setenv "PYTHONIOENCODING" "utf-8")
  (setenv "LC_CTYPE" "UTF-8")
  ;;Disable readline based native completion
  (defun projectile-pyenv-mode-set ()
    "Set pyenv version matching project name."
    (let ((project (projectile-project-name)))
      (if (member project (pyenv-mode-versions))
	  (pyenv-mode-set project)
	(pyenv-mode-unset))))
  (add-hook 'projectile-after-switch-project-hook 'projectile-pyenv-mode-set)
  (setq python-shell-completion-native-enable nil)

  ;;-----------------------------------------------------------------------------------;;
  ;; pep8
  ;;-----------------------------------------------------------------------------------;;
  (use-package py-autopep8
    :hook (python-mode . py-autopep8-enable-on-save)
    :bind (:map python-mode-map
		("C-c b" . py-autopep8-buffer))
    :config
    (setq py-autopep8-options '("--max-line-length=80"))
    )
  ;;-----------------------------------------------------------------------------------;;
  ;; conda and python company
  ;;-----------------------------------------------------------------------------------;;
  (use-package anaconda-mode
    :after (python)
    :hook ((python-mode . anaconda-mode)
	   (python-mode . anaconda-eldoc-mode))
    :pretty-hydra
    (
     (:title "Ananconda")
     ("find"
      (("f" anaconda-mode-find-file "find-file")
       ("d" anaconda-mode-find-definitions-other-window "find define")
       ("a" anaconda-mode-find-assignments-other-window "find assignments"))
      "Other"
      (
       ("h" anaconda-mode-show-doc "show doc")
       ("r" anaconda-mode-find-references-other-window "find references")
       ("q" nil "quit")
       ))
     )
    )
  (use-package company-anaconda
    )
  )

;; Format using YAPF
;; Install: pip install yapf
(use-package yapfify
  :diminish yapf-mode
  :hook (python-mode . yapf-mode))


(use-package pip-requirements
  :hook
  (pip-requirements-mode #'pip-requirements-auto-complete-setup))

(use-package pyenv-mode
  :config
  (defun projectile-pyenv-mode-set ()
    "Set pyenv version matching project name."
    (let ((project (projectile-project-name)))
      (if (member project (pyenv-mode-versions))
	  (pyenv-mode-set project)
	(pyenv-mode-unset))))
  (add-hook 'projectile-after-switch-project-hook 'projectile-pyenv-mode-set)
  )
(use-package pipenv
  :hook (python-mode . pipenv-mode)
  :init
  (setq pipenv-projectile-after-switch-function #'pipenv-projectile-after-switch-extended))

(use-package ein
  :config
  (setq ein:ploymode t)
  (setq ein:output-area-inlined-images t)
  )

(provide 'init-python)
;;; init-python.el ends here
