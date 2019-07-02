;; package --- init-c.el.
;;; Commentary:
;;;
;;; C/C++ configuration.
;;
;;; Code:
(use-package cc-mode
  :ensure nil
  :init
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
  )

;; ------------------------------------------------------------------------------
;; irony
;; ------------------------------------------------------------------------------
(use-package irony
  :ensure t
  :hook ((c++-mode . irony-mode)
         (c-mode . irony-mode))
  :config
  (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
  (setq irony-additional-clang-options (append '("-std=c++11") irony-additional-clang-options))
  (setq irony-additional-clang-options (append '("-I" "/usr/local/Cellar/llvm/8.0.0/include/c++/v1/") irony-additional-clang-options))
  (setq irony-additional-clang-options (append '("-I" "/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/") irony-additional-clang-options))
  ;; (use-package company-irony-c-headers
  ;;   :ensure t)
  (use-package company-irony
    :ensure t
    ;; :config
    :init
    ;; (cl-pushnew 'company-irony company-backend)
    ;; (cl-pushnew 'company-c-headers company-backend)
    (add-to-list (make-local-variable 'company-backends) '(company-irony company-c-headers company-files company-capf company-dabbrev)))
  ;; (use-package flycheck-irony
  ;;   :ensure t
  ;;   :config
  ;;   (eval-after-load 'flycheck '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup)))
  (use-package irony-eldoc
    :ensure t
    :config
    (add-hook 'irony-mode-hook #'irony-eldoc))
  )
;;------------------------------------------------------------------------------
;; rtags
;;------------------------------------------------------------------------------
(use-package rtags
  :ensure t
  :custom
  (rtags-path "~/rtags-2.33/bin/")
  :config
  (setq rtags-verify-protocol-version nil)
  (rtags-enable-standard-keybindings)
  (setq rtags-autostart-diagnostics t)
  (rtags-diagnostics)
  (setq rtags-completions-enabled t)
  (rtags-start-process-unless-running)
  )
;;------------------------------------------------------------------------------
;; ccls
;;------------------------------------------------------------------------------
(use-package lsp-mode
  :commands lsp)
(use-package lsp-ui
  :commands lsp-ui-mode)
(use-package company-lsp
  :commands company-lsp)
(use-package ccls
  :hook
  ((c-mode c++mode objc-mode) . (lambda () (require 'ccls (lsp))))
  :custom
  (ccls-executable "/usr/local/Cellar/ccls/0.20190314/bin/ccls")
  (ccls-sem-highlight-method 'font-lock)
  )

;;------------------------------------------------------------------------------
;; cmake
;;------------------------------------------------------------------------------
(use-package cmake-mode
  :ensure t
  :mode (("CMakeLists\\.txt\\'" . cmake-mode)
	 ("\\.cmake\\'" . cmake-mode)
	 )
  :config
  (add-hook 'cmake-mode-hook (lambda() (add-to-list (make-local-variable 'company-backends) '(company-cmake company-files company-capf company-dabbrev))))
  )
(use-package cmake-ide
  :ensure t
  :config
  (cmake-ide-setup)
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
