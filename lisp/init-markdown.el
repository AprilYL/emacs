;;; package --- init-markdown.el.

;;; Commentary:
;; markdown configurations
;; reference seagle0128's emacs configure
;;; Code:
(use-package markdown-mode
  :ensure t
  :mode (("README\\.md\\'" . gfm-mode)
		 ("\\.md\\'" . markdown-mode)
		 ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "pandoc")
  :hook
  (markdown-mode . (lambda() (set (make-local-variable 'company-backends)
								  '((company-ispell company-capf ) (company-files company-yasnippet)))))
  :bind (:map markdown-mode-map ("TAB" . markdown-cycle))
  :config
  (setq tab-width 4)
  (use-package gh-md
    :bind (:map markdown-mode-map ("C-c r" . gh-md-render-buffer)))
  ;; (use-package pandoc
  ;;   :hook
  ;;   (markdown-mode . pandoc-mode)
  ;;   :config
  ;;   ((add-hook 'pandoc-mode-hook 'pandoc-load-default-settings)
  ;;    ))
  (when sys/macp
    (let ((typora "/Applications/Typora.app/Contents/MacOS/Typora"))
      (if (file-exists-p typora)
		  (setq markdown-open-command typora))))
  (setq markdown-enable-html 1)
  (setq markdown-enable-math 1)
  )
(use-package markdown-toc
  :ensure t)
(use-package markdown-preview-mode
  :ensure t
  :config
  (add-to-list 'markdown-preview-stylesheets "https://raw.githubusercontent.com/richleland/pygments-css/master/emacs.css")
  (add-to-list 'markdown-preview-javascript '("http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-MML-AM_CHTML" . async))
  (add-to-list 'markdown-preview-stylesheets "https://raw.githubusercontent.com/richleland/pygments-css/master/emacs.css")
  )
(provide 'init-markdown)
;;; init-markdown.el ends here
