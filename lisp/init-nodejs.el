;; package --- init-nodejs.el.
;;; Commentary:
;;
;; nodejs configurations.
;;

;;; Code:
(use-package nodejs-repl
  :hook
  (js-mode-hook . (lambda ()
		    (define-key js-mode-map (kbd "C-x C-e") 'nodejs-repl-send-last-expression)
		    (define-key js-mode-map (kbd "C-c C-j") 'nodejs-repl-send-line)
		    (define-key js-mode-map (kbd "C-c C-r") 'nodejs-repl-send-region)
		    (define-key js-mode-map (kbd "C-c C-l") 'nodejs-repl-load-file)
		    (define-key js-mode-map (kbd "C-c C-z") 'nodejs-repl-switch-to-repl))))

(provide 'init-nodejs)
;;; init-nodejs ends here
