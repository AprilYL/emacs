(require 'ivy)
(add-hook 'after-init-hook 'ivy-mode)

(with-eval-after-load 'ivy  (setq-default ivy-use-virtual-buffers t
					  ivy-virtual-abbreviate 'fullpath
					  ivy-count-format ""
					  projectile-completion-system 'ivy
					  ivy-magic-tilde nil
					  ivy-dynamic-exhibit-delay-ms 150
					  ivy-initial-inputs-alist
					  '((Man-completion-table . "^")
					    (woman . "^"))))
(require 'counsel)
(add-hook 'after-init-hook 'counsel-mode)
(require 'swiper)


(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)
(global-set-key (kbd "C-h l") 'counsel-find-library)
(global-set-key (kbd "C-h i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "C-h u") 'counsel-unicode-char)
(global-set-key (kbd "C-c g") 'counsel-git)
(global-set-key (kbd "C-c j") 'counsel-git-grep)
(global-set-key (kbd "C-c k") 'counsel-ag)
(global-set-key (kbd "C-x l") 'counsel-locate)
(global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
(define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)
(provide 'init-complete-minibuffer)
