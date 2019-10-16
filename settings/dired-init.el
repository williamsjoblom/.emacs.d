
(defun dired-beginning-of-buffer ()
  "Go to first entry in dired buffer."
  (interactive)
  (beginning-of-buffer)
  (dired-next-line 4))

(defun dired-end-of-buffer ()
  "Go to the last entry in dired buffer."
  (interactive)
  (end-of-buffer)
  (dired-previous-line 1))

(defun my/dired-mode-hook ()
  (local-set-key (kbd "M-<") 'dired-beginning-of-buffer)
  (local-set-key (kbd "M->") 'dired-end-of-buffer))

(add-hook 'dired-mode-hook 'my/dired-mode-hook)

(provide 'dired-init)
