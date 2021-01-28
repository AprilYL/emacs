;; init-edit.el --- Initialize editing configurations.
;;; Commentary:
;;
;; Editing configurations.
;;

;;; Code:


;; Minor mode to aggressively keep your code always indented
(use-package aggressive-indent
  :diminish
  :hook ((after-init . global-aggressive-indent-mode)
         ;; FIXME: Disable in big files due to the performance issues
         ;; https://github.com/Malabarba/aggressive-indent-mode/issues/73
         (find-file . (lambda ()
                        (if (> (buffer-size) (* 3000 80))
                            (aggressive-indent-mode -1))))
	 )
)

;; Edit multiple regions in the same way simultaneously
(use-package iedit
  :defines desktop-minor-mode-table
  :bind (("C-;" . iedit-mode)
         ("C-x r RET" . iedit-rectangle-mode)
         :map isearch-mode-map ("C-;" . iedit-mode-from-isearch)
         :map esc-map ("C-;" . iedit-execute-last-modification)
         :map help-map ("C-;" . iedit-mode-toggle-on-function))
  :config
  ;; Avoid restoring `iedit-mode'
  (with-eval-after-load 'desktop
    (add-to-list 'desktop-minor-mode-table
                 '(iedit-mode nil))))

;; Increase selected region by semantic units
(use-package expand-region
  :bind ("C-=" . er/expand-region))

;; Smartly input parens
(use-package smartparens
  :pretty-hydra
  (
   (:title "smartparens " :color blue :quit-when-no-cand 1)
   ("navigation"
    (
     ("f" sp-forward-sexp "forward-sexp")
     ("b" sp-backward-sexp "backward-sexp")
     ("k" sp-up-sexp "up-sexp")
     ("j" sp-down-sexp "down-sexp")
     ("p" sp-previous-sexp "previous-sexp")
     ("n" sp-next-sexp "next-sexp")
     ("a" sp-beginning-of-sexp "beginning-of-sexp")
     ("e" sp-end-of-sexp "end-of-sexp"))
    "edit"
    (("d" sp-unwrap-sexp "delete-sexp")
     ("x" sp-kill-sexp "kill-sexp")
     ("r" sp-transpose-sexp "transpose-sexp")
     ("c" sp-copy-sexp "copy-sexp"))
    ))
  :hook
  (after-init . smartparens-global-mode)
  :config
  (use-package smartparens-config
    :ensure smartparens
    :config
    (progn (show-smartparens-global-mode t))
    )
  (defun create-newline-and-enter-sexp (&rest _ignored)
    (newline)
    (indent-according-to-mode)
    (forward-line -1)
    (indent-according-to-mode))
  (sp-local-pair 'emacs-lisp-mode "'" nil :actions nil)
  (sp-local-pair 'emacs-lisp-mode "`" nil :actions nil)
  (sp-local-pair 'markdown-mode "_" nil :actions nil)
  (sp-local-pair 'org-mode "/" nil :actions nil)
  (sp-local-pair 'org-mode "=" nil :actions nil)
  (sp-local-pair 'c++-mode "{" nil :post-handlers '((create-newline-and-enter-sexp "RET")
  						    (create-newline-and-enter-sexp "<return>")))
  )

;; Hungry deletion
(use-package hungry-delete
  :diminish
  :hook (after-init . global-hungry-delete-mode)
  :config (setq-default hungry-delete-chars-to-skip " \t\f\v"))

;; Treat undo history as a tree
(use-package undo-tree
  :diminish
  :hook (after-init . global-undo-tree-mode)
  :init (setq undo-tree-visualizer-timestamps t
	      undo-tree-visualizer-diff t
	      undo-tree-enable-undo-in-region nil
	      undo-tree-auto-save-history nil
	      undo-tree-history-directory-alist `(("." . ,(locate-user-emacs-file "undo-tree-hist/"))))
  )

;; enable delete select
(delete-selection-mode t)

(provide 'init-edit)
;;; init-edit ends here
