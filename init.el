;;; package  --- emacs init file ;

;;; Commentary:

;;; Code:

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(setq load-prefer-newer t)
(setq package-enable-at-startup nil)
(package-initialize)
(put 'dired-find-alternate-file 'disabled nil)
(add-to-list 'load-path "~/.emacs.d/lisp")
;; using cask manage the emacs package  which you install
(require 'init-package)
(require 'init-benchmark)
(require 'init-const)

;;-----------------------------------------------------------------------------------;;
;; basic configurations
;;-----------------------------------------------------------------------------------;;
(require 'init-system-set)
(require 'init-ui)
(require 'init-dashboard)
(require 'init-highlight)
(require 'init-file)
(require 'init-evil)
(require 'init-helm)
(require 'init-utils)

;;-----------------------------------------------------------------------------------;;
;; some osx config
;;-----------------------------------------------------------------------------------;;
(require 'init-osx)


;; ;;-----------------------------------------------------------------------------------;;
;; ;; config edit
;; ;;-----------------------------------------------------------------------------------;;
(require 'init-yasnippet)
(require 'init-edit)
(require 'init-navigation.el)


;; ;;-----------------------------------------------------------------------------------;;
;; ;; config complete
;; ;;-----------------------------------------------------------------------------------;;
(require 'init-company)
(require 'init-complete-minibuffer)

;;-----------------------------------------------------------------------------------;;
;; developer tool
;;-----------------------------------------------------------------------------------;;
(require 'init-lsp)
(require 'init-eshell)
(require 'init-projectile)
(require 'init-dash)
(require 'init-flycheck)
(require 'init-vcs)
(require 'init-origami)  ;;code toggle


;;-----------------------------------------------------------------------------------;;
;; develope language
;;-----------------------------------------------------------------------------------;;
(require 'init-prog)
(require 'init-python)
(require 'init-cython)
(require 'init-org)
(require 'init-csv)
(require 'init-web)
(require 'init-nodejs)
(require 'init-java)
(require 'init-markdown)
(require 'init-docker)
(require 'init-c)
(require 'init-cuda)
(require 'init-ido)
(require 'init-lua)
(require 'init-opengl)
(require 'prototxt-mode)
(require 'init-es)

;; ;;-----------------------------------------------------------------------------------;;
;; ;; other config
;; ;;-----------------------------------------------------------------------------------;;
;; (require 'init-popwin)
(setq custom-file (expand-file-name "lisp/custom.el" user-emacs-directory))
(load-file custom-file)
;;; init.el ends here
