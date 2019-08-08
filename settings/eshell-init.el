(defun my/eshell-prompt-function ()
  (concat
   (propertize (eshell/pwd) 'face `(:foreground "SlateGray4"))

   (propertize
    (concat " (" (magit-get-current-branch) ")")
    'face `(:foreground "LightSteelBlue3"))

   (propertize " $ " 'face `(:foreground "SlateGray3"))))

;; Disable welcome message.
(setq eshell-banner-message "")

(setq eshell-prompt-function 'my/eshell-prompt-function)
(setq eshell-highlight-prompt nil)

(provide 'eshell-init)
