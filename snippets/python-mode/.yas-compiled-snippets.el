;;; Compiled snippets and support files for `python-mode'
;;; contents of the .yas-setup.el support file:
;;;
(defun python-args-to-google-docstring (text &optional make-fields)
  "Return a reST docstring format for the python arguments in yas-text."
  (let* ((indent (concat "\n" (make-string (current-column) 32)))
         (args (python-split-args text))
	 (nr 0)
         (formatted-args
	  (mapconcat
	   (lambda (x)
	     (concat "   " (nth 0 x)
		     (if make-fields (format " ${%d:arg%d}" (cl-incf nr) nr))
		     (if (nth 1 x) (concat " \(default " (nth 1 x) "\)"))))
	   args
	   indent)))
    (unless (string= formatted-args "")
      (concat
       (mapconcat 'identity
		  (list "" "Args:" formatted-args)
		  indent)
       "\n"))))

(defun python-split-args (arg-string)
  "Split a python argument string into ((name, default)..) tuples"
  (mapcar (lambda (x)
	    (split-string x "[[:blank:]]*=[[:blank:]]*" t))
          (split-string arg-string "[[:blank:]]*,[[:blank:]]*" t)))
;;; Snippet definitions:
;;;
(yas-define-snippets 'python-mode
		     '(("try" "try:\n    $1\nexcept ${2: Exception}:\n    $0\n\n" "python try catch" nil nil nil "/Users/april/.emacs.d/snippets/python-mode/try" nil nil)
		       ("store" "################################################################################\n# STORE ${1:$$(upcase yas-text)} TABLE\n################################################################################\nSTORE_${1:$(upcase yas-text)}_SQL= \\\"\\\"\\\"\nINSERT INTO $2\n\\\"\\\"\\\"\n$0\n" "python store sql" nil nil nil "/Users/april/.emacs.d/snippets/python-mode/store" nil nil)
		       ("pyh" "# !/usr/bin/env python3.6\n# -*- coding: utf-8 -*-\n# File: `(file-name-nondirectory buffer-file-name)`\n# Create by Lin Yang at `(insert (shell-command-to-string \"echo -n $(date +%Y-%m-%d)\"))`\n# Email: YangLin1@supcon.com\n$0" "insert python header;" nil nil nil "/Users/april/.emacs.d/snippets/python-mode/pyheader" nil nil)
		       ("pyc" "\\\"\\\"\\\"\nArgs:\n	$1:$2\nReturn:\n	$5\n\\\"\\\"\\\"\n	$0\n" "python define function comment" nil nil nil "/Users/april/.emacs.d/snippets/python-mode/pycommand" nil nil)
		       ("main" "if __name__==\"__main__\":\n    $0" "python define main" nil nil nil "/Users/april/.emacs.d/snippets/python-mode/main" nil nil)
		       ("get" "################################################################################\n# GET ${1:$$(upcase yas-text)} DATA\n################################################################################\nGET_${1:$(upcase yas-text)}_SQL= \\\"\\\"\\\"\nSELECT $2\nFROM $0\n\\\"\\\"\\\"\n" "python get data sql" nil nil nil "/Users/april/.emacs.d/snippets/python-mode/get" nil nil)
		       ("create" "################################################################################\n# CREATE ${1:$$(upcase yas-text)} TABLE\n################################################################################\nCREATE_${1:$(upcase yas-text)}_TABLE = \\\"\\\"\\\"\nCREATE TABLE $2\n\\\"\\\"\\\"\n$0\n" "python create sql" nil nil nil "/Users/april/.emacs.d/snippets/python-mode/create" nil nil)))


;;; Do not edit! File generated at Tue Apr 23 14:44:15 2019
