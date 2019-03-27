;;; Compiled snippets and support files for `python-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'python-mode
		     '(("try" "try:\n    $1\nexcept ${2: Exception}:\n    $0\n\n" "python try catch" nil nil nil "/Users/april/.emacs.d/snippets/python-mode/try" nil nil)
		       ("pyh" "# !/usr/bin/env/ python3.6\n# -*- coding: utf-8 -*-\n# File: `(file-name-nondirectory buffer-file-name)`\n# Create by Lin Yang at `(insert (shell-command-to-string \"echo -n $(date +%Y-%m-%d)\"))`\n# Email: YangLin1@supcon.com\n$0" "insert python header;" nil nil nil "/Users/april/.emacs.d/snippets/python-mode/pyheader" nil nil)
		       ("pyc" "\\\"\\\"\\\"\nArgs:\n	$1:$2\nReturn:\n	$5\n\\\"\\\"\\\"\n	$0\n" "python define function comment" nil nil nil "/Users/april/.emacs.d/snippets/python-mode/pycommand" nil nil)
		       ("main" "if __name__==\"__main__\":\n    $0" "python define main" nil nil nil "/Users/april/.emacs.d/snippets/python-mode/main" nil nil)
		       ("def" "def ${1:funciton}(${2:args}):\n    \\\"\\\"\\\"\n    Args:\n	${2:$(elpy_snippet_init_assignments yas-text)}\n    Return:\n	$3\n    \\\"\\\"\\\"\n    $0" "python define funciton" nil nil nil "/Users/april/.emacs.d/snippets/python-mode/def" nil nil)))


;;; Do not edit! File generated at Wed Mar 20 16:05:34 2019
