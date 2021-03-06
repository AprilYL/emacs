;; package --- init-java.el.
;;; Commentary:
;;
;; java configurations.
;;

;;; Code:
(use-package autodisass-java-bytecode
  :ensure t
  :defer t)


(use-package meghanada
  :functions hydra-meghanada/body
  :commands meghanada-mode
  :defer t
  :init
  (add-hook 'java-mode-hook
            (lambda ()
              ;; (google-set-c-style)
              ;; (google-make-newline-indent)
              (meghanada-mode t)
              ;; (smartparens-mode t)
              (setq c-basic-offset 4)
              ;; (rainbow-delimiters-mode t)
	      ))

  :bind
  (:map meghanada-mode-map
        ("M-RET" . meghanada-local-variable)
        ("C-M-." . helm-imenu)
        ("M-r" . meghanada-reference)
        ("M-t" . meghanada-typeinfo)
        ("C-z" . hydra-meghanada/body))
  :config
  (use-package realgud
    :ensure t)
  (setq indent-tabs-mode nil)
  (setq tab-width 4)
  (setq meghanada-server-remote-debug t)
  (setq meghanada-javac-xlint "-Xlint:all,-processing")
  (setq meghanada-maven-path "mvn")
  ;;   (defhydra hydra-meghanada (:hint nil :exit t)
  ;;     "
  ;; ^Edit^                           ^Tast or Task^
  ;; ^^^^^^-------------------------------------------------------
  ;; _f_: meghanada-compile-file      _m_: meghanada-restart
  ;; _c_: meghanada-compile-project   _t_: meghanada-run-task
  ;; _o_: meghanada-optimize-import   _j_: meghanada-run-junit-test-case
  ;; _s_: meghanada-switch-test-case  _J_: meghanada-run-junit-class
  ;; _v_: meghanada-local-variable    _R_: meghanada-run-junit-recent
  ;; _i_: meghanada-import-all        _r_: meghanada-reference
  ;; _g_: magit-status                _T_: meghanada-typeinfo
  ;; _q_: exit
  ;; "
  ;;     ("f" meghanada-compile-file)
  ;;     ("m" meghanada-restart)

  ;;     ("c" meghanada-compile-project)
  ;;     ("o" meghanada-optimize-import)
  ;;     ("s" meghanada-switch-test-case)
  ;;     ("v" meghanada-local-variable)
  ;;     ("i" meghanada-import-all)

  ;;     ("g" magit-status)

  ;;     ("t" meghanada-run-task)
  ;;     ("T" meghanada-typeinfo)
  ;;     ("j" meghanada-run-junit-test-case)
  ;;     ("J" meghanada-run-junit-class)
  ;;     ("R" meghanada-run-junit-recent)
  ;;     ("r" meghanada-reference)

  ;;     ("q" exit)
  ;;     ("z" nil "leave"))
  (pretty-hydra-define meghanada-window (:foreign-key warn :title meghanada-window :quit-key "q")
    ("Edit"
     (
      ("f" meghanada-compile-file)
      ("m" meghanada-restart)

      ("c" meghanada-compile-project)
      ("o" meghanada-optimize-import)
      ("s" meghanada-switch-test-case)
      ("v" meghanada-local-variable)
      ("i" meghanada-import-all)

      ("g" magit-status))
     "TASK"
     (
      ("t" meghanada-run-task)
      ("T" meghanada-typeinfo)
      ("j" meghanada-run-junit-test-case)
      ("J" meghanada-run-junit-class)
      ("R" meghanada-run-junit-recent)
      ("r" meghanada-reference)
      )
     )
    )
  )

;; (use-package jdee)
(provide 'init-java)
;;; init-java ends here
