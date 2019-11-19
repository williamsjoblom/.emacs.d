(defun my/new-eshell-other-window ()
  (interactive)
  (unless (other-window 1)
    (split-window-sensibly)
    (other-window 1))
  (eshell t))

(defun my/project-eshell-buffer ()
  (first-matching-buffer
   (format "\\*eshell\\*<%s>" (projectile-project-name))))

(defun my/eshell ()
  (interactive)
  (let* ((project-root ))
    (if (projectile-project-name)
        (let ((buffer (my/project-eshell-buffer)))
          (if buffer
              (switch-to-buffer-other-window buffer)
            (my/new-eshell-other-window)))
      (my/new-eshell-other-window))))

(global-set-key (kbd "C-<return>") 'my/eshell)

(defun my/eshell-hook ()
  (local-set-key (kbd "C-S-<return>") 'my/new-eshell-other-window)
  (when (projectile-project-name)
    (rename-buffer (format "*eshell*<%s>" (projectile-project-name)) t)))

(add-hook 'eshell-mode-hook 'my/eshell-hook)

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
