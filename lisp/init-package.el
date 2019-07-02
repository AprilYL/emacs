;;; package  --- use-package configurations ;

;;; Commentary:
;;use-package is the basic package of this Emacs configurations

;;; Code:
;;-----------------------------------------------------------------------------------;;
;; Cask
;;-----------------------------------------------------------------------------------;;
(package-initialize)
(require 'cask "~/.cask/cask.el")
(cask-initialize)
(require 'pallet)
(pallet-mode t)

;;-----------------------------------------------------------------------------------;;
;; use-package
;;-----------------------------------------------------------------------------------;;

;; Following line is not needed if use-package.el is in ~/.emacs.d
(require 'cl)
(require 'use-package)
(use-package diminish
  :ensure t)
(use-package bind-key
  :ensure t)

;;-----------------------------------------------------------------------------------;;
;; auto update package
;;-----------------------------------------------------------------------------------;;
(use-package auto-package-update
  :custom
  (auto-package-update-delete-old-version t)
  (auto-package-update-hide-result t)
  :config
  (auto-package-update-maybe)
  )
(provide 'init-package)
;;; init-package.el ends here
