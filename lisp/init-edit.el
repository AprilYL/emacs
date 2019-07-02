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
                            (aggressive-indent-mode -1)))))
  :config
  ;; Disable in some modes
  (dolist (mode '(asm-mode web-mode html-mode css-mode robot-mode))
    (push mode aggressive-indent-excluded-modes))

  ;; Be slightly less aggressive in C/C++/C#/Java/Go/Swift
  ;; (add-to-list
  ;;  'aggressive-indent-dont-indent-if
  ;;  '(and (or (derived-mode-p 'c-mode)
  ;;            (derived-mode-p 'c++-mode)
  ;;            (derived-mode-p 'csharp-mode)
  ;;            (derived-mode-p 'java-mode)
  ;;            (derived-mode-p 'go-mode)
  ;;            (derived-mode-p 'swift-mode))
  ;;        (null (string-match "\\([;{}]\\|\\b\\(if\\|for\\|while\\)\\b\\)"
  ;;                            (thing-at-point 'line))))))
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
  :functions smartparens-hydra/body create-newline-and-enter-sexp
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
  (sp-local-pair 'c++-mode "{" nil :post-handlers '((create-newline-and-enter-sexp "RET")
						    (create-newline-and-enter-sexp "<return>")))
  (defhydra smartparens-hydra (:color blue :hint none )
    "
^navigation^                      ^edit^
^^────────────────────────────────^^───────────────
_f_: forward-sexp                 _d_: delete-sexp
_b_: backward-sexp                _x_: kill-sexp
_k_: up-sexp                      _r_: transpose-sexp
_j_: down-sexp                    _c_: copy-sexp
_p_: previous-sexp		  _q_: quit
_n_: next-sexp
_a_: beginning-of-sexp
_e_: end-of-sexp
"
    ("f" sp-forward-sexp "forward-sexp")
    ("b" sp-backward-sexp "backward-sexp")
    ("k" sp-up-sexp "up-sexp")
    ("j" sp-down-sexp "down-sexp")
    ("p" sp-previous-sexp "previous-sexp")
    ("n" sp-next-sexp "next-sexp")
    ("a" sp-beginning-of-sexp "beginning-of-sexp")
    ("e" sp-end-of-sexp "end-of-sexp")
    ("d" 'sp-unwrap-sexp "delete-sexp")
    ("x" sp-kill-sexp "kill-sexp")
    ("r" sp-transpose-sexp "transpose-sexp")
    ("c" sp-copy-sexp "copy-sexp")
    ("q" nil "quit")
    )
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
  :config
  (make-variable-buffer-local 'undo-tree-visualizer-diff)
  )

;; On-the-fly spell checker
(use-package flyspell
  :ensure nil
  :diminish
  :if (executable-find "aspell")
  :hook (((text-mode outline-mode) . flyspell-mode)
         (prog-mode . flyspell-prog-mode)
         (flyspell-mode . (lambda ()
                            (dolist (key '("C-;" "C-," "C-."))
                              (unbind-key key flyspell-mode-map)))))
  :init
  (setq flyspell-issue-message-flag nil)
  (setq ispell-program-name "aspell")
  (setq ispell-extra-args '("--sug-mode=ultra" "--lang=en_US" "--run-together")))

;; enable delete select
(delete-selection-mode t)
(provide 'init-edit)

(use-package multiple-cursors
  :functions hydra-multiple-cursors/body
  :bind
  ("M-u" . hydra-multiple-cursors/body)
  :preface
  ;; insert specific serial number
  (defvar ladicle/mc/insert-numbers-hist nil)
  (defvar ladicle/mc/insert-numbers-inc 1)
  (defvar ladicle/mc/insert-numbers-pad "%01d")

  (defun ladicle/mc/insert-numbers (start inc pad)
    "Insert increasing numbers for each cursor specifically."
    (interactive
     (list (read-number "Start from: " 0)
           (read-number "Increment by: " 1)
           (read-string "Padding (%01d): " nil ladicle/mc/insert-numbers-hist "%01d")))
    (setq mc--insert-numbers-number start)
    (setq ladicle/mc/insert-numbers-inc inc)
    (setq ladicle/mc/insert-numbers-pad pad)
    (mc/for-each-cursor-ordered
     (mc/execute-command-for-fake-cursor
      'ladicle/mc--insert-number-and-increase
      cursor)))

  (defun ladicle/mc--insert-number-and-increase ()
    (interactive)
    (insert (format ladicle/mc/insert-numbers-pad mc--insert-numbers-number))
    (setq mc--insert-numbers-number (+ mc--insert-numbers-number ladicle/mc/insert-numbers-inc)))

  :config
  (with-eval-after-load 'hydra
    (defhydra hydra-multiple-cursors (:color pink :hint nil)
      "
                                                                        ╔════════╗
    Point^^^^^^             Misc^^            Insert                            ║ Cursor ║
  ──────────────────────────────────────────────────────────────────────╨────────╜
     _k_    _K_    _M-k_    [_l_] edit lines  [_i_] 0...
     ^↑^    ^↑^     ^↑^     [_m_] mark all    [_a_] letters
    mark^^ skip^^^ un-mk^   [_s_] sort        [_n_] numbers
     ^↓^    ^↓^     ^↓^
     _j_    _J_    _M-j_
  ╭──────────────────────────────────────────────────────────────────────────────╯
                           [_q_]: quit, [Click]: point
"
      ("l" mc/edit-lines :exit t)
      ("m" mc/mark-all-like-this :exit t)
      ("j" mc/mark-next-like-this)
      ("J" mc/skip-to-next-like-this)
      ("M-j" mc/unmark-next-like-this)
      ("k" mc/mark-previous-like-this)
      ("K" mc/skip-to-previous-like-this)
      ("M-k" mc/unmark-previous-like-this)
      ("s" mc/mark-all-in-region-regexp :exit t)
      ("i" mc/insert-numbers :exit t)
      ("a" mc/insert-letters :exit t)
      ("n" ladicle/mc/insert-numbers :exit t)
      ("<mouse-1>" mc/add-cursor-on-click)
      ;; Help with click recognition in this hydra
      ("<down-mouse-1>" ignore)
      ("<drag-mouse-1>" ignore)
      ("q" nil))))

;; (use-package autoinsert
;;   :ensure t
;;   :config(setq auto-insert-query nil)
;;   (setq auto-insert-directory (locate-user-emacs-file "template"))
;;   (add-hook 'find-file-hook 'auto-insert)
;;   (auto-insert-mode t))

;;; init-edit ends here
