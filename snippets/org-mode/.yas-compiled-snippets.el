;;; Compiled snippets and support files for `org-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'org-mode
		     '(("pyp" "#+BEGIN_SRC ipython :session ${1::file ${2:$$(let ((temporary-file-directory \"./\")) (make-temp-file \"py\" nil \".png\"))} }:exports ${3:both}\n$0\n#+END_SRC" "ipython block" nil nil nil "/Users/april/.emacs.d/snippets/org-mode/py_plot" nil nil)
		       ("py" "#+begin_src python :session\n$0\n#+end_src\n" "org python" nil nil nil "/Users/april/.emacs.d/snippets/org-mode/py" nil nil)
		       ("ipy_plot" "#+BEGIN_SRC ipython :session ${1::ipyfile ${2:$$(let ((temporary-file-directory \"./img/\")) (make-temp-file \"py\" nil \".png\"))} }:exports ${3:both}\n$0\n#+END_SRC\n" "org mode python plot" nil nil nil "/Users/april/.emacs.d/snippets/org-mode/ipython_plot" nil nil)
		       ("ipy" "#+BEGIN_SRC ipython :session\n$0\n#+END_SRC\n" "org mode ipython" nil nil nil "/Users/april/.emacs.d/snippets/org-mode/ipy" nil nil)
		       ("code" "#+BEGIN_SRC $1\n$2\n#+END_SRC\n$0" "orgmode code block" nil nil nil "/Users/april/.emacs.d/snippets/org-mode/code" nil nil)))


;;; Do not edit! File generated at Wed Mar 20 16:05:34 2019
