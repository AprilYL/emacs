;; init-eshell.el --- Initialize eshell configurations.
;;; Commentary:
;;
;; Eshell configurations.
;;

;;; Code:

;; Emacs command shell

(use-package eshell
  :ensure nil
  :defines (compilation-last-buffer eshell-prompt-function)
  :commands (eshell/alias
	     eshell-send-input eshell-flatten-list
	     eshell-interpreter-output-p eshell-parse-command)
  :hook (eshell-mode . (lambda()
			 (bind-key "C-l" 'eshell/clear eshell-mode-map)
			 (eshell/alias "f" "find-file $1")
			 (eshell/alias "fo" "find-file-other-window $1")
			 (eshell/alias "d" "dired $1")
			 (eshell/alias "ll" "ls -l")
			 (eshell/alias "la" "ls -al")))
  :preface
  (defun eshell/clear()
    "Clear the ehsell buffer."
    (interactive)
    (let ((inhibit-read-only t))
      (erase-buffer)
      (eshell-send-input)))
d	)))
(provide 'init-eshell)
