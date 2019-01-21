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
	  :map evil-insert-state-map 
	  ("C-e" . move-end-of-line)
	  ("C-y" . yank)
	  ("C-a" . move-beginning-of-line)
	  ("C-w" . evil-delete)
	  :map evil-visual-state-map
	  ("C-e" . move-end-if-line)
	  ("C-y" . yank)
	  ("C-a" . move-beginning-of-line)
	  ("C-w" . evil-delete)		
	  )
    :config
    (evil-leader/set-key
    "ff" 'find-file
    "fd" 'delete-file
    "fr" 'recentf-open-files
    "bs" 'save-buffer
    "bc" 'switch-to-buffer
    "bk" 'kill-buffer
    "wv" 'split-window-vertically
    "wh" 'split-window-horizontally
    "wc" 'kill-buffer-and-window
    "wd" 'delete-window
    "wb" 'balance-windows
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
	      (kbd "/") 'evil-search-forward
	      (kbd "n") 'evil-search-next
	      (kbd "N") 'evil-search-previous
	      (kbd "C-d") 'evil-scroll-down
	      (kbd "C-u") 'evil-scroll-up)))

(provide 'init-evil)
