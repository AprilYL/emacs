;;; package --- init-python.el.
;;; Commentary:
;;
;; docker configurations.
;;

;;; Code:
(use-package docker)

(use-package dockerfile-mode
  :mode
  ("Dockerfile\\'" . dockerfile-mode)
  :config
  (setq-default indent-tabs-mode)
  ;; :config
  ;; (put 'dockerfile-image-name 'safe-local-variable #'stringp)
  )

(provide 'init-docker)
;;; init-docker ends here
