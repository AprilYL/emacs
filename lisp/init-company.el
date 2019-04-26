;nit; init-company.el --- Initialize company configurations.
;;; Commentary:
;;
;; Auto-completion configurations.
;;

;;; Code:
(eval-when-compile
  (require 'init-const))

(use-package company
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
	      :map company-search-map
	      ("C-n" . company-select-next)
	      ("C-p" . company-select-previous)
	      )
  :hook
  (after-init . global-company-mode)
  :init
  (defun my-company-yasnippet ()
    (interactive)
    (company-abort)
    (call-interactively 'company-yasnippet))
  :config
  (setq company-tooltip-align-annotations t ; aligns annotation to the right
        company-tooltip-limit 12            ; bigger popup window
        company-idle-delay 0               ; decrease delay before autocompletion popup shows
        company-echo-delay 0                ; remove annoying blinking
        company-minimum-prefix-length 2
        company-require-match nil
        company-dabbrev-ignore-case nil
        company-dabbrev-downcase nil)

  ;; Popup documentation for completion candidates
  (use-package company-quickhelp
    :defines company-quickhelp-delay
    :bind (:map company-active-map
                ("C-c h" . company-quickhelp-manual-begin))
    :hook (global-company-mode . company-quickhelp-mode)
    :init (setq company-quickhelp-delay 0.1))
  )

(provide 'init-company)
;; init-company ends here
