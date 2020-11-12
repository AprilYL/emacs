;;;; package --- init-evil.el

;;; Commentary:
;; vim configure
;;; Code:
;;;config
;;----------------------------------------------------------------------------;;
;; evil
;;----------------------------------------------------------------------------;;
(use-package evil
  :ensure t
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
  :config
  (setq evil-ex-search-vim-style-regexp t)
  (setq evil-search-module 'evil-search)
  (setq evil-magic 'very-magic)
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
    ;; jump
    "g" 'ace-jump-mode-hydra/body

    ;; flycheck
    "c" 'flyspell-correct-hydra/body

    ;; Files
    "ff" 'counsel-find-file 
    "fd" 'delete-file
    "fr" 'helm-recentf
    ;;buffer shortcut
    "fm" 'make-frame
    "fo" 'other-frame
    "fc" 'delete-frame

    "bs" 'save-buffer
    "bc" 'ivy-switch-buffer
    "bk" 'kill-buffer
    "be" 'eval-buffer


    ;;scroll window
    "k" 'scroll-down
    "j" 'scroll-up
    "l" 'recenter-top-bottom
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
    "ng" 'dumb-jump-hydra/body

    ;; navigation python code
    "np" 'anaconda-mode-hydra/body

    ;; multiple-cursors
    ;; "em" hydra-evil-mc/body

    ;; treemacs
    "t" 'treemacs

    ;; e means edit
    ;; smartparens
    "ep" 'smartparens-hydra/body

    ;; auto-yasnippet
    "ey" 'hydra-auto-yasnippet/body

    ;; ivy-uasnippey
    "ei" 'ivy-yasnippet

    ;; "em" 'hydra-multiple-cursors/body
    ;; projectile key
    "p" 'helm-projectile-hydra/body

    ;;eshell
    "so" 'eshell
    "sp" 'helm-swoop
    "smp" 'helm-multi-swoop
    ;; java

    ;; Hydra-marjor -mode
    "h" 'major-mode-hydra
    )
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

;;----------------------------------------------------------------------------;;
;; evil-multiple cursor
;;----------------------------------------------------------------------------;;
(use-package evil-mc
  ;; :function hydra-evil-mc/body
  :hook
  (after-init . global-evil-mc-mode)
  ;; :config
  ;; (defhydra hydra-evil-mc(:color blue :hint none)
  
  ;;   )
  )

;;----------------------------------------------------------------------------;;
;; evil-collection
;;----------------------------------------------------------------------------;;
(use-package evil-collection
  :ensure t
  :after evil
  :config
  (evil-collection-init)
  )
;;----------------------------------------------------------------------------;;
;; evil-numbers
;;----------------------------------------------------------------------------;;
(use-package evil-numbers
  :config
  (global-set-key (kbd "C-c =") 'evil-numbers/inc-at-pt)
  (global-set-key (kbd "C-c -") 'evil-numbers/dec-at-pt)
  )
(provide 'init-evil)
;;; init-evil ends here
