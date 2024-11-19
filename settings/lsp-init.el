(setq lsp-keymap-prefix "C-c l")
(use-package lsp-mode
  :after yasnippet which-key
  :ensure t
  :bind (:map lsp-mode-map
              ("M-i" . xref-find-definitions)
              ("M-I" . xref-find-definitions-other-window)
              ("C-M-i" . xref-pop-marker-stack)
              ("C-c r" . lsp-rename))
  :hook (lsp-mode . lsp-enable-which-key-integration)
  :init
  (which-key-mode)
  (setq lsp-enable-file-watchers nil)
  (setq lsp-completion-provider :capf)
  (setq lsp-enable-on-type-formatting nil)
  (setq lsp-enable-indentation nil)
  :config
  (define-key lsp-mode-map (kbd lsp-keymap-prefix) lsp-command-map))

(use-package lsp-ui
  :ensure t
  :after lsp-mode
  :bind (:map lsp-ui-mode-map
              ("C-c R" . lsp-ui-peek-find-references))
  :config
  (lsp-ui-sideline-enable nil)
  (setq lsp-prefer-flymake nil)
  (setq lsp-ui-flycheck-enable t))

(use-package ccls
  :ensure t
  :after lsp-ui company
  :init
  (setq ccls-executable "/usr/bin/ccls"))

(provide 'lsp-init)
