;;; package  --- init-osx.el;

;;; Commentary:
;; some configure for mac

;;; Code:
(use-package exec-path-from-shell
  ;; :if (eq system-type 'darwin)
  :diminish
  :config
  (setq exec-path-from-shell-check-startup-files nil)
  (exec-path-from-shell-initialize)
  (setq exec-path-from-shell-arguments '("-l"))
  ) 

(use-package reveal-in-osx-finder
  :diminish
  :bind
  ( "C-c z" . 'reveal-in-osx-finder))

(provide 'init-osx)
