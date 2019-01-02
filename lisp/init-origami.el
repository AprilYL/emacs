;;config origami
(use-package origami
  :commands origami-mode
  :config
  (add-hook 'prog-mode-hook 'origami-mode)
  (define-key origami-mode-map (kbd "C-c f")  'origami-recursively-toggle-node)
   (define-key origami-mode-map (kbd "C-c f")  'origami-toggle-all-nodes)
   (define-key origami-mode-map (kbd "C-c o")  'origami-open-node)
   (define-key origami-mode-map (kbd "C-c a")  'origami-open-all-nodes)
   )

(provide 'init-origami)

