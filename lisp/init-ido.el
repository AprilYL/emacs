;;; package --- ido
;;; Commentary:
;;; summary
;;; configure ido
;;; Code:
(use-package ido
:config
  (ido-mode t)
  ;; (ido-everywhere 1)
  (setq ido-use-virtual-buffers t)
  (setq ido-use-filename-at-point 'guess)
  (setq ido-create-new-buffer 'always)
  (setq ido-enable-flex-matching t)
  )

(provide 'init-ido)
;;; init-ido.el
