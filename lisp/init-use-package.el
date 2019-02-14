; This is only needed once, near the top of the file
(eval-when-compile
  ;; Following line is not needed if use-package.el is in ~/.emacs.d
  (add-to-list 'load-path "~/.emacs.d/lisp")
  (require 'use-package)
  (require 'diminish)
  (require 'bind-key))
  (provide 'init-use-package)
