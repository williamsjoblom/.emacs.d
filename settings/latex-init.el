(defun my/latex-mode-hook ()
  (hl-todo-mode))

(add-hook 'latex-mode-hook 'my/latex-mode-hook)

(provide 'latex-init)
