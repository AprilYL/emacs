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
  (setq indent-tabs-mode nil))

(provide 'init-docker)
;;; init-docker ends here
