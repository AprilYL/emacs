;;; package  --- emacs init file ;

;;; Commentary:

;;; Code:
(use-package benchmark-init
  :ensure t
  :config
  (add-hook 'after-init-hook 'benchmark-init/deactivate)
  )
(provide 'init-benchmark)
;;; init-benchmark.el ends here
