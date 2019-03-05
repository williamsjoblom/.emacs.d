(lsp-register-client
   (make-lsp-client :new-connection (lsp-stdio-connection
                                     "/opt/kotlin-language-server/bin/kotlin-language-server")
                    :major-modes '(kotlin-mode)
                    :priority -2
                    :ignore-messages '("readFile .*? requested by Kotlin but content not available")
                    :server-id 'kotlin-ls))

;; kotlin-mode has severe indentation issues. Since swift is pretty similar indentation wise
;; we use its indentation rules instead.
(use-package swift-mode
  :ensure t)

(defun my/kotlin-mode-hook ()  
  (lsp)
  (lsp-mode)
  (company-mode)
  (flycheck-mode)
  (gradle-mode)

  ;; Use swift indentation rules.
  (setq-local swift-mode:parenthesized-expression-offset 8)
  (setq-local swift-mode:multiline-statement-offset 8)
  (setq-local indent-line-function #'swift-mode:indent-line))

(use-package gradle-mode
  :ensure t)

(use-package groovy-mode
  :ensure t
  :mode "\\.gradle\\'")


(use-package kotlin-mode
  :ensure t
  :mode "\\.kt\\'"
  :after (company-lsp gradle-mode swift-mode)
  :hook (kotlin-mode . my/kotlin-mode-hook)
  :config
  )


(provide 'kotlin-init)
