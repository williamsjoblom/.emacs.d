
(defun my/load-grammarly ()
  (interactive)
  (flymake-mode 1)
  (eldoc-mode 1)
  (flymake-grammarly-load))

(use-package flymake-grammarly
  :ensure t
  :hook (git-commit-mode . my/load-grammarly)
  :after flymake)

; Disable colliding keybinds for flyspell.
(eval-after-load "flyspell" '(define-key flyspell-mode-map (kbd "C-.") nil))
(eval-after-load "flyspell" '(define-key flyspell-mode-map (kbd "C-,") nil))

(provide 'spell-init)
