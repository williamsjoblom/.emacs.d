(use-package avy
  :ensure t
  :bind (:map global-map
              (("C-'" . avy-goto-char)
              ("M-g M-g" . avy-goto-line))))

(provide 'avy-init)
