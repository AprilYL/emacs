;;;config 
(use-package evil
  :config
  (use-package evil-leader
    :init
    (evil-mode t)
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
	  ("C-k" . evil-delete-line)
	  )
    :config
    (evil-leader/set-key
      ;;file shortcut
      "ff" 'counsel-find-file
      "fd" 'delete-file
      "fr" 'recentf-open-files

      ;;buffer shortcut
      "bs" 'save-buffer
      "bc" 'ivy-switch-buffer
      "bk" 'kill-buffer
      "be" 'eval-buffer
      "bd" 'evil-scroll-page-down
      "bl" 'recenter-top-bottom
      "bu" 'evil-scroll-page-up
      "bm" 'recenter-top-bottom

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

      
      ;;origami
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

      ;;neotree
      "tt" 'neotree-toggle
      "tp" 'neotree-projectile-action
      
      )
    (global-evil-leader-mode)
    )
  (use-package evil-surround
    :ensure t
    :config
    (global-evil-surround-mode t))
  (setq evil-want-C-u-scroll t)
  ;; (setq evil-want-C-w-delete t)
  (global-evil-leader-mode))

(add-hook 'occur-mode-hook
	  (lambda ()
	    (evil-add-hjkl-bindings occur-mode-map 'emacs
	      (kbd "/")   'evil-search-forward
	      (kbd "n")   'evil-search-next
	      (kbd "N")   'evil-search-previous
	      (kbd "C-d") 'evil-scroll-down
	      (kbd "C-u") 'evil-scroll-up)))
(use-package evil-lion
  :ensure t
  :bind (:map evil-normal-state-map
	      ("g l " . evil-lion-left)
	      ("g L " . evil-lion-right)
              :map evil-visual-state-map
	      ("g l " . evil-lion-left)
	      ("g L " . evil-lion-right))
  :config
  (evil-lion-mode)
  )
(provide 'init-evil)
