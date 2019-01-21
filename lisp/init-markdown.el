(use-package markdown-mode
  :ensure t
  :mode (
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown")
  :config
(use-package gh-md
  :bind (:map markdown-mode-map ("C-c r" . gh-md-render-buffer)))
(use-package pandoc
  :hook
  (markdown-mode . pandoc-mode))
)
(provide 'init-markdown)
