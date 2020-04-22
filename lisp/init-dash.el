;;; package  --- init-dash;

;;; Commentary:
;; dash config
;;; Code:
(defun april/dash-installed-p ()
  "Retrun t if Dash is installed on this machine , or nil otherwise."
  (let ((lsregister "/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister"))
    (and (file-executable-p lsregister)
	 (not (string-equal
	       ""
	       (shell-command-to-string
		(concat lsregister " -dump|grep com.kapeli.dash")))))))

(when (and (eq system-type 'darwin) (not (package-installed-p 'dash-at-point)))
  (message "Checking whether Dash is installed"))
(when (april/dash-installed-p)
  (use-package dash-at-point
    :bind
    (("C-c D" . dash-at-point)
     ("C-c d" . dash-at-point-docset))
    :config
    (dash-enable-font-lock)))
(provide 'init-dash)
;;; init-dash ends here
