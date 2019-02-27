;; init-doom-themes.el --Initialize theme configurations.
;;; Commentary:
;;
;; Visual (UI) configurations.
;;

;;; Code:
(use-package doom-themes
  :config
  (setq doom-themes-enable-bold t)
  (setq doom-themes-enable-italic t)
  (load-theme 'atom-one-dark t)
  (doom-themes-visual-bell-config)
  (doom-themes-neotree-config)
  (doom-themes-treemacs-config)
  (doom-themes-org-config)
  )

;; change theme

(use-package doom-modeline
  :ensure t
  :hook
  (after-init . doom-modeline-mode)
  :config
  (setq find-file-visit-truename t)
  (setq doom-modeline-height 20)
  (setq doom-modeline-bar-width 1)
  (setq doom-modeline-buffer-file-name-style 'truncate-upto-project)

  ;; What executable of Python will be used (if nil nothing will be showed).
  (setq doom-modeline-python-executable "python")

  ;; Whether show `all-the-icons' or not (if nil nothing will be showed).
  (setq doom-modeline-icon t)

  ;; Whether show the icon for major mode. It respects `doom-modeline-icon'.
  (setq doom-modeline-major-mode-icon t)

  ;; Display color icons for `major-mode'. It respects `all-the-icons-color-icons'.
  (setq doom-modeline-major-mode-color-icon nil)

  ;; Whether display minor modes or not. Non-nil to display in mode-line.
  (setq doom-modeline-minor-modes nil)

  ;; If non-nil, a word count will be added to the selection-info modeline segment.
  (setq doom-modeline-enable-word-count nil)

  ;; Whether display perspective name or not. Non-nil to display in mode-line.
  (setq doom-modeline-persp-name t)

  ;; Whether display `lsp' state or not. Non-nil to display in mode-line.
  (setq doom-modeline-lsp t)

  ;; Whether display github notifications or not. Requires `ghub` package.
  (setq doom-modeline-github nil)

  ;; The interval of checking github.
  ;; (setq doom-modeline-github-interval (* 30 60))

  ;; Whether display environment version or not.
  (setq doom-modeline-version t)

  ;; Whether display mu4e notifications or not. Requires `mu4e-alert' package.
  (setq doom-modeline-mu4e t)
  )
(provide 'init-doom-themes)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-doom-themes.el ends here
