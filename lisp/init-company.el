;nit; init-company.el --- Initialize company configurations.
;;; Commentary:
;;
;; Auto-completion configurations.
;;

;;; Code:
(eval-when-compile
  (require 'init-const))

(use-package company
  :ensure t
  :diminish company-mode
  :defines (company-dabbrev-ignore-case company-dabbrev-downcase)
  ;; :mode
  ;; (("\\.el'" . company-elisp)
  ;;  ("\\.py'" . company-anaconda)
  ;;  ("\\.class" . company-tern))
  :commands company-abort
  :bind (:map company-active-map
	      ("C-n" . company-select-next)
	      ("C-p" . company-select-previous)
	      ("<tab>" . company-complete-common-or-cycle)
	      ("RET" . (lambda () (interactive)
			 (progn (if (company-explicit-action-p)
				    (company-complete)
				  (call-interactively
				   (lookup-key (current-global-map)
					       (kbd "RET")))
				  ))))
	      :map company-search-map
	      ("C-n" . company-select-next)
	      ("C-p" . company-select-previous)
	      )
  :custom
  (company-idle-delay 0)
  (company-echo-delay 0)
  (company-minimum-prefix-length 1)
  (completion-ignore-case t)
  (company-tooltip-align-annotations t)
  (company-tooltip-limit 20)
  (company-require-match nil)
  ;; use M-1 M-2 etc to select completions
  (company-show-numbers t)

  :hook
  (after-init . global-company-mode)
  :config
  (set company-backends
       '((company-files
  	  company-keywords
  	  company-capf
  	  company-yasnippet)
  	 (company-abbrev
  	  company-dabbrev)))
  ;; Use the tab-and-go frontend
  ;; (company-tng-configure-default)
  ;; (setq company-fontends '(company-tng-frontend
  ;; 			   company-pseudo-tooltip-frontend
  ;; 			   company-echo-metadata-frontend))

  (use-package company-prescient
    :init(company-prescient-mode 1))
  ;; Popup documentation for completion candidates
  (use-package company-posframe
    :hook (company-mode . company-posframe-mode))
  )

(use-package company-quickhelp
  :defines company-quickhelp-delay
  :bind (:map company-active-map
	      ("C-c h" . company-quickhelp-manual-begin))
  :hook (global-company-mode . company-quickhelp-mode)
  :init (setq company-quickhelp-delay 0.01))

;; (use-package company-tabnine
;;   :ensure t
;;   :config
;;   (add-to-list 'company-backends #'company-tabnine)
;;   )


(provide 'init-company)
;;; init-company ends here
