;; package --- init-eshell.el.
;;; Commentary:
;;;
;;;eshell configuration.
;;
;;; Code:
(use-package eshell
  :ensure nil
  :defines (compilation-last-buffer eshell-prompt-function)
  :commands (eshell/alias
             eshell-send-input eshell-flatten-list
             eshell-interactive-output-p eshell-parse-command)
  :hook (eshell-mode . (lambda ()
                         (eshell/alias "f" "find-file $1")
                         (eshell/alias "fo" "find-file-other-window $1")
                         (eshell/alias "d" "dired $1")
                         (eshell/alias "ll" "ls -l")
                         (eshell/alias "la" "ls -al")))

  :config
  ;;  Display extra information for prompt
  
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

  ;; Eldoc support
  (use-package esh-help
    :init (setup-esh-help-eldoc))

  ;; `cd' to frequent directory in eshell
  (use-package eshell-z
    :hook (eshell-mode
	   .
	   (lambda () (require 'eshell-z)))))
(provide 'init-eshell)
;;; init-eshell.el ends here
