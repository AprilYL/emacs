(require 'org-install)
(require 'ob-tangle)
(org-babel-load-file (expand-file-name "yanglin.org" user-emacs-directory))
(put 'dired-find-alternate-file 'disabled nil)
