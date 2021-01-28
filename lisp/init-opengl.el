;;; package --- init-opengl.el.
;;; Commentary:
;;
;; opengl configurations.
;;

;;; Code:


;;-----------------------------------------------------------------------------------;;
;; opengl
;;-----------------------------------------------------------------------------------;;
(use-package glsl-mode
  :mode "\\.\\([fvg]s\\|vert\\|tesc\\|tese\\|geom\\|frag\\|comp\\)$"
  :hook
  (glsl-mode . (lambda() (set (make-local-variable 'company-backends) '((company-glsl company-keywords company-capf company-yasnippet company-dabbrev company-files )))))
  :config
  (use-package company-glsl
    )
  )
(provide 'init-opengl)
;;; init-opengl.el ends here
