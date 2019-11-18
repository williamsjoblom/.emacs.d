(defun my/eshell-pwd ()
  (replace-regexp-in-string (substitute-in-file-name "^$HOME") "~" (eshell/pwd)))

(defun my/eshell-prompt-function ()
  (concat
   (propertize (my/eshell-pwd)
               'face `(:foreground "SlateGray4"))

   (let ((branch (magit-get-current-branch)))
     (when (> (length branch) 0)
         (propertize
          (concat " (" branch ")")
          'face `(:foreground "LightSteelBlue3"))))

   (propertize " ➜" 'face `(:foreground "DarkGreen"))
   " "))

;; Disable welcome message.
(setq eshell-banner-message "")

(setq eshell-prompt-function 'my/eshell-prompt-function
      eshell-prompt-regexp ".*➜ ")
(setq eshell-highlight-prompt nil)

(provide 'eshell-init)
