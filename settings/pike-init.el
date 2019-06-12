(defun pike-doc-comment ()
  "Insert pike doc comment."
  (interactive)
  (beginning-of-line)
  (open-line 1)
  (indent-according-to-mode)
  (let* ((indent (current-column)))
    (insert "//! \n")
    (indent-to indent)
    (end-of-line 0)))

(defun my/pike-mode-hook ()
  (local-set-key (kbd "C-c i") 'indent-buffer)
  (column-number-mode)
  
  (local-set-key (kbd "C-M-k") 'c-doc-comment)
  (local-set-key (kbd "C-M-j") 'c-block-comment))

(add-hook 'pike-mode-hook 'my/pike-mode-hook)

(provide 'pike-init)
