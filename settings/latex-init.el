(use-package auctex
    :ensure t
    :hook (LaTeX-mode . hl-todo-mode)
    :hook (LaTeX-mode . flyspell-mode))

(eval-after-load "flyspell" '(define-key flyspell-mode-map (kbd "C-.") nil))
(eval-after-load "flyspell" '(define-key flyspell-mode-map (kbd "C-,") nil))



(provide 'latex-init)
