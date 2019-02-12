;; (use-package js2-mode
;;   :mode
;;   ("\\.js?\\'" . js2-mode)
;;   :config
;;   ;; need other package
;;   ;;set indent
;;   (setq-default js2-bounce-indent-p nil)
;;   (setq-default js2-mode-show-parse-errors nil)
;;   (setq-default js2-mode-show-strict-warnings nil)
;;   (setq-default js-indent-level 2)
;;   (add-hook 'js2-mode-hook
;;             (lambda ()
;;               (push '("function" . ?ƒ) prettify-symbols-alist)))
;;   (add-hook 'js2-mode-hook
;;           (lambda ()
;;             (local-set-key (kbd "C-x C-e") 'js-send-last-sexp)
;;             (local-set-key (kbd "C-c b") 'js-send-buffer)
;;             (local-set-key (kbd "C-c C-b") 'js-send-buffer-and-go)))) 

;; (use-package tern
;; :ensure t
;; :init
;; (add-hook 'js2-mode-hook (lambda()
;; 			   (tern-mode t)
;; 			   (company-mode t)))
;; :config
;; (use-package company-tern
;;     :config
;;     (add-to-list 'company-backends 'company-tern)
;;     ))

;; (use-package skewer-mode
;;   :ensure t
;;   :init
;;   (add-hook 'js2-mode-hook 'skewer-mode))

;; (use-package js2-refactor
;; :ensure t
;; :bind
;; (:map js2-mode-map
;;       ("C-k" . js2r-kill))
;; :config
;; (add-hook 'js2-mode-hook 'js2-refactor-mode)
;; (js2r-add-keybindings-with-prefix "C-c C-r")
;; )

;; (use-package xref-js2
;;   :config
;;   (add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t))

;; (use-package js-comint
;;   :hook
;;   (js2-mode . js-comint-mode)
;;   :config
;;   (setq js-comint-program-command "node")
;;   (setq js-comint-program-arguments '("--interactive"))
;; )
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   ;     html
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   ;     css
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   ;     js
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package js2-mode
  :ensure t
  :mode
  (
   ("\\.js\\'" . js2-mode)
   ("\\.json\\'" . javascript-mode)
   )
  :init
  (setq-default js2-basic-offset 2)
  (setq-default js2-global-externs '("module" " require" "assert" "setTimeout" "clearTimeout" "setInterval" "clearInterval" "location" "__dirname__" "console" "JSON"))
  )

(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  ;; company is an optional dependency. You have to
  ;; install it separately via package-install
  ;; `M-x package-install [ret] company`
  (add-to-list (make-local-variable 'company-backends)
               'company-files)
  (company-mode +1))
 
(add-hook 'js2-mode-hook #'setup-tide-mode)
 
(use-package tide
  :ensure t
  :after (typescript-mode company flycheck)
  :hook ((typescript-mode . tide-setup)
         (typescript-mode . tide-hl-identifier-mode)
         (before-save . tide-format-before-save)))

(use-package prettier-js
  :ensure t
  :hook ((js2-mode . prettier-js-mode))
  :config
  (setq prettier-js-args '("--trailing-comma" "all"
                           "--bracket-spacing" "false")))
(provide 'init-js)
