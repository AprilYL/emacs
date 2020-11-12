;;; init-company.el --- Initialize company configurations.
;;; Commentary:
;;
;; Auto-completion configurations.
;;

;;; Code:
;;config origami
(use-package origami
  :functions origami-hydra/body
  :hook
  (prog-mode . origami-mode)
  :pretty-hydra
  ((:color blue :hint none)
   ("all node"
    (
     ("o" origami-open-node "open-node")
     ("c" origami-close-node "close-node")
     ("t" origami-toggle-node "toggle-node")
     )
    "one node"
    (
     ("T" origami-toggle-all-nodes "toggle-all-node")
     ("O" origami-open-all-nodes "open-all-node")
     ("C" origami-close-all-nodes "close-all-node")
     )
    )
   )
  )
(provide 'init-origami)
;;; init-origami ends here

