;; init-yasnippet.el --- Initialize yasnippet configurations.
;;; Commentary:
;;
;; Yasnippet configurations.
;;

;;; Code:

(use-package auto-yasnippet
  :functions hydra-auto-yasnippet/body
  :config
  (defhydra hydra-auto-yasnippet()
    "
_c_: create
_e_: expand
"
    ("c" aya-create "create")
    ("e" aya-expand "expand")
    )
  )

(use-package yasnippet
  :diminish yas-minor-mode
  :hook
  (after-init . yas-global-mode)
  )
(use-package yasnippet-snippets)
(provide 'init-yasnippet)
;;; init-auto-yasnippet.el ends here
