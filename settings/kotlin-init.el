(lsp-register-client
   (make-lsp-client :new-connection (lsp-stdio-connection
                                     "/opt/kotlin-language-server/bin/kotlin-language-server")
                    :major-modes '(kotlin-mode)
                    :priority -1
                    :ignore-messages '("readFile .*? requested by Kotlin but content not available")
                    :server-id 'kotlin-ls))

(defun my/kotlin-mode-hook ()
  (lsp)
  (lsp-mode)
  (company-mode)
  (flycheck-mode))

(use-package kotlin-mode
  :ensure t
  :mode "\\.kt\\'"
  :after company-lsp
  :hook (kotlin-mode . my/kotlin-mode-hook)
  :config
  (setq-default kotlin-tab-width 4)
  (setq-default indent-tabs-mode nil))


(provide 'kotlin-init)
