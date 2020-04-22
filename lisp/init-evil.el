;;;; package --- init-evil.el

;;; Commentary:

;; vim configure

;;; Code:
;;;config
;;----------------------------------------------------------------------------;;
;; evil
;;----------------------------------------------------------------------------;;
(use-package evil
  :demand evil
  :hook
  (after-init . evil-mode)
  :bind
  (:map evil-normal-state-map
	("C-e" . move-end-of-line)
	("C-y" . yank)
	("C-a" . move-beginning-of-line)
	("C-w" . evil-delete)
	("C-k" . evil-delete-line)
	:map evil-insert-state-map 
	("C-e" . move-end-of-line)
	("C-y" . yank)
	("C-a" . move-beginning-of-line)
	("C-w" . evil-delete)
	("C-k" . evil-delete-line)
	:map evil-visual-state-map
	("C-e" . move-end-if-line)
	("C-y" . yank)
	("C-a" . move-beginning-of-line)
	("C-w" . evil-delete)		
	("C-k" . evil-delete-line))
  )

;;----------------------------------------------------------------------------;;
;; evil-surround
;;----------------------------------------------------------------------------;;
(use-package evil-surround
  :demand evil-surround
  :hook
  (after-init . global-evil-surround-mode)
  )
;; (add-hook 'occur-mode-hook
;; 	  (lambda ()
;; 	    (evil-add-hjkl-bindings occur-mode-map 'emacs
;; 	      (kbd "/")   'evil-search-forward
;; 	      (kbd "n")   'evil-search-next
;; 	      (kbd "N")   'evil-search-previous
;; 	      (kbd "C-d") 'evil-scroll-down
;; 	      (kbd "C-u") 'evil-scroll-up)))

;;----------------------------------------------------------------------------;;
;; evil-leader
;;----------------------------------------------------------------------------;;
(use-package evil-leader
  :demand evil-leader
  :hook
  (after-init . global-evil-leader-mode)
  :config
  (setq evil-leader/leader "SPC")
  (evil-leader/set-key
    ;;helm-x
    "x" 'helm-M-x
    ;;file and frame
    "ff" 'counsel-find-file
    "fd" 'delete-file
    "fr" 'recentf-open-files
    "fm" 'make-frame
    "fo" 'other-frame
    "fc" 'delete-frame

    ;;buffer shortcut
    "bs" 'save-buffer
    "bc" 'ivy-switch-buffer
    "bk" 'kill-buffer
    "be" 'eval-buffer
    "bd" 'evil-scroll-page-down
    "bl" 'recenter-top-bottom
    "bu" 'evil-scroll-page-up
    "bm" 'recenter-top-bottom

    ;;scroll window
    "k" 'scroll-down
    "j" 'scroll-up
    "l" 'recenter-top-bottom
    "g" 'evil-goto-line
    "v" 'evil-visual-line
    ";" 'comment-dwim
    ;;windown
    "ws" 'ace-swap-window
    "wh" 'split-window-vertically
    "wv" 'split-window-horizontally
    "wc" 'kill-buffer-and-window
    "wd" 'delete-window
    "wb" 'balance-windows
    "wm" 'toggle-frame-maximized
    "1"  'select-window-1
    "2"  'select-window-2
    "3"  'select-window-3
    "4"  'select-window-4
    "5"  'select-window-5
    "6"  'select-window-6
    "7"  'select-window-7
    "8"  'select-window-8
    "9"  'select-window-9

    
    ;; n means navigation
    ;; origami
    "nn" 'origami-hydra/body

    ;; dumb-jump
    "ng" 'hydra-dumb-jump/body

    ;; navigation python code
    "np" 'hydra-anaconda/body

    ;; multiple-cursors
    ;; "em" hydra-evil-mc/body

    ;; treemacs
    "t" 'treemacs

    ;; e means edit
    ;; smartparens
    "ep" 'hydra-smartparens/body

    ;; auto-yasnippet
    "ey" 'hydra-auto-yasnippet/body

    ;; "em" 'hydra-multiple-cursors/body
    ;; projectile key
    "p" 'hydra-helm-projectile/body

    ;;eshell
    "so" 'eshell)
  )

;;----------------------------------------------------------------------------;;
;; evil-lion
;;----------------------------------------------------------------------------;;
(use-package evil-lion
  :demand evil-lion
  :hook
  (after-init . evil-lion-mode)
  :ensure t
  :bind (:map evil-normal-state-map
	      ("g l " . evil-lion-left)
	      ("g L " . evil-lion-right)
	      :map evil-visual-state-map
	      ("g l " . evil-lion-left)
	      ("g L " . evil-lion-right))
  )

;;----------------------------------------------------------------------------;;
;; evil-matchit
;;----------------------------------------------------------------------------;;
(use-package evil-matchit
  :hook(after-init . global-evil-matchit-mode))

(use-package evil-mc
  :hook
  (after-init . global-evil-mc-mode)
  )
(provide 'init-evil)
;;; init-evil ends here
