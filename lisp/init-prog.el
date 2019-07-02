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
(use-package caks-mode)
(use-package vimrc-mode)
(use-package glsl-mode
  :mode "\\.\\([fvg]s\\|vert\\|tesc\\|tese\\|geom\\|frag\\|comp\\)$"
  :config
  (use-package company-glsl
    :init
    :config
    (add-hook 'glsl-mode (lambda()
			   (set (make-local-variable 'company-backends)'(company-glsl))))
    ))
(provide 'init-prog)
;;; init-prog.el ends here
