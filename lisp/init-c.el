;; package --- init-c.el.
;;; Commentary:
;;;
;;; C/C++ configuration.
;;
;;; Code:
(use-package cc-mode
  :ensure nil
  :hook
  ((c-mode-common c++-mode c-mode objec-mode) . (lambda () (set (make-local-variable 'company-backends)
								'((company-c-headers company-irony company-keywords company-capf compamy-yasnippet company-dabbrev  company-files )))))
  :bind
  (:map c-mode-base-map
	("C-c c" . compile))
  :hook (c-mode-common . (lambda()
			   (c-set-style "bsd")
			   (setq tab-width 4)
			   (setq c-basic-offset 4)))
  :config
  (use-package modern-cpp-font-lock
    :diminish
    :init
    (modern-c++-font-lock-global-mode t))

  ;; ------------------------------------------------------------------------------
  ;; irony
  ;; ------------------------------------------------------------------------------
  (use-package irony
    :ensure t
    :hook ((c++-mode . irony-mode)
	   (c-mode . irony-mode)
	   (objc-mode . irony-mode))
    :config
    (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
    (setq-default irony-cdb-compilation-databases '(irony-cdb-libclang
						    irony-cdb-clang-complete))
    (custom-set-variables
     '(irony-additional-clang-options
       '("-I/usr/local/opt/llvm/bin/../include/c++/v1"   "-I/usr/local/Cellar/llvm/10.0.0_3/lib/clang/10.0.0/include"   "-I/Library/Developer/CommandLineTools/SDKs/MacOSX10.15.sdk/usr/include")))
    )
  (use-package company-irony-c-headers
    :ensure t)

  (use-package flycheck-irony
    :config
    (progn
      (eval-after-load 'flycheck '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))))

  (use-package company-irony
    :ensure t
    )

  (use-package irony-eldoc
    :ensure t
    :config
    (add-hook 'irony-mode-hook #'irony-eldoc))
  ;;------------------------------------------------------------------------------
  ;; rtags
  ;;------------------------------------------------------------------------------
  ;; (use-package rtags
  ;;   :custom
  ;;   (rtags-path "~/rtags/bin/")
  ;;   :config
  ;;   ;; Shutdown rdm when leaving emacs.
  ;;   (add-hook 'kill-emacs-hook 'rtags-quit-rdm)
  ;;   )

  ;; ;; TODO: Has no coloring! How can I get coloring?
  ;; (use-package helm-rtags
  ;;   :config
  ;;   (setq rtags-display-result-backend 'helm)
  ;;   )

  ;; ;; Use rtags for auto-completion.
  ;; (use-package company-rtags
  ;;   :requires company rtags
  ;;   :config
  ;;   (progn
  ;;     (setq rtags-autostart-diagnostics t)
  ;;     (rtags-diagnostics)
  ;;     (setq rtags-completions-enabled t)
  ;;     (push 'company-rtags company-backends)
  ;;     ))

  ;; ;; Live code checking.
  ;; (use-package flycheck-rtags
  ;;   :requires flycheck rtags
  ;;   :config
  ;;   ;; ensure that we use only rtags checking
  ;;   ;; https://github.com/Andersbakken/rtags#optional-1
  ;;   (flycheck-select-checker 'rtags)
  ;;   (setq-local flycheck-highlighting-mode nil) ;; RTags creates more accurate overlays.
  ;;   (setq-local flycheck-check-syntax-automatically nil)
  ;;   (rtags-set-periodic-reparse-timeout 2.0)  ;; Run flycheck 2 seconds after being idle.
  ;;   )
  ;; (use-package rtags
  ;;   :ensure t
  ;;   :custom
  ;;   (rtags-path "~/rtags/bin/")
  ;;   :config
  ;;   (setq rtags-verify-protocol-version nil)
  ;;   (rtags-enable-standard-keybindings)
  ;;   (setq rtags-autostart-diagnostics t)
  ;;   (rtags-diagnostics)
  ;;   (setq rtags-completions-enabled t)
  ;;   (rtags-start-process-unless-running)
  ;;   )
  ;;------------------------------------------------------------------------------
  ;; ccls
  ;;------------------------------------------------------------------------------
  (use-package ccls
    :hook
    ((c-mode c++mode objc-mode) . (lambda () (require 'ccls (lsp))))
    :custom
    (ccls-executable "/usr/local/Cellar/ccls/0.20190314/bin/ccls")
    (ccls-sem-highlight-method 'font-lock)
    )
  )

;;------------------------------------------------------------------------------
;; cmake
;;------------------------------------------------------------------------------
(use-package cmake-mode
  :ensure t
  :mode (("CMakeLists\\.txt\\'" . cmake-mode)
	 ("\\.cmake\\'" . cmake-mode)
	 )
  :hook
  (cmake-mode . (lambda() (set (make-local-variable 'company-backends)
			       '(company-cmake company-keywords company-capf compamy-yasnippet company-dabbrev  company-files ))))
  (use-package cmake-ide
    :ensure t
    :config
    (cmake-ide-setup)
    )
  )

  ;;------------------------------------------------------------------------------
  ;; clang-format
  ;;------------------------------------------------------------------------------
  (use-package clang-format
    :ensure t
    :custom
    (clang-format-style-option "llvm")
    :config
    (add-hook 'c-mode-hook (lambda() (add-hook 'before-save-hook 'clang-format)))
    (add-hook 'c++-mode-hook (lambda() (add-hook 'before-save-hook 'clang-format)))
    )

;;------------------------------------------------------------------------------
;; code style config
;;------------------------------------------------------------------------------
(use-package google-c-style
  :diminish
  :ensure t
  :commands
  (google-set-c-style))


;;------------------------------------------------------------------------------
;; disaster
;;------------------------------------------------------------------------------
(use-package disaster
  :bind
  (:map c-mode-base-map
	("C-c d" . disaster)))

;; (use-package 'ccls
;;   :config
;;   (setq clls-excutable "/usr/local/Cellar/ccls/0.20190314/bin/ccls"))


(provide 'init-c)
;;; init-c.el ends here
