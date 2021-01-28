;;; init-navigation.el --- code navigation configuration

;;; Commentary:

;; Copyright (C) 2019  杨霖

;; Author: 杨霖 <april@yanglins-MBP>
;;; Code

;; Jump to definition via `ag'/`rg'/`grep'
(use-package dumb-jump
  :init
  (add-hook 'xref-backend-functions #'dumb-jump-xref-activate)
  :hook (after-init . dumb-jump-mode)
  :pretty-hydra
  ((:title "dumb-jump" :color teal)
   ("Jump go"
    (("j" dumb-jump-go "Go")
     ("l" dumb-jump-quick-look "Quick look"))
    "Jump to other"
    (("o" dumb-jump-go-other-window "Go other window")
     ("x" dumb-jump-go-prefer-external-other-window "Go external other window"))
    "prefer"
    (
     ("e" dumb-jump-go-prefer-external "Go external")
     ("i" dumb-jump-go-prompt "Prompt")
     )
    "Other"
    (
     ("b" dumb-jump-back "Back")
     ("q" nil "quit"))
    )
   )
  :config
  (setq dumb-jump-prefer-searcher 'rg)
  (with-eval-after-load 'ivy
    (setq dumb-jump-selector 'ivy))
  )

  (use-package goto-chg
    :bind ("C-," . goto-last-change))
(use-package ace-jump-mode
  :ensure t
  :pretty-hydra
  ((:color teal :quit-key "q")
   ("action"
    (("w" ace-jump-word-mode "word-mode")
     ("c" ace-jump-char-mode "char-mode"))))
  )
(provide 'init-navigation.el)
;;; init-navigation.el ends here
