(use-package csharp-mode
  :ensure t
  :mode "\\.cs\\'")

(use-package omnisharp
  :after csharp-mode company
  :ensure t
  :hook (csharp-mode . omnisharp-mode)
  :init
  :config
  (add-to-list 'company-backends 'company-omnisharp)
  
  (omnisharp-start-omnisharp-server)
  (company-mode)
  
  (setq truncate-lines t))

(provide 'csharp-init)
