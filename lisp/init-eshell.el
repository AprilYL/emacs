;; package --- init-eshell.el.
;;; Commentary: ;;;
;;;eshell configuration.
;;
;;; Code:
(use-package eshell
  :ensure nil
  :defines (compilation-last-buffer eshell-prompt-function)
  :commands (eshell/alias
             eshell-send-input eshell-flatten-list
             eshell-interactive-output-p eshell-parse-command)
  :config
  ;;  Display extra information for prompt
  (setq comint-prompt-read-only t))
;; Fish-like history autosuggestions
(use-package esh-autosuggest
  :defines ivy-display-functions-alist
  :preface
  (defun setup-eshell-ivy-completion ()
    (setq-local ivy-display-functions-alist
		(remq (assoc 'ivy-completion-in-region ivy-display-functions-alist)
		      ivy-display-functions-alist)))
  :bind (:map eshell-mode-map
	      ([remap eshell-pcomplete] . completion-at-point))
  :hook ((eshell-mode . esh-autosuggest-mode)
	 (eshell-mode . setup-eshell-ivy-completion)))
(use-package esh-opt
  :ensure virtualenvwrapper
  )
;;   ;; Eldoc support
(use-package esh-help
  :init (setup-esh-help-eldoc))
(use-package eshell-prompt-extras
  )
(use-package esh-opt
  :config
  (venv-initialize-eshell)
  (setq eshell-highlight-prompt nil
	eshell-prompt-function 'epe-theme-dakrone
	)
  )

(provide 'init-eshell)
;;; init-eshell.el ends here
