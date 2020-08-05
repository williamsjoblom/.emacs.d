(use-package lsp-mode
  :after yasnippet
  :ensure t
  :bind (:map lsp-mode-map
              ("M-i" . xref-find-definitions)
              ("M-I" . xref-find-definitions-other-window)
              ("C-M-i" . xref-pop-marker-stack)
              ("C-c r" . lsp-rename))
  :config
  (setq lsp-enable-file-watchers nil))

(use-package lsp-ui
  :ensure t
  :after lsp-mode
  :config
  (lsp-ui-sideline-enable nil)
  (setq lsp-prefer-flymake nil))

;; (use-package cquery
;;   :ensure t
;;   :after lsp-ui company flycheck
;;   :init
;;   (setq cquery-executable "/usr/bin/cquery")
;;   (setq company-transformers         nil
;; 	company-lsp-async            t
;; 	company-lsp-cache-candidates nil))

(use-package ccls
  :ensure t
  :after lsp-ui company flycheck
  :init
  (setq ccls-executable "/usr/bin/ccls"))

(use-package dap-mode
  :ensure t
  :after lsp-mode lsp-ui)

(provide 'lsp-init)
