(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   (vector "#ffffff" "#f36c60" "#8bc34a" "#fff59d" "#4dd0e1" "#b39ddb" "#81d4fa" "#263238"))
 '(company-dabbrev-minimum-length 2)
 '(company-dabbrev-time-limit 0.05)
 '(company-idle-delay 0.05)
 '(company-minimum-prefix-length 1)
 '(company-tern-meta-as-single-line t)
 '(company-tooltip-idle-delay 0)
 '(compilation-message-face (quote default))
 '(custom-safe-themes
   (quote
    ("bf5bdab33a008333648512df0d2b9d9710bdfba12f6a768c7d2c438e1092b633" "f0dc4ddca147f3c7b1c7397141b888562a48d9888f1595d69572db73be99a024" "100e7c5956d7bb3fd0eebff57fde6de8f3b9fafa056a2519f169f85199cc1c96" "6b2636879127bf6124ce541b1b2824800afc49c6ccd65439d6eb987dbf200c36" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "bd7b7c5df1174796deefce5debc2d976b264585d51852c962362be83932873d9" "a24c5b3c12d147da6cef80938dca1223b7c7f70f2f382b26308eba014dc4833a" default)))
 '(doom-treemacs-line-spacing 0.1)
 '(elpy-modules
   (quote
    (elpy-module-company elpy-module-eldoc elpy-module-flymake elpy-module-pyvenv elpy-module-highlight-indentation elpy-module-yasnippet elpy-module-django elpy-module-autodoc elpy-module-sane-defaults)))
 '(evil-indent-convert-tabs nil)
 '(evil-leader/leader "SPC")
 '(fci-rule-color "#37474f")
 '(highlight-changes-colors (quote ("#FD5FF0" "#AE81FF")))
 '(highlight-tail-colors
   (quote
    (("#3C3D37" . 0)
     ("#679A01" . 20)
     ("#4BBEAE" . 30)
     ("#1DB4D0" . 50)
     ("#9A8F21" . 60)
     ("#A75B00" . 70)
     ("#F309DF" . 85)
     ("#3C3D37" . 100))))
 '(hl-sexp-background-color "#1c1f26")
 '(initial-scratch-message "
")
 '(jdee-db-active-breakpoint-face-colors (cons "#1B2229" "#51afef"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#1B2229" "#98be65"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#1B2229" "#3f444a"))
 '(magit-diff-use-overlays nil)
 '(markdown-command "pandoc")
 '(markdown-enable-math t)
 '(package-selected-packages
   (quote
    (company-anaconda company-jedi elpy haml-mode magit-popup package-build transient with-editor lispy 2048-game all-the-icons find-file-in-project atom-one-dark-theme diminish ein hlinum dash hydra load-relative loc-changes tablist test-simple virtualenvwrapper gitconfig gitattributes-mode browse-at-remote git-messenger magit-todos magit-svn magit-gitflow forge volatile-highlights diff-hl highlight-indent-guides symbol-overlay treemacs-icons-dired treemacs-magit treemacs-evil treemacs-projectile treemacs live-py-mode yapfify mocha-snippets php-mode web-beautify mocha css-eldoc scss-mode smart-region aggressive-indent dashboard company-box company-c-headers modern-cpp-font-lock doom-modeline doom-themes rainbow-delimiters python-mode realgud google-c-style autodisass-java-bytecode tide xref-js2 tern-auto-complete yaml-mode js-comint prettier-js company-web emmet-mode neotree avy simple-httpd monokai-theme evil-surroud async f ghub git-commit helm ivy page-break-lines ox-gfm ob-ipython dockerfile-mode docker meghanada python-docstring color-moccur ace-window helm-projectile helm-descbinds dumb-jump 0blayout emacs-material-theme material-theme py-autopep8 projectile git-timemachine gitconfig-mode gitignore-mode git-blamed magit pipenv pyenv pyvenv pandoc-mode gh-md whitespace-cleanup-mode markdown-mode default-text-scale origami ensime dash-at-point csv-mode company-quickhelp typescript-mode ob-coffeescript coffee-mode json-mode company-tern skewer-less auto-complete-nxml mmm-mode sass-mode rainbow-mode pip-requirements use-package goto-chg helm-core multiple-cursors pkg-info popup pythonic s shut-up undo-tree company hungry-delete swiper counsel smartparens js2-mode nodejs-repl exec-path-from-shell popwin reveal-in-osx-finder anaconda-mode web-mode js2-refactor expand-region iedit org-pomodoro helm-ag flycheck auto-yasnippet evil evil-leader window-numbering powerline evil-surround evil-nerd-commenter pallet which-key)))
 '(pandoc-use-async nil)
 '(pos-tip-background-color "#FFFACE")
 '(pos-tip-foreground-color "#272822")
 '(powerline-default-separator (quote wave))
 '(powerline-display-buffer-size t)
 '(prog-mode-hook (quote (rainbow-delimiters-mode origami-mode)))
 '(projectile-find-dir-includes-top-level t)
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#f36c60")
     (40 . "#ff9800")
     (60 . "#fff59d")
     (80 . "#8bc34a")
     (100 . "#81d4fa")
     (120 . "#4dd0e1")
     (140 . "#b39ddb")
     (160 . "#f36c60")
     (180 . "#ff9800")
     (200 . "#fff59d")
     (220 . "#8bc34a")
     (240 . "#81d4fa")
     (260 . "#4dd0e1")
     (280 . "#b39ddb")
     (300 . "#f36c60")
     (320 . "#ff9800")
     (340 . "#fff59d")
     (360 . "#8bc34a"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (quote
    (unspecified "#272822" "#3C3D37" "#F70057" "#F92672" "#86C30D" "#A6E22E" "#BEB244" "#E6DB74" "#40CAE4" "#66D9EF" "#FB35EA" "#FD5FF0" "#74DBCD" "#A1EFE4" "#F8F8F2" "#F8F8F0"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((((class color) (min-colors 257)) (:foreground "#F8F8F2" :background "#272822")) (((class color) (min-colors 89)) (:foreground "#F5F5F5" :background "#1B1E1C"))))
 '(diff-hl-change ((t (:background "#46D9FF"))))
 '(diff-hl-delete ((t (:background "#ff6c6b"))))
 '(diff-hl-insert ((t (:background "#98be65"))))
 '(hl-line ((t (:height 1.1))))
 '(linum-highlight-face ((t (:inherit (quote default) :background "White" :foreground "Black"))))
 '(minibuffer-prompt ((t (:foreground "#9DA5B4" :height 1.25)))))

(provide 'custom)
