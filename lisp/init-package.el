;;; package  --- use-package configurations ;

;;; Commentary:
;;use-package is the basic package of this Emacs configurations

;;; Code:
;;-----------------------------------------------------------------------------------;;
;; Cask
;;-----------------------------------------------------------------------------------;;
(require 'cl-lib)
(require 'cask "/Users/april/.cask/cask.el")
(cask-initialize)
(require 'pallet)
(pallet-mode t)

;;-----------------------------------------------------------------------------------;;
;; use-package
;;-----------------------------------------------------------------------------------;;

;; Following line is not needed if use-package.el is in ~/.emacs.d
(require 'use-package)
(use-package diminish
  :ensure t)
(use-package bind-key
  :ensure t)

;;-----------------------------------------------------------------------------------;;
;; auto update package
;;-----------------------------------------------------------------------------------;;
;; (use-package auto-package-update
;;   :config
;;   (setq auto-package-update-delete-old-versions t)
;;   (setq auto-package-update-hide-results t)
;;   (auto-package-update-maybe))

(provide 'init-package)
;;; init-package.el ends here
