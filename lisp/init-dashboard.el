;; init-dashboard.el --- Initialize dashboard configurations
;;; Commentary:
;;
;; Dashboard configurations.
;;

;;; Code:
(use-package dashboard
  :diminish (dashboard-mode page-break-lines-mode)
  :defines persp-special-last-buffer
  :functions (widget-forward
              winner-undo
              open-custom-file
              persp-load-state-from-file
              persp-get-buffer-or-null
              persp-switch-to-buffer)
  :commands dashboard-insert-startupify-lists
  :preface
  (defvar dashboard-recover-layout-p nil)

  (defun open-dashboard ()
    "Open the *dashboard* buffer and jump to the first widget."
    (interactive)
    (if (get-buffer dashboard-buffer-name)
        (kill-buffer dashboard-buffer-name))
    (dashboard-insert-startupify-lists)
    (switch-to-buffer dashboard-buffer-name)
    (goto-char (point-min))
    (dashboard-goto-recent-files)
    (if (> (length (window-list-1))
           ;; exclude `treemacs' window
           (if (and (fboundp 'treemacs-current-visibility)
                    (eq (treemacs-current-visibility) 'visible))
               2
             1))
        (setq dashboard-recover-layout-p t))
    (delete-other-windows))

  (defun restore-session ()
    "Restore last session."
    (interactive)
    (when (bound-and-true-p persp-mode)
      (message "Restoring session...")
      (condition-case-unless-debug err
          (persp-load-state-from-file)
        (error
         (message "Error: Unable to restore last session -- %s" err)))
      (when (persp-get-buffer-or-null persp-special-last-buffer)
        (persp-switch-to-buffer persp-special-last-buffer))))

  (defun quit-dashboard ()
    "Quit dashboard window."
    (interactive)
    (quit-window t)
    (when (and dashboard-recover-layout-p
               (bound-and-true-p winner-mode))
      (winner-undo)
      (setq dashboard-recover-layout-p nil)))

  (defun dashboard-edit-config ()
    "Open custom config file."
    (interactive)
    (quit-dashboard)
    (open-custom-file))

  (defun dashboard-goto-recent-files ()
    "Go to recent files."
    (interactive)
    (funcall (local-key-binding "r")))

  (defun dashboard-goto-projects ()
    "Go to projects."
    (interactive)
    (funcall (local-key-binding "p")))

  (defun dashboard-goto-bookmarks ()
    "Go to bookmarks."
    (interactive)
    (funcall (local-key-binding "m")))

  :bind (("<f2>" . open-dashboard)
         :map dashboard-mode-map
         ("H" . browse-homepage)
         ("E" . dashboard-edit-config)
         ("R" . restore-session)
         ("U" . april-update)
         ("q" . quit-dashboard))
  :hook (after-init . dashboard-setup-startup-hook)
  :config
  (setq initial-buffer-choice (lambda () (get-buffer dashboard-buffer-name)))
  (setq dashboard-banner-logo-title "April EMACS - Enjoy programming and writing")
  (setq dashboard-startup-banner (or april-logo 'official))
  (setq dashboard-items '((recents  . 10)
                          (bookmarks . 5)
                          (projects . 5)))

  (defun my-get-banner-path (&rest _)
    "Return the full path to banner."
    (expand-file-name "banner.txt" user-emacs-directory))
  (advice-add #'dashboard-get-banner-path :override #'my-get-banner-path)

  (defun dashboard-insert-buttons (_list-size)
    (insert "\n")
    (insert (make-string (max 0 (floor (/ (- dashboard-banner-length 51) 2))) ?\ ))
    (widget-create 'url-link
                   :tag (propertize "Homepage" 'face 'font-lock-keyword-face)
                   :help-echo "Open the April Emacs Github page"
                   :mouse-face 'highlight
                   april-homepage)
    (insert " ")
    (widget-create 'push-button
                   :help-echo "Restore previous session"
                   :action (lambda (&rest _) (restore-session))
                   :mouse-face 'highlight
                   :button-prefix ""
                   :button-suffix ""
                   (propertize "Restore Session" 'face 'font-lock-keyword-face))
    (insert " ")
    (widget-create 'push-button
                   :help-echo "Edit Personal Configurations"
                   :action (lambda (&rest _) (dashboard-edit-config))
                   :mouse-face 'highlight
                   :button-prefix ""
                   :button-suffix ""
                   (propertize "Edit Config" 'face 'font-lock-keyword-face))
    (insert " ")
    (widget-create 'push-button
                   :help-echo "Update April Emacs config and packages"
                   :action (lambda (&rest _) (april-update))
                   :mouse-face 'highlight
                   (propertize "Update" 'face 'font-lock-keyword-face))
    (insert "\n")
    (insert "\n")
    (insert "\n")
    (insert (format "[%d packages loaded in %s]" (length package-activated-list) (emacs-init-time))))

  (add-to-list 'dashboard-item-generators  '(buttons . dashboard-insert-buttons))
  (add-to-list 'dashboard-items '(buttons))

  (dashboard-insert-startupify-lists)

  (with-eval-after-load 'hydra
    (defhydra dashboard-hydra (:color red :columns 3)
      "Help"
      ("<tab>" widget-forward "Next Widget")
      ("C-i" widget-forward "Prompt")
      ("<backtab>" widget-backward "Previous Widget")
      ("RET" widget-button-press "Press Widget" :exit t)
      ("g" dashboard-refresh-buffer "Refresh" :exit t)
      ("}" dashboard-next-section "Next Section")
      ("{" dashboard-previous-section "Previous Section")
      ("r" dashboard-goto-recent-files "Recent Files")
      ("p" dashboard-goto-projects "Projects")
      ("m" dashboard-goto-bookmarks "Bookmarks")
      ("H" browse-homepage "Browse Homepage" :exit t)
      ("R" restore-session "Restore Previous Session" :exit t)
      ("E" dashboard-edit-config "Open custom file" :exit t)
      ("U" april-update "Update April Emacs" :exit t)
      ("<f2>" open-dashboard "Open Dashboard" :exit t)
      ("q" quit-dashboard "Quit Dashboard" :exit t)
      ("C-g" nil "quit"))
    (bind-keys :map dashboard-mode-map
               ("h" . dashboard-hydra/body)
               ("?" . dashboard-hydra/body))))

(provide 'init-dashboard)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-dashboard.el ends here
