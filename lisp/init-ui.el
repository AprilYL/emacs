;; init-ui.el --Initialize ui configurations.
;;; Commentary:
;;
;; Visual (UI) configurations.
;;

;;; Code:

(eval-when-compile
  (require 'init-const))

;;Suppress GUI features
(setq use-file-dialog nil)
(setq use-dialog-box nil)


;; configure gui size
(if (display-graphic-p)
    (progn
      (setq initial-frame-alist
	    '(
	      (width . 118) ;;chars
	      (height . 94) ;;lines
	      (left . 960)
	      (top . 0)
	      (internal-border-width . 0)
	      ))
      (setq default-frame-alist
	    '(
	      (width . 118)
	      (height . 94)
	      (left . 960)
	      (top . 0)
	      (internal-border-width . 0)
	      ))
      ))

;; logo
;;(setq fancy-splash-image april-logo)

;;Title
(setq frame-title-format
      '("April Emacs -"
	(:eval (if (buffer-file-name)
		   (abbreviate-file-name (buffer-file-name))
		 "%b"))))
(setq icon-title-format frame-title-format)

(when sys/mac-x-p
  (add-to-list 'default-frame-alist '(ns-appearance . dark))
  (add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
  (add-hook 'after-load-theme-hootome
            (lambda ()
              (let ((bget(frame-parameter nil 'background-mode)))
                (set-frame-parameter nil 'ns-appearance bg)
                (setcdr (assq 'ns-appearance default-frame-alist) bg)))))

(unless sys/mac-x-p (menu-bar-mode -1))
(and (bound-and-true-p tool-bar-mode) (tool-bar-mode -1))
(and (fboundp 'scroll-all-mode) (scroll-bar-mode -1))


;; Mode-line
(defun mode-line-height ()
  "Get current height of mode-line."
  (- (elt (window-pixel-edges) 3)
     (elt (window-inside-pixel-edges) 3)))


;; Icons
;; NOTE: Must run `M-x all-the-icons-install-fonts' manually on Windows
(use-package all-the-icons
  :if (display-graphic-p)
  :config
  (unless (or sys/win32p (member "all-the-icons" (font-family-list)))
    (all-the-icons-install-fonts t)))

;; Line and Column
(setq-default fill-column 80)
(setq column-number-mode t)
(setq line-number-mode t)


;; Show line number
;; Highlight current line number
(use-package hlinum
  :defines linum-highlight-in-all-buffersp
  :hook (global-linum-mode . hlinum-activate)
  :init
  (add-hook 'after-init-hook 'global-linum-mode)
  (setq linum-highlight-in-all-buffersp t)
  (custom-set-faces
   `(linum-highlight-face
     ((t (:inherit 'default :background ,(face-background 'default) :foreground ,(face-foreground 'default)))))))

;; Mouse & Smooth Scroll
;; Scroll one line at a time (less "jumpy" than defaults)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))
(setq mouse-wheel-progressive-speed nil)
(setq scroll-step 1
      scroll-margin 0
      scroll-conservatively 100000)


;; Display Time
(use-package time
  :ensure nil
  :unless (display-graphic-p)
  :hook (after-init . display-time-mode)
  :init
  (setq display-time-24hr-format t)
  (setq display-time-day-and-date t))


;; Misc
(defalias 'yes-or-no-p 'y-or-n-p)
(setq inhibit-startup-screen t)
(setq visible-bell t)
(size-indication-mode 1)
;; (blink-cursor-mode -1)
(setq track-eol t)                      ; Keep cursor at end of lines. Require line-move-visual is nil.
(setq line-move-visual nil)
(setq inhibit-compacting-font-caches t) ; Don’t compact font caches during GC.

;; Don't open a file in a new frame
(when (boundp 'ns-pop-up-frames)
  (setq ns-pop-up-frames nil))

;; Don't use GTK+ tooltip
(when (boundp 'x-gtk-use-system-tooltips)
  (setq x-gtk-use-system-tooltips nil))

;;Font and line space
;; (set-face-attribute 'default nil :height 150)
(set-default-font "Monaco 13")

(setq-default line-spacing 0.35)
;; (add-text-properties (point-min) (point-max)
;; 		     '(line-spacing 0.15 line-height 1.25))

;; Toggle fullscreen
;; (bind-keys
;;  ("M-RET" . toggle-frame-fullscreen) ; Compatible with macOS
;;  )
(provide 'init-ui)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-ui.el ends here
