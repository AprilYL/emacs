;;; package --- init-markdown.el.

;;; Commentary:
;; markdown configurations
;; reference seagle0128's emacs configure
;;; Code:
(eval-when-compile
  (require 'init-const))
(use-package markdown-mode
  :ensure t
  :mode (("README\\.md\\'" . gfm-mode)
	 ("\\.md\\'" . markdown-mode)
	 ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "pandoc")
  :config
  (use-package gh-md
    :bind (:map markdown-mode-map ("C-c r" . gh-md-render-buffer)))
  (use-package pandoc
    :hook
    (markdown-mode . pandoc-mode)
    :config
    ((add-hook 'pandoc-mode-hook 'pandoc-load-default-settings)
     ))
  (when sys/macp
    (let ((typora "/Applications/Typora.app/Contents/MacOS/Typora"))
      (if (file-exists-p typora)
	  (setq markdown-open-command typora))))
  )
(provide 'init-markdown)
;;; init-markdown.el ends here
