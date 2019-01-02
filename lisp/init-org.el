(use-package org
  :mode
  ("\\.org\\'" . org-mode)
  :bind
  (:map org-mode-map ("C-c a" . org-agenda)
	("C-c r" . org-capture)
	)
  :config
   (org-babel-do-load-languages
    `org-babel-load-languages
    `((emacs-lisp .t)
      (python . t)
      (ruby . t)
      (java . t)
  ))
  )
 
(provide 'init-org)

