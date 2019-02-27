;; init-highlight.el --- Initialize highlighting configurations.
;;; Commentary:
;;
;; Highlighting configurations.
;;

;;; Code:

;; Highlight the current line
(use-package hl-line
  :ensure nil
  :hook (after-init . global-hl-line-mode))

;;Highlight matching paren
(use-package paren
  :ensure nil
  :hook (after-init . show-paren-mode)
  :config
  (setq show-paren-when-point-inside-paren t)
  (setq show-paren-when-point-in-periphery t))

;;Highlight indentions
(when (display-graphic-p)
  (use-package highlight-indent-guides
    :diminish
    :hook (prog-mode . highlight-indent-guides-mode)
    :config
    (setq highlight-indent-guides-method 'character)
    (setq highlight-indent-guides-responsive t)
    
    ;; Disable `highlight-indet-guides-mode' in `swiper'
    ;; https://github.com/DarthFennec/highlight-indent-guides/issues/40
    (with-eval-after-load 'ivy
      (defadvice ivy-cleanup-string (after my-ivy-cleanup-hig activate)
        (let ((pos 0) (next 0) (limit (length str)) (prop 'highlight-indent-guides-prop))
          (while (and pos next)
            (setq next (text-property-not-all pos limit prop nil str))
            (when next
              (setq pos (text-property-any next limit prop nil str))
              (remove-text-properties next pos '(display nil face nil) str))))))))

;; Colorize color names in buffers
(use-package rainbow-mode
  :diminish
  :hook ((emacs-lisp-mode web-mode css-mode) . rainbow-mode))

;; Highlight brackets according to their depth
(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

;; Highlight uncommitted changes
;; (use-package diff-hl
;;   :defines desktop-minor-mode-table
;;   :commands diff-hl-magit-post-refresh
;;   :custom-face
;;   (diff-hl-change ((t (:background "#46D9FF"))))
;;   (diff-hl-delete ((t (:background "#ff6c6b"))))
;;   (diff-hl-insert ((t (:background "#98be65"))))
;;   :bind (:map diff-hl-command-map
;;               ("SPC" . diff-hl-mark-hunk))
;;   :hook ((after-init . global-diff-hl-mode)
;;          (dired-mode . diff-hl-dired-mode))
;;   :config
;;   ;; Highlight on-the-fly
;;   (diff-hl-flydiff-mode 1)

;;   ;; Set fringe style
;;   (setq diff-hl-draw-borders nil)
;;   (setq fringes-outside-margins t)
;;   (if sys/mac-x-p (set-fringe-mode '(4 . 8)))

;;   (unless (display-graphic-p)
;;     ;; Fall back to the display margin since the fringe is unavailable in tty
;;     (diff-hl-margin-mode 1)
;;     ;; Avoid restoring `diff-hl-margin-mode'
;;     (with-eval-after-load 'desktop
;;       (add-to-list 'desktop-minor-mode-table
;;                    '(diff-hl-margin-mode nil))))
;;   ;; Integration with magit
;;   (with-eval-after-load 'magit
;;     (add-hook 'magit-post-refresh-hook #'diff-hl-magit-post-refresh)))

;; Highlight some operations
(use-package volatile-highlights
  :diminish
  :hook (after-init . volatile-highlights-mode)
  :config
  (vhl/define-extension 'evil 'evil-paste-after 'evil-paste-before
			'evil-paste-pop 'evil-move)
  (vhl/install-extension 'evil)
  )

(provide 'init-highlight)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-highlight.el ends here
