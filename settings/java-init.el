(use-package lsp-java
  :ensure t
  :after company flycheck
  :config
  (add-hook 'java-mode-hook 'lsp))

(provide 'java-init)
