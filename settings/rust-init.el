(use-package rustic
  :ensure t
  :hook (rustic-mode . lsp-mode)
  :mode ("\\.rs\\'" . rustic-mode)
  :init
  (setq rustic-lsp-server 'rls)
  (setq-default rustic-format-trigger 'on-save))
