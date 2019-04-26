;;; package  --- emacs init file ;

;;; Commentary:

;;; Code:
(put 'dired-find-alternate-file 'disabled nil)
(package-initialize)
(add-to-list 'load-path "~/.emacs.d/lisp")

;; using cask manage the emacs package  which you install
(require 'init-package)

;;-----------------------------------------------------------------------------------;;
;; basic configurations
;;-----------------------------------------------------------------------------------;;
(require 'init-system-set)
(require 'init-ui)
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


;; ;;-----------------------------------------------------------------------------------;;
;; ;; config complete
;; ;;-----------------------------------------------------------------------------------;;
(require 'init-company)
(require 'init-complete-minibuffer)

;;-----------------------------------------------------------------------------------;;
;; developer tool
;;-----------------------------------------------------------------------------------;;
(require 'init-projectile)
(require 'init-dash)
(require 'init-flycheck)
(require 'init-vcs)
(require 'init-origami)  ;;code toggle


;;-----------------------------------------------------------------------------------;;
;; develope language
;;-----------------------------------------------------------------------------------;;
(require 'init-python)
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


;; ;;-----------------------------------------------------------------------------------;;
;; ;; other config
;; ;;-----------------------------------------------------------------------------------;;
;; (require 'init-popwin)
(setq custom-file (expand-file-name "lisp/custom.el" user-emacs-directory))
(load-file custom-file)
;;; init.el ends here
