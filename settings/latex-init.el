(use-package auctex
    :ensure t
    :hook (LaTeX-mode . hl-todo-mode)
    :hook (LaTex-mode . flyspell-mode))

(provide 'latex-init)
