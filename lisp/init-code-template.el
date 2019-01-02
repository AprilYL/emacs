;; To load code template
(setq cur-file (buffer-name))
(setq cur-date (org-read-date))  
(setq cur-author "Lin Yang")
(setq cur-Email "Yanglin1@supcon.com")
(defun april/insert-python-header()
  (interactive)
  (insert "# !/usr/bin/env python3.6\n")
  (insert "# -*- coding: utf-8 -*-\n")
  (insert "# Filename:  " cur-file "\n")
  (insert "# Create by " cur-author "at" cur-date "\n")
  (insert "# Email Adress: %s\n" cur-Email "\n")
  )

(april/insert-python-header)
(message (buffer-name))



(provide 'init-code-template)
