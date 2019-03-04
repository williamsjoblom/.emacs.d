(use-package csharp-mode
  :ensure t
  :mode "\\.cs\\'")

(defun my/csharp-hook ()
  (add-to-list 'company-backends 'company-omnisharp)
  
  (omnisharp-start-omnisharp-server)
  (company-mode)
  
  (setq truncate-lines t))

(use-package omnisharp
  :after csharp-mode company
  :ensure t
  :hook ((csharp-mode . omnisharp-mode)
         (omnisharp-mode . my/csharp-hook)))

(provide 'csharp-init)
