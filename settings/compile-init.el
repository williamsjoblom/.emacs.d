;; If compilation was successful: bury compilation buffer and restore
;; previous buffer in window.
(defun my/compilation-exit-autoclose (status code msg)
  (when (and (eq status 'exit) (zerop code))
    (bury-buffer "*compilation*")
    (replace-buffer-in-windows "*compilation*"))
  (cons msg code))

(setq compilation-exit-message-function 'my/compilation-exit-autoclose)

(global-set-key (kbd "M-p") 'previous-error)
(global-set-key (kbd "M-n") 'next-error)


(provide 'compile-init)
