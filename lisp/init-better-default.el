;; init-better-default.el --- Initialize emacs basic configurations.
;;; Commentary:
;;
;; Python configurations.
;;

;;; Code:

;;close ring bell  when is scroll to the end
(setq ring-bell-function 'ignore)

;;file always refresh automatically,
(global-auto-revert-mode t)

;;close  auto generate backup
(setq make-backup-files nil)

;;close auto save buffer
(setq auto-save-default nil)

;;limit recentf file number
(setq recentf-max-menu-item 25)

;;show paren
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

(defun indent-buffer ()
  (interactive)
  (indent-region (point-min) (point-max)))

;; show the paren
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

;; enable delete select 
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



;; show paren
(define-advice show-paren-function (:around (fn) fix-show-paren-function)
  "Highlight enclosing parens"
  (cond ((looking-at-p "\\s(") (funcall fn))
	(t (save-excursion
	     (ignore-errors (backward-up-list))
	     (funcall fn)))))


;; dos file configure
(defun hidden-dos-eol()
  (interactive)
  (setq buffer-display-table) (make-display-table)
  (aset buffer-display-table ?\^M []))

(defun remove-dos-eol()
  (interactive)
  (goto-char (point-min))
  (while (search-forward "\r" nil t)
    (replace-match "")))

;;configure encode
(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)

(provide 'init-better-default)
    

