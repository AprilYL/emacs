;; config gui frame

;;Suppress GUI features
(setq use-file-dialog nil)
(setq use-dialog-box nil)
(setq inhibit-startup-screen t)


;;Window size and features
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))

(when (fboundp 'set-scroll-bar-mode)
  (set-scroll-bar-mode nil))

(when (fboundp 'menu-bar-mode)
  (menu-bar-mode -1))


(when (and (eq system-type 'darwin) (fboundp 'toggle-frame-fullscreen))
  ;; Command-Option-f to toggle fullscreen mode
  ;; Hint: Customize `ns-use-native-fullscreen'
  (global-set-key (kbd "C-M-f") 'toggle-frame-fullscreen))


(setq frame-title-format
      '((:eval (if (buffer-file-name)
                   (abbreviate-file-name (buffer-file-name))
                 "%b"))))

;; Non-zero values for `line-spacing' can mess up ansi-term and co,
;; so we zero it explicitly in those cases.
(add-hook 'term-mode-hook
          (lambda ()
            (setq line-spacing 0)))


;; Change global font size easily

(require 'default-text-scale)
(add-hook 'after-init-hook 'default-text-scale-mode)



;; configure gui size
(if (display-graphic-p)
    (progn
      (setq initial-frame-alist
	    '(
	      (width . 135) ;;chars
	      (height . 93) ;;lines
	      (left . 193)
	      (internal-border-width . 0)
	      ))
      (setq default-frame-alist
	    '(
	      (width . 135)
	      (height . 193)
	      (left . 93)
	      (internal-border-width . 0)
	      ))
      ))


(setq-default cursor-type 'bar)

;; (setq  initial-frame-alist (quote ((fullscreen . maximized)))) 

(global-hl-line-mode t)


(provide 'init-gui-frame)
