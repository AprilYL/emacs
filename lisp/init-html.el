(use-package web-mode
  :mode
  (
   ("\\.phtml\\'" . web-mode)
   ("\\.tpl\\.php\\'" . web-mode)
   ("\\.[agj]sp\\'" . web-mode)
   ("\\.as[cp]x\\'" . web-mode)
   ("\\.erb\\'" . web-mode)
   ("\\.mustache\\'" . web-mode)
   ("\\.djhtml\\'" . web-mode)
   ("\\.html?\\'" . web-mode)
   ("\\.css?\\'" . web-mode)
   ("\\.ts\\'" . web-mode)
   )
  :hook
  (web-mode . rainbow-mode)
  :config
  (use-package emmet-mode
    :ensure t
    :hook
    (web-mode . emmet-mode))
    :config
    (add-hook 'web-mode-before-auto-complete-hooks
    (lambda ()
     (let ((web-mode-cur-language
    	    (web-mode-language-at-pos)))
               (if (string= web-mode-cur-language "php")
    	   (yas-activate-extra-mode 'php-mode)
      	 (yas-deactivate-extra-mode 'php-mode))
               (if (string= web-mode-cur-language "css")
    	   (setq emmet-use-css-transform t)
      	 (setq emmet-use-css-transform nil)))))
    
  (use-package company-web
    :ensure t)
  ;;set indent
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq tab-width 2)
  ;; highlight of column
  (setq web-mode-enable-current-column-highlight t)
  (setq web-mode-enable-current-element-highlight t)
  ;; set company 
  (add-hook 'web-mode-hook
	    (lambda ()
	       (set (make-local-variable 'company-backends) '(company-files company-css company-web-html company-yasnippet )))
  ))

(provide 'init-html)
