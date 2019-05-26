(defun elisp-block-comment ()
  "Insert elisp block comment above current line."
  (interactive)
  (beginning-of-line)
  (open-line 1)
  (indent-according-to-mode)
  (let* ((indent (current-column))
	 (dashes (make-string (- 80 indent) ?-)))
    (insert ";;" dashes "\n")
    (indent-to indent)
    (insert ";; \n")
    (indent-to indent)
    (insert ";;" dashes)
    (end-of-line 0)))


(defun my/elisp-hook ()
  (company-mode)
  (local-set-key (kbd "C-M-j") 'elisp-block-comment))

(add-hook 'emacs-lisp-mode-hook 'my/elisp-hook)

(provide 'elisp-init)
