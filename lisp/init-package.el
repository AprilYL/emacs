;;; package  --- use-package configurations ;

;;; Commentary:
;;use-package is the basic package of this Emacs configurations

;;; Code:

;;-----------------------------------------------------------------------------------;;
;; Cask
;;-----------------------------------------------------------------------------------;;
(require 'cask "~/.cask/cask.el")
(cask-initialize)
(require 'pallet)
(pallet-mode t)
(require 'cl)

;;-----------------------------------------------------------------------------------;;
;; use-package
;;-----------------------------------------------------------------------------------;;

  ;; Following line is not needed if use-package.el is in ~/.emacs.d
(require 'use-package)
(require 'diminish)
(require 'bind-key)
(provide 'init-package)
;;; init-package.el ends here
