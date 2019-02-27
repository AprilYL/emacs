;; init-custom.el --- Define customizations.
;;; Commentary:
;;
;; Customizations.
;;

;;; Code:

(defgroup april nil
  "April Emacs customizations"
  :group 'convenience)

(defcustom april-logo (expand-file-name "logo.png" user-emacs-directory)
  "Set April logo. nil means official logo."
  :type 'string)




(provide 'init-custom)
