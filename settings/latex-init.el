(use-package auctex
    :ensure t
    :hook (LaTeX-mode . hl-todo-mode)
    :hook (LaTeX-mode . flyspell-mode))


(provide 'latex-init)
