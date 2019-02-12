(package-initialize)

(add-to-list 'load-path "~/.emacs.d/lisp")
  (require 'cask "~/.cask/cask.el")
  (cask-initialize)
  (require 'pallet)
  (pallet-mode t)
  (require 'cl)
  (require 'init-use-package)

  ;;-----------------------------------------------------------------------------------;;
  ;; config basic
  ;;-----------------------------------------------------------------------------------;;
  (require 'init-ui)
  (require 'init-gui-frame)
  (require 'init-better-default)
  (require 'init-theme)
  (require 'init-recentf)
  (require 'init-window-number)


  ;;-----------------------------------------------------------------------------------;;
  ;;some osx config 
  ;;-----------------------------------------------------------------------------------;;
  (require 'init-osx)


  ;;-----------------------------------------------------------------------------------;;
  ;; config edit
  ;;-----------------------------------------------------------------------------------;;
  (require 'init-iedit)
  (require 'init-auto-yasnippet)
  (require 'init-smartparens)
  (require 'init-expand-mode)



  ;;-----------------------------------------------------------------------------------;;
  ;; developer language config
  ;;-----------------------------------------------------------------------------------;;
  (require 'init-dumb-jump)
  (require 'init-python)
  (require 'init-csv)
  (require 'init-js)
  (require 'init-nodejs)
  (require 'init-java)
  (require 'init-markdown)
  (require 'init-org)
  (require 'init-html)
  (require 'init-flycheck)
  (require 'init-dash)
  (require 'init-git)
  (require 'init-projectile)
  (require 'init-docker)

  ;;-----------------------------------------------------------------------------------;;
  ;; key config
  ;;-----------------------------------------------------------------------------------;;
  (require 'init-keybindings)
  (require 'init-evil)
  ;; show what shortcut you define 
  (require 'init-whichkey)


  ;;-----------------------------------------------------------------------------------;;
  ;; config window
  ;;-----------------------------------------------------------------------------------;;
  (require 'init-ace-window)
  (require 'init-neotree)
  (require 'init-powerline)
  
  ;;-----------------------------------------------------------------------------------;;
  ;; config complete
  ;;-----------------------------------------------------------------------------------;;
  (require 'init-company)
  (require 'init-auto-yasnippet)
  (require 'init-complete-minibuffer)
  
  ;;-----------------------------------------------------------------------------------;;
  ;; other config
  ;;-----------------------------------------------------------------------------------;;
  (require 'init-dired)
  (require 'init-popwin)
;;  (require 'init-helm)	
  (require 'init-origami)  ;;code toggle
  (setq custom-file (expand-file-name "lisp/custom.el" user-emacs-directory))
  (load-file custom-file)
