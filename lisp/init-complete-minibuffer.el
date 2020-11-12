;;; package --- init-complete-minibuffer.el

;;; Commentary:

;; complete minibuffer cofigure

;;; Code:
(use-package counsel
  :demand counsel
  :hook
  (after-init . counsel-mode))

(use-package swiper
  :bind
  ("C-s" . swiper))

(use-package ivy
  :demand ivy
  :hook
  (after-init . ivy-mode)
  :after (counsel swiper)
  :config
  (setq-default ivy-use-virtual-buffers t
		ivy-virtual-abbreviate 'fullpath
		ivy-count-format ""
		projectile-completion-system 'ivy
		ivy-magic-tilde nil
		ivy-dynamic-exhibit-delay-ms 150
		ivy-initial-inputs-alist
		'((Man-completion-table . "^")
		  (woman . "^")))
  )

(use-package ivy-yasnippet
  )

(provide 'init-complete-minibuffer)
;;; init-complete-minibuffer ends here
