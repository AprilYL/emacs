;; init-utils.el --- add some package
;;; Commentary:
;;
;; Some usefule Utilities.
;; ace-window
;;

;;; Code:

;; Display available keybindings in popup
(use-package which-key
  :diminish which-key-mode
  :bind (:map help-map ("C-h" . which-key-C-h-dispatch))
  :hook (after-init . which-key-mode))

;;window control
(use-package ace-window)

(use-package window-numbering
  :hook
  (after-init . window-numbering-mode))


(provide 'init-utils)
