(use-package exec-path-from-shell
  :if (eq system-type 'darwin)
  :config
  (exec-path-from-shell-initialize)
) 

(use-package reveal-in-osx-finder
    :bind
  ( "C-c z" . 'reveal-in-osx-finder))

(provide 'init-osx)
