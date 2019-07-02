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
  :config
  (defhydra origami-hydra (:color blue :hint none)
    "
^all^                     ^one^
^^────────────────────────^^─────────────────────
_o_: open-node            _O_: open-all-node
_c_: close-node           _C_: close-all-node
_t_: toggle-node          _T_: toggle-all-node
^^────────────────────────^^─────────────────────
_q_: quit
"
    ("t" origami-toggle-node "toggle-node")
    ("o" origami-open-node "open-node")
    ("c" origami-close-node "close-node")
    ("T" origami-toggle-all-nodes "toggle-all-node")
    ("O" origami-open-all-nodes "open-all-node")
    ("C" origami-close-all-nodes "close-all-node")
    ("q" nil "quit")
    )
  )
(provide 'init-origami)
;;; init-origami ends here

