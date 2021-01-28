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
;;; Snippet definitions:
;;;
(yas-define-snippets 'python-mode
		     '(("ud" "##############################################################################\n# UPDATE ${1:$$(upcase yas-text)} TABLE\n##############################################################################\nUPDATE_${1:$(upcase yas-text)}_TABLE = \\\"\\\"\\\"\nUPDATE\n    ${2:$$(upcase yas-text)}\nSET\n    ${3:$$(upcase yas-text)}\nWHERE\n    ${4:$$(upcase yas-text)}\n\\\"\\\"\\\"\n$0" "python update sql" nil nil nil "/Users/april/.emacs.d/snippets/python-mode/update" nil nil)
		       ("try" "try:\n    $1\nexcept ${2: Exception}:\n    $0\n\n" "python try catch" nil nil nil "/Users/april/.emacs.d/snippets/python-mode/try" nil nil)
		       ("sd" "##############################################################################\n# STORE ${1:$$(upcase yas-text)} TABLE\n##############################################################################\nSTORE_${1:$(upcase yas-text)}_SQL= \\\"\\\"\\\"\nINSERT INTO\n    ${2:$$(upcase yas-text)}\n    (${3:$$(upcase yas-text)})\nVALUES\n    ($4)\n\\\"\\\"\\\"\n$0\n" "python store sql" nil nil nil "/Users/april/.emacs.d/snippets/python-mode/store" nil nil)
		       ("sc" "${1:$(make-string 80 ?\\#)}\n#${1:$(make-string (- 38 (ceiling (/ (string-width yas-text) 2)) ) ?\\s)} ${1:Title} ${1:$(make-string (- 37 (ceiling (/ (string-width yas-text) 2))) ?\\s)}#\n${1:$(make-string 80 ?\\#)}\n$0\n" "split comment" nil nil nil "/Users/april/.emacs.d/snippets/python-mode/split comment" nil nil)
		       ("pyh" "# -*- coding: utf-8 -*-\n# !/usr/bin/env python3.6\n# File: `(file-name-nondirectory buffer-file-name)`\n# Create by Lin Yang at `(insert (shell-command-to-string \"echo -n $(date +%Y-%m-%d)\"))`\n# Email: YangLin1@supcon.com\n$0" "insert python header;" nil nil nil "/Users/april/.emacs.d/snippets/python-mode/pyheader" nil nil)
		       ("pyc" "\\\"\\\"\\\"\nArgs:\n	$1:$2\nReturn:\n	$5\n\\\"\\\"\\\"\n	$0\n" "python define function comment" nil nil nil "/Users/april/.emacs.d/snippets/python-mode/pycommand" nil nil)
		       ("tdo" "TO_DATE('{$1}','YYYY-MM-DD HH24:MI:SS')\n$0\n" "python sql to_date" nil nil nil "/Users/april/.emacs.d/snippets/python-mode/oracle_to_date" nil nil)
		       ("oracle" "###############################################################################\n# oracle database configuration\n###############################################################################\ndatabase_conf$1 = {\n    'user': '$2',\n    'passwd': '$3',\n    'host': '$4'\n}\n$0\n" "python oracle conf" nil nil nil "/Users/april/.emacs.d/snippets/python-mode/oracle" nil nil)
		       ("tdm" "str_to_date('{$1}','%Y-%m-%d %H:%i:%s')\n$0\n" "python mysql to_date" nil nil nil "/Users/april/.emacs.d/snippets/python-mode/mysql_to_date" nil nil)
		       ("mysql" "###############################################################################\n# mysql database configuration\n###############################################################################\ndatabase_conf$1 = {\n    'user': '$2',\n    'passwd': '$3',\n    'host': '$4',\n    'port': ${5:3306},\n    'db': $6\n}\n$0" "python mysql" nil nil nil "/Users/april/.emacs.d/snippets/python-mode/mysql" nil nil)
		       ("main" "if __name__==\"__main__\":\n    $0" "python define main" nil nil nil "/Users/april/.emacs.d/snippets/python-mode/main" nil nil)
		       ("gd" "##############################################################################\n# GET ${1:$$(upcase yas-text)} DATA\n##############################################################################\nGET_$1_SQL= \\\"\\\"\\\"\nSELECT\n    ${2:$$(upcase yas-text)}\nFROM\n    ${3:$$(upcase yas-text)}\n\\\"\\\"\\\"\n" "python get data sql" nil nil nil "/Users/april/.emacs.d/snippets/python-mode/get" nil nil)
		       ("defg" "def ${1:name}($2):\n    \\\"\\\"\\\"$3\n    ${2:$(python-args-to-google-docstring yas-text t)}\n    ${5:Returns:\n        $6\n}\n    \\\"\\\"\\\"\n    ${0:$$(let ((beg yas-snippet-beg)\n                (end yas-snippet-end))\n        (yas-expand-snippet\n          (buffer-substring-no-properties beg end) beg end\n              (quote ((yas-indent-line nil) (yas-wrap-around-region nil))))\n            (delete-trailing-whitespace beg (- end 1)))}\n" "Python Google style Docstring" nil nil nil "/Users/april/.emacs.d/snippets/python-mode/defg" nil nil)
		       ("ct" "##############################################################################\n# CREATE ${1:$$(upcase yas-text)} TABLE\n##############################################################################\nCREATE_${1:$(upcase yas-text)}_TABLE = \\\"\\\"\\\"\nCREATE TABLE\n    ${2:$$(upcase yas-text)}\n(\n    ${3:$$(upcase yas-text)}\n)\n\\\"\\\"\\\"\n$0\n" "python create sql" nil nil nil "/Users/april/.emacs.d/snippets/python-mode/create" nil nil)
		       ("bc" "${1:$(make-string (+ 4 (string-width yas-text)) ?#)}\n# $1 #\n${1:$(make-string (+ 4 (string-width yas-text)) ?#)}\n$0" "python break comment" nil nil nil "/Users/april/.emacs.d/snippets/python-mode/break command" nil nil)))


;;; Do not edit! File generated at Fri Nov 13 15:57:41 2020
