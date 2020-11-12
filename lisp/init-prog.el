;;; init-prog.el --- program configuration

;;; Commentary:

;; Copyright (C) 2019  杨霖

;; Author: 杨霖 <april@yanglins-MBP>
;;; Code:

(use-package editorconfig
  :diminish editorconfig-mode
  :hook
  (after-init. editorconfig-mode))

(use-package quickrun
  :bind ("s-r" . quickrun))
(use-package cask-mode)
(use-package vimrc-mode)
(provide 'init-prog)
;;; init-prog.el ends here
