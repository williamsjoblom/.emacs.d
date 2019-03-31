(use-package cmake-mode
  :ensure t
  :after cmake-font-lock
  :mode "CMakeLists\\.txt\\'")

(use-package cmake-font-lock
  :ensure t
  :after cc-mode cmake-font-lock
  :hook (cmake-mode . cmake-font-lock-activate))

(provide 'cmake-init)
