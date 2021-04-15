;;; package --- init-cython.el.
;;; Commentary:
;;
;; Python configurations.
;;

;;; Code:

;;-----------------------------------------------------------------------------------;;
;; cython
;;-----------------------------------------------------------------------------------;;

(use-package cython
  :mode (("\\.pyx'" . cython-mode)
	 ("\\.pyi'" . cython-mode)
	 ("\\.pyd'" . cython-mode)
	 )
  )

(provide 'init-cython)
;;; init-python.el ends here
