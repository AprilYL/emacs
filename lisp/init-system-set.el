;;; package --- init-system-set.el

;;; Commentary:

;; change some system set

;;; Code:

;; colse ring bell when is scroll to the end
(setq ring-bell-function 'ignore)
;; configure encode
(set-language-environment 'utf-8)
;; (set-keyboard-coding-system 'utf-8) ; For old Carbon emacs on OS X only
(set-selection-coding-system 'utf-8)
;; (setq locale-coding-system 'utf-8)
;; (prefer-coding-system 'utf-8)

;; (set-language-environment-coding-systems "UTF-8")
;; (set-clipboard-coding-system 'utf-8)
;; (set-file-name-coding-system 'utf-8)
;; (setq buffer-file-coding-system 'utf-8)
;; (setq save-buffer-coding-system 'utf-8)
;; (set-terminal-coding-system 'utf-8)
;; (setq default-process-coding-system '(utf-8 . utf-8))

;; close startup screen
(setq inhibit-startup-screen t)
(setq inhibit-startup-message t)

;; don't compact font caches during GC
(setq inhibit-compacting-font-caches t)

(defalias 'yes-or-no-p 'y-or-n-p)

;; close warning window
(setq warning-minimum-level :emergency)

;; big file warning
(setq large-file-warning-threshold 1000000000)
(use-package auto-compile
  :config
  (auto-compile-on-save-mode)
  )
(provide 'init-system-set)
;;; init-system-set ends here


