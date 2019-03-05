(use-package lsp-mode
  :ensure t)

(use-package lsp-ui
  :ensure t
  :after lsp-mode
  :config
  (lsp-ui-sideline-enable nil))

(use-package cquery
  :ensure t
  :after lsp-ui company flycheck
  :init
  (setq cquery-executable "/usr/bin/cquery")
  (setq company-transformers         nil
	company-lsp-async            t
	company-lsp-cache-candidates nil))

(use-package dap-mode
  :ensure t
  :after lsp-mode lsp-ui)

(provide 'lsp-init)
