;; init-vcs.el --- Initialize version control system configurations.
;;; Commentary:
;;
;; Version control systems.
;;

;;; Code:
;; (use-package git-commit
;;   :hook
;;   (git-commit-mode . goto-address-mode))
;; (use-package magit
;;   :ensure t
;;   :bind
;;   (("C-x g s" . magit-status)
;;    ("C-x g c" . magit-commit)
;;    ("C-x g d" . magit-dispatch-popup)
;;    )
;;   :config
;;   (setq-default magit-diff-refine-hunk t)
;;   )

(eval-when-compile
  (require 'init-const))

;; Git
(use-package magit
  :commands (magit-define-popup-switch magit-refresh-buffer)
  :bind (("C-x g" . magit-status)
         ("C-x M-g" . magit-dispatch-popup)
         ("C-c M-g" . magit-file-popup))
  :config
  (when sys/win32p
    (setenv "GIT_ASKPASS" "git-gui--askpass"))
  (magit-define-popup-switch 'magit-fetch-popup
			     ?t "Fetch all tags" "--tags"))

;; Access Git forges from Magit
(if (executable-find "cc")
    (use-package forge
      :after magit
      :demand))

;; Gitflow externsion for Magit
(use-package magit-gitflow
  :diminish magit-gitflow-mode
  :functions magit-define-popup-action
  :bind (:map magit-status-mode-map
              ("G" . magit-gitflow-popup))
  :hook (magit-mode . turn-on-magit-gitflow)
  :config
  (magit-define-popup-action 'magit-dispatch-popup
			     ?G "GitFlow" #'magit-gitflow-popup ?!))

;; Git-Svn extension for Magit
(use-package magit-svn
  :diminish magit-svn-mode
  :hook (magit-mode . magit-svn-mode))

;; Show tasks
(use-package magit-todos
  :hook (ater-init . magit-todos-mode))

;; Walk through git revisions of a file
(use-package git-timemachine
  :bind (:map vc-prefix-map
              ("t" . git-timemachine)))

;; Pop up last commit information of current line
(use-package git-messenger
  :bind (:map vc-prefix-map
              ("p" . git-messenger:popup-message)
              :map git-messenger-map
              ("m" . git-messenger:copy-message))
  :init
  ;; Use magit-show-commit for showing status/diff commands
  (setq git-messenger:use-magit-popup t))

;; Resolve diff3 conflicts
(use-package smerge-mode
  :ensure nil
  :diminish
  :preface
  (with-eval-after-load 'hydra
    (defhydra smerge-hydra
      (:color pink :hint nil :post (smerge-auto-leave))
      "
^Move^       ^Keep^               ^Diff^                 ^Other^
^^-----------^^-------------------^^---------------------^^-------
_n_ext       _b_ase               _<_: upper/base        _C_ombine
_p_rev       _u_pper              _=_: upper/lower       _r_esolve
^^           _l_ower              _>_: base/lower        _k_ill current
^^           _a_ll                _R_efine
^^           _RET_: current       _E_diff
"
      ("n" smerge-next)
      ("p" smerge-prev)
      ("b" smerge-keep-base)
      ("u" smerge-keep-upper)
      ("l" smerge-keep-lower)
      ("a" smerge-keep-all)
      ("RET" smerge-keep-current)
      ("\C-m" smerge-keep-current)
      ("<" smerge-diff-base-upper)
      ("=" smerge-diff-upper-lower)
      (">" smerge-diff-base-lower)
      ("R" smerge-refine)
      ("E" smerge-ediff)
      ("C" smerge-combine-with-next)
      ("r" smerge-resolve)
      ("k" smerge-kill-current)
      ("ZZ" (lambda ()
              (interactive)
              (save-buffer)
              (bury-buffer))
       "Save and bury buffer" :color blue)
      ("q" nil "cancel" :color blue)))
  :hook ((find-file . (lambda ()
                        (save-excursion
                          (goto-char (point-min))
                          (when (re-search-forward "^<<<<<<< " nil t)
                            (smerge-mode 1)))))
         (magit-diff-visit-file . (lambda ()
                                    (when smerge-mode
                                      (smerge-hydra/body))))))

;; Open github/gitlab/bitbucket page
(use-package browse-at-remote
  :bind (:map vc-prefix-map
              ("B" . browse-at-remote)))

;; Git related modes
(use-package gitattributes-mode)
(use-package gitconfig-mode)
(use-package gitignore-mode)

(provide 'init-vcs)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-vcs.el ends here
