;; If compilation was successful: bury compilation buffer and restore
;; previous buffer in window.
(defun my/compilation-exit-autoclose (status code msg)
  (when (and (eq status 'exit) (zerop code))
    (bury-buffer "*compilation*")
    (replace-buffer-in-windows "*compilation*"))
  (cons msg code))

;; Open compilation buffers on the right-hand side.
(add-to-list 'display-buffer-alist
             '("\\*Compilation\\*" display-buffer-in-side-window
               (side . bottom)
               (slot . 0)
               (window-height . fit-window-to-buffer)
               (preserve-size . (nil . t))
               (no-other-window . t)
               (no-delete-other-windows . t)))


(setq compilation-exit-message-function 'my/compilation-exit-autoclose)
(setq compilation-scroll-output 'first-error)

(global-set-key (kbd "M-p") 'previous-error)
(global-set-key (kbd "M-n") 'next-error)


(provide 'compile-init)
