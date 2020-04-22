;;; Compiled snippets and support files for `org-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'org-mode
		     '(("pycp" "#+BEGIN_SRC ipython :session :ipyfile  ${1:image.png} :exports ${3:both} :results raw drawer\n$0\n#+END_SRC\n" "python plot" nil nil nil "/Users/april/.emacs.d/snippets/org-mode/ipython_plot" nil nil)
		       ("pyc" "#+BEGIN_SRC ipython :session :exports both :results raw drawer\n  $0\n#+END_SRC\n" "ipython code" nil nil nil "/Users/april/.emacs.d/snippets/org-mode/ipy" nil nil)
		       ("code" "#+BEGIN_SRC $1\n$2\n#+END_SRC\n$0" "orgmode code block" nil nil nil "/Users/april/.emacs.d/snippets/org-mode/code" nil nil)))


;;; Do not edit! File generated at Tue Dec 10 13:19:50 2019
