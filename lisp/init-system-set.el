;;; package --- init-system-set.el

;;; Commentary:

;; change some system set

;;; Code:

;; colse ring bell when is scroll to the end
(setq ring-bell-function 'ignore)

;; configure encode
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-language-environment-coding-systems 'utf-8)

;; close startup screen
(setq inhibit-startup-screen t)

;; don't compact font caches during GC
(setq inhibit-compacting-font-caches t)

(defalias 'yes-or-no-p 'y-or-n-p)

;; close warning window
(setq warning-minimum-level :emergency)

(provide 'init-system-set)
;;;init-system-set ends here


