;;; package --- init-ui.el

;;; Commentary:

;; flycheck cofigure

;;; Code:
(use-package flycheck
  :demand flycheck
  :hook (after-init . global-flycheck-mode)
  )
(use-package ispell
  )
(use-package auto-dictionary
  :hook
  (flyspell-mode . (lambda () (auto-dictionary-mode 1))))
(use-package flyspell-correct
  :after flyspell
  :pretty-hydra
  ((:color teal :quit-key "q")
   ("Correct"
    (
     ("p" flyspell-correct-previous "correct previous")
     ("n" flyspell-correct-next "correct next")
     ("w" flyspell-correct-wrapper "correct wrapper")
     ("c" flyspell-correct-at-point "correct at point")
     )
    )
   )
  )
(use-package flyspell-correct-helm
  :after flyspell-correct)

(provide 'init-flycheck) 
;;; init-flycheck ends here
