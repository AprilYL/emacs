;;;Commentary: this file is configure some basic function

;;close ring bell  when is scroll to the end
(setq ring-bell-function 'ignore)

;;file always refresh automatically,
(global-auto-revert-mode t)

(global-linum-mode t)

(setq make-backup-files nil)

(setq auto-save-default nil)

(setq recentf-max-menu-item 25)

(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

(defun indent-buffer ()
  (interactive)
  (indent-region (point-min) (point-max)))

(defun indent-region-or-buffer ()
  (interactive)
  (save-excursion
    (if (region-active-p)
	(progn
	  (indent-region (region-beginning) (region-end))
	  (message "Indented select region."))
      (progn
	(indent-buffer)
	(message "Indented buffer.")))))


(delete-selection-mode t)

(setq hippie-expand-try-function-list '(try-expand-debbrev
					try-expand-debbrev-all-buffers
					try-expand-debbrev-from-kill
					try-complete-file-name-partially
					try-complete-file-name
					try-expand-all-abbrevs
					try-expand-list
					try-expand-line
					try-complete-lisp-symbol-partially
					try-complete-lisp-symbol))
(fset 'yes-or-no-p 'y-or-n-p)




(define-advice show-paren-function (:around (fn) fix-show-paren-function)
  "Highlight enclosing parens"
  (cond ((looking-at-p "\\s(") (funcall fn))
	(t (save-excursion
	     (ignore-errors (backward-up-list))
	     (funcall fn)))))

(defun hidden-dos-eol()
  (interactive)
  (setq buffer-display-table) (make-display-table)
  (aset buffer-display-table ?\^M []))

(defun remove-dos-eol()
  (interactive)
  (goto-char (point-min))
  (while (search-forward "\r" nil t)
    (replace-match "")))

(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)

(provide 'init-better-default)
    

