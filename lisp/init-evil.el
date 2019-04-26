;;;; package --- init-evil.el

;;; Commentary:

;; vim configure

;;; Code:
;;;config
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
  :config
  (setq evil-want-C-u-scroll t)
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
    "wv" 'split-window-vertically
    "wh" 'split-window-horizontally
    "wc" 'kill-buffer-and-window
    "wd" 'delete-window
    "wb" 'balance-windows
    "wm" 'toggle-frame-maximized
    "1"  'select-window-1
    "2"  'select-window-2
    "3"  'select-window-3
    "4"  'select-window-4
    "5"  'select-window-5

    
    ;; origami
    "ono" 'origami-open-node
    "ons" 'origami-show-node
    "onc" 'origami-close-node
    "ont" 'origami-toggle-node
    
    "oro" 'origami-open-node-recursively
    "orc" 'origami-close-node-recursively
    "orf" 'origami-forward-toggle-node

    "oao" 'origami-open-all-nodes
    "oac" 'origami-close-all-nodes
    "oat" 'origami-toggle-all-nodes

    "ofn" 'origami-next-fold
    "ofp" 'origami-previous-fold
    "off" 'origami-forward-fold

    ;; treemacs
    "tt" 'treemacs

    ;; delete bracket
    "db" 'sp-unwrap-sexp

    ;; projectile key
    "pf" 'helm-projectile-find-file
    "pp" 'helm-projectile-switch-project
    "pb" 'helm-projectile-switch-to-buffer
    "pr" 'helm-projectile-run-project
    "ps" 'helm-projectile-ag

    ;; anaconda
    "ad" 'anaconda-mode-find-definitions-other-window
    "aa" 'anaconda-mode-find-assignments-other-window
    "ar" 'anaconda-mode-find-references-other-window

    ;;eshell
    "so" 'eshell
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
(provide 'init-evil)
;;; init-evil ends here



