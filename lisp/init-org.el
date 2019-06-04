;;; package  --- init-org;

;;; Commentary:
;; org config
;;; Code:
(use-package org
  :mode
  ("\\.org\\'" . org-mode)
  :hook
  ;;; display/update images in the buffer after I evaluate
  (add-hook 'org-babel-after-execute-hook 'org-redisplay-inline-images 'append)
  :bind
  (:map org-mode-map ("C-c a" . org-agenda)
	("C-c r" . org-capture)
	("C-c C-c" . (lambda ()
		       (interactive)
		       (org-ctrl-c-ctrl-c)
		       (org-display-inline-images)))
	)
  :config
  (setq org-startup-with-inline-images t)
  (org-babel-do-load-languages
   `org-babel-load-languages
   `((emacs-lisp .t)
     (ipython . t)
     (python . t)
     (ruby . t)
     (java . t)
     (C . t)
     (ipython . t)
     (R .t)
     ))
  (setq org-confirm-babel-evaluate nil) ;don't prompt me to confirm everytime I want to evaluate a block
  
  (setq org-agenda-files (list "~/Documents/Org/work/work.org"
			       "~/Documents/Org/person/person.org"
			       ))
  )

(use-package org-bullets
  :hook
  (org-mode . org-bullets-mode))

(use-package ox-pandoc
  :config
  (setq org-pandoc-options '((standalone . t)))
  (setq org-pandoc-options-for-latex-pdf '((pdf-engine . "pdflatex")))
  ;; special extensions for markdown_github output
  (setq org-pandoc-format-extensions '(markdown_github+pipe_tables+raw_html))
  )
(provide 'init-org)
;;; init-org ends here
