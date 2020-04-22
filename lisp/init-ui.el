;;; package --- init-ui.el


;;; Commentary:
;; ui cofigure

;;; Code:

(eval-when-compile
  (require 'init-const))
;;show paren

(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)




;;-------------------------------------------------------;;
;; gui size
;;-------------------------------------------------------;;

(if (display-graphic-p)
    (progn
      (setq initial-frame-alist
	    '(
	      (width . 118);;chars
	      (height . 94);;lines
	      (left . 0);;
	      (top . 0)
	      (internal-border-width . 0)
	      (font . "monaco 15")
	      (line-spacing . 0.25)
	      ))
      (setq default-frame-alist
	    '(
	      (width . 118);;chars
	      (height . 94);;lines
	      (left . 0);;
	      (top . 0)
	      (internal-border-width . 0)
	      (font . "monaco 15")
	      (line-spacing . 0.25)
	      ))
      ;; (set-frame-parameter nil 'alpha 98)
      ))
;;-------------------------------------------------------;;
;; font
;;-------------------------------------------------------;;

;; (when sys/mac-x-p (set-default-font "monaco 15"))
;; (setq-default line-spacing 0.15)

;;-------------------------------------------------------;;
;; Title
;;-------------------------------------------------------;;

(setq frame-title-format '("April Emacs - %b")
      icon-title-format frame-title-format)
(when sys/mac-x-p
  (add-hook 'after-load-theme-hook
            (lambda ()
              (let ((bg (frame-parameter nil 'background-mode)))
                (set-frame-parameter nil 'ns-appearance bg)
                (setcdr (assq 'ns-appearance default-frame-alist) bg)))))

;;------------------------------------------------------;;
;; Icons
;;------------------------------------------------------;;
(use-package all-the-icons
  :config
  (add-to-list 'all-the-icons-icon-alist
               '("\\.org$" all-the-icons-fileicon "org" :v-adjust 0.0 :face all-the-icons-dgreen))
  (add-to-list 'all-the-icons-icon-alist
               '("\\.xpm$" all-the-icons-octicon "file-media" :v-adjust 0.0 :face all-the-icons-dgreen))
  (add-to-list 'all-the-icons-icon-alist
               '("\\.lua$" all-the-icons-fileicon "lua" :face all-the-icons-dblue))
  (add-to-list 'all-the-icons-mode-icon-alist
               '(lua-mode all-the-icons-fileicon "lua" :face all-the-icons-dblue))
  (add-to-list 'all-the-icons-icon-alist
               '("\\.go$" all-the-icons-fileicon "go" :face all-the-icons-blue))
  (add-to-list 'all-the-icons-mode-icon-alist
               '(go-mode all-the-icons-fileicon "go" :face all-the-icons-blue))
  (add-to-list 'all-the-icons-mode-icon-alist
               '(help-mode all-the-icons-faicon "info-circle" :height 1.1 :v-adjust -0.1 :face all-the-icons-purple))
  (add-to-list 'all-the-icons-mode-icon-alist
               '(Info-mode all-the-icons-faicon "info-circle" :height 1.1 :v-adjust -0.1))
  (add-to-list 'all-the-icons-icon-alist
               '("NEWS$" all-the-icons-faicon "newspaper-o" :height 0.9 :v-adjust -0.2))
  (add-to-list 'all-the-icons-icon-alist
               '("Cask\\'" all-the-icons-fileicon "elisp" :height 1.0 :v-adjust -0.2 :face all-the-icons-blue))
  (add-to-list 'all-the-icons-mode-icon-alist
               '(cask-mode all-the-icons-fileicon "elisp" :height 1.0 :v-adjust -0.2 :face all-the-icons-blue))
  (add-to-list 'all-the-icons-icon-alist
               '(".*\\.ipynb\\'" all-the-icons-fileicon "jupyter" :height 1.2 :face all-the-icons-orange))
  (add-to-list 'all-the-icons-mode-icon-alist
               '(ein:notebooklist-mode all-the-icons-faicon "book" :face all-the-icons-orange))
  (add-to-list 'all-the-icons-mode-icon-alist
               '(ein:notebook-mode all-the-icons-fileicon "jupyter" :height 1.2 :face all-the-icons-orange))
  (add-to-list 'all-the-icons-mode-icon-alist
               '(ein:notebook-multilang-mode all-the-icons-fileicon "jupyter" :height 1.2 :face all-the-icons-orange))
  (add-to-list 'all-the-icons-icon-alist
               '("\\.epub\\'" all-the-icons-faicon "book" :height 1.0 :v-adjust -0.1 :face all-the-icons-green))
  (add-to-list 'all-the-icons-mode-icon-alist
               '(nov-mode all-the-icons-faicon "book" :height 1.0 :v-adjust -0.1 :face all-the-icons-green))
  (add-to-list 'all-the-icons-mode-icon-alist
               '(gfm-mode all-the-icons-octicon "markdown" :face all-the-icons-blue))
  )
(use-package all-the-icons-ivy
  :init (all-the-icons-ivy-setup))

(use-package all-the-icons-dired
  :hook
  (dired-mode . all-the-icons-dired-mode))


;;-----------------------------------------------------;;
;; Line and Column
;;-----------------------------------------------------;;
(setq-default fill-column 80)
(setq column-number-mode t)
(setq line-number-mode t)

;;show line number
(use-package nlinum
  :hook
  (after-init . global-nlinum-mode)
  :config
  ;; (setq-default left-fringe-width  10)
  ;; (setq-default right-fringe-width  10)
  (setq nlinum-highlight-current-line t)
  (setq nlinum-format " %d ")
  )


;;-----------------------------------------------------;;
;; show time
;;-----------------------------------------------------;;
(use-package time
  ;; :ensure nil
  ;; :unless (display-graphic-p)
  :hook (after-init . display-time-mode)
  :init
  (setq display-time-24hr-format t)
  ;; (setq display-time-day-and-date t)
  )


;;-----------------------------------------------------;;
;; theme
;;-----------------------------------------------------;;
(use-package atom-one-dark-theme)
(use-package doom-themes
  :config
  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config)
  ;; Enable custom treemacs theme (all-the-icons must be installed!)
  (doom-themes-treemacs-config)

  ;; Improve treemacs icons
  (with-eval-after-load 'treemacs
    (with-eval-after-load 'all-the-icons
      (let ((all-the-icons-default-adjust 0)
	    (tab-width 1))
	(setq treemacs-icon-open-png
	      (concat
	       (all-the-icons-octicon "chevron-down" :height 0.8 :v-adjust 0.1)
	       "\t"
	       (all-the-icons-octicon "file-directory" :v-adjust 0)
	       "\t")
	      treemacs-icon-closed-png
	      (concat
	       (all-the-icons-octicon "chevron-right" :height 0.8 :v-adjust 0.1 :face 'font-lock-doc-face)
	       "\t"
	       (all-the-icons-octicon "file-directory" :v-adjust 0 :face 'font-lock-doc-face)
	       "\t"))

	;; File type icons
	(setq treemacs-icons-hash (make-hash-table :size 200 :test #'equal)
	      treemacs-icon-fallback (concat
				      "\t\t"
				      (all-the-icons-faicon "file-o" :face 'all-the-icons-dsilver :height 0.8 :v-adjust 0.0)
				      "\t")
	      treemacs-icon-text treemacs-icon-fallback)

	(dolist (item all-the-icons-icon-alist)
	  (let* ((extension (car item))
		 (func (cadr item))
		 (args (append (list (caddr item)) '(:v-adjust -0.05) (cdddr item)))
		 (icon (apply func args))
		 (key (s-replace-all '(("^" . "") ("\\" . "") ("$" . "") ("." . "")) extension))
		 (value (concat "\t\t" icon "\t")))
	    (unless (ht-get treemacs-icons-hash (s-replace-regexp "\\?" "" key))
	      (ht-set! treemacs-icons-hash (s-replace-regexp "\\?" "" key) value))
	    (unless (ht-get treemacs-icons-hash (s-replace-regexp ".\\?" "" key))
	      (ht-set! treemacs-icons-hash (s-replace-regexp ".\\?" "" key) value)))))))
  )

;;-----------------------------------------------------;;
;; modeline
;;-----------------------------------------------------;;
(use-package doom-modeline
  :ensure t
  :hook
  (after-init . doom-modeline-mode)
  :config
  (setq find-file-visit-truename t)
  ;; How tall the mode-line should be (only respected in GUI Emacs).
  (setq doom-modeline-height 20)

  ;; How wide the mode-line bar should be (only respected in GUI Emacs).
  (setq doom-modeline-bar-width 2)

  ;; Determines the style used by `doom-modeline-buffer-file-name'.
  ;;
  ;; Given ~/Projects/FOSS/emacs/lisp/comint.el
  ;;   truncate-upto-project => ~/P/F/emacs/lisp/comint.el
  ;;   truncate-from-project => ~/Projects/FOSS/emacs/l/comint.el
  ;;   truncate-with-project => emacs/l/comint.el
  ;;   truncate-except-project => ~/P/F/emacs/l/comint.el
  ;;   truncate-upto-root => ~/P/F/e/lisp/comint.el
  ;;   truncate-all => ~/P/F/e/l/comint.el
  ;;   relative-from-project => emacs/lisp/comint.el
  ;;   relative-to-project => lisp/comint.el
  ;;   file-name => comint.el
  ;;   buffer-name => comint.el<2> (uniquify buffer name)
  ;;
  ;; If you are expereicing the laggy issue, especially while editing remote files
  ;; with tramp, please try `file-name' style.
  ;; Please refer to https://github.com/bbatsov/projectile/issues/657.
  (setq doom-modeline-buffer-file-name-style 'file-name)

  ;; Whether show `all-the-icons' or not (if nil nothing will be showed).
  (setq doom-modeline-icon t)

  ;; Whether show the icon for major mode. It respects `doom-modeline-icon'.
  (setq doom-modeline-major-mode-icon t)

  ;; Display color icons for `major-mode'. It respects `all-the-icons-color-icons'.
  (setq doom-modeline-major-mode-color-icon t)

  ;; Whether display minor modes or not. Non-nil to display in mode-line.
  (setq doom-modeline-minor-modes nil)

  ;; If non-nil, a word count will be added to the selection-info modeline segment.
  (setq doom-modeline-enable-word-count nil)

  ;; If non-nil, only display one number for checker information if applicable.
  (setq doom-modeline-checker-simple-format nil)
  
  ;; Whether display perspective name or not. Non-nil to display in mode-line.
  (setq doom-modeline-persp-name nil)

  ;; Whether display `lsp' state or not. Non-nil to display in mode-line.
  (setq doom-modeline-lsp t)

  ;; Whether display github notifications or not. Requires `ghub` package.
  (setq doom-modeline-github nil)

  ;; The interval of checking github.
  (setq doom-modeline-github-interval (* 30 60))

  ;; Whether display environment version or not
  (setq doom-modeline-env-version nil)
  ;; Or for individual languages
  ;; (setq doom-modeline-env-enable-python t)
  ;; (setq doom-modeline-env-enable-ruby t)
  ;; (setq doom-modeline-env-enable-perl t)
  ;; (setq doom-modeline-env-enable-go t)
  ;; (setq doom-modeline-env-enable-elixir t)
  ;; (setq doom-modeline-env-enable-rust t)

  ;; Change the executables to use for the language version string
  ;; (setq doom-modeline-env-python-executable "python")
  ;; (setq doom-modeline-env-ruby-executable "ruby")
  ;; (setq doom-modeline-env-perl-executable "perl")
  ;; (setq doom-modeline-env-go-executable "go")
  ;; (setq doom-modeline-env-elixir-executable "iex")
  ;; (setq doom-modeline-env-rust-executable "rustc")

  ;; Whether display mu4e notifications or not. Requires `mu4e-alert' package.
  ;; (setq doom-modeline-mu4e t)

  ;; Whether display irc notifications or not. Requires `circe' package.
  ;; (setq doom-modeline-irc t)

  ;; Function to stylize the irc buffer names.
  (setq doom-modeline-irc-stylize 'identity)
  )

;;-----------------------------------------------------;;
;; tool-bar and scroll-bar
;;-----------------------------------------------------;;
(when sys/mac-x-p (menu-bar-mode -1))
(tool-bar-mode -1) 
(when (or sys/mac-x-p sys/win32p) (scroll-bar-mode -1))
(setq scroll-step 1
      scroll-margin 0
      scroll-conservatively 100000)
;;-----------------------------------------------------;;
;; window numbering
;;-----------------------------------------------------;;
(use-package window-numbering
  :demand window-numbering
  :ensure t
  :hook
  (after-init . window-numbering-mode))

(provide 'init-ui)
;;; init-ui ends here
