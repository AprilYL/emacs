;;; package --- init-python.el.
;;; Commentary:
;;
;; docker configurations.
;;

;;; Code:
(use-package docker)

(use-package dockerfile-mode
  :mode
  ("Dockerfile\\'" . dockerfile-mode))

(provide 'init-docker)
;;; init-docker ends here
