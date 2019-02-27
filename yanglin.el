(package-initialize)

(add-to-list 'load-path "~/.emacs.d/lisp")
(require 'cask "~/.cask/cask.el")
(cask-initialize)
(require 'pallet)
(pallet-mode t)
(require 'cl)
(require 'init-use-package)

;;-----------------------------------------------------------------------------------;;
;; basic configurations
;;-----------------------------------------------------------------------------------;;
(require 'init-ui)
(require 'init-better-default)
(require 'init-doom-themes)


;; -----------------------------------------------------------------------------------;;
;; file configurations  
;; -----------------------------------------------------------------------------------;;
(require 'init-recentf)
(require 'init-dired)
(require 'init-treemacs)


;;-----------------------------------------------------------------------------------;;
;;some osx config 
;;-----------------------------------------------------------------------------------;;
(require 'init-osx)


;;-----------------------------------------------------------------------------------;;
;; config edit
;;-----------------------------------------------------------------------------------;;
(require 'init-auto-yasnippet)
(require 'init-edit)


;;-----------------------------------------------------------------------------------;;
;; config complete
;;-----------------------------------------------------------------------------------;;
(require 'init-company)
(require 'init-auto-yasnippet)
(require 'init-complete-minibuffer)

;;-----------------------------------------------------------------------------------;;
;; developer language config
;;-----------------------------------------------------------------------------------;;
(require 'init-org)
(require 'init-dumb-jump)
(require 'init-python)
(require 'init-csv)
(require 'init-web)
(require 'init-nodejs)
(require 'init-java)
(require 'init-markdown)
(require 'init-flycheck)
(require 'init-dash)
(require 'init-vcs)
(require 'init-projectile)
(require 'init-docker)
(require 'init-c)

;;-----------------------------------------------------------------------------------;;
;; key config
;;-----------------------------------------------------------------------------------;;
(require 'init-keybindings)
(require 'init-evil)
;; show what shortcut you define 

;;-----------------------------------------------------------------------------------;;
;; some utils ,include which key,ace-window,window-numberring
;;-----------------------------------------------------------------------------------;;
(require 'init-utils)

;;-----------------------------------------------------------------------------------;;
;; config window
;;-----------------------------------------------------------------------------------;;
(require 'init-neotree)
(require 'init-ido)


;;-----------------------------------------------------------------------------------;;
;; other config
;;-----------------------------------------------------------------------------------;;
(require 'init-dired)
(require 'init-popwin)
;; (require 'init-helm)	
(require 'init-origami)  ;;code toggle
(require 'init-treemacs)
(require 'init-highlight)
(setq custom-file (expand-file-name "lisp/custom.el" user-emacs-directory))
(load-file custom-file)
