;;; init-navigation.el --- code navigation configuration

;;; Commentary:

;; Copyright (C) 2019  杨霖

;; Author: 杨霖 <april@yanglins-MBP>
;;; Code

;; Jump to definition via `ag'/`rg'/`grep'
(use-package dumb-jump
  :functions dumb-jump-hydra/body
  :hook (after-init . dumb-jump-mode)
  :config
  (setq dumb-jump-prefer-searcher 'rg)
  (with-eval-after-load 'ivy
    (setq dumb-jump-selector 'ivy))

  (defhydra hydra-dumb-jump (:color blue :hint none)
    "
^Jump^                            ^Other^
^^────────────────────────────────^^───────────────
_j_: Go                           _i_: Prompt
_o_: Go other window              _l_: Quick look
_e_: Go external                  _b_: Back
_x_: Go external other window
"
    ("j" dumb-jump-go "Go")
    ("o" dumb-jump-go-other-window "Go other window")
    ("e" dumb-jump-go-prefer-external "Go external")
    ("x" dumb-jump-go-prefer-external-other-window "Go external other window")
    ("i" dumb-jump-go-prompt "Prompt")
    ("l" dumb-jump-quick-look "Quick look")
    ("b" dumb-jump-back "Back")
    ("q" nil "quit"))
  )
(use-package goto-chg
  :bind ("C-," . goto-last-change))
(provide 'init-navigation.el)
;;; init-navigation.el ends here
