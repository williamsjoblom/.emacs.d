(use-package yasnippet
  :ensure t)

(use-package gist
  :ensure t
  :bind (("C-c g p" . gist-buffer-private)
         ("C-c g g" . gist-buffer)))

(use-package all-the-icons
  :ensure t)

(use-package dashboard
  :ensure t
  :after all-the-icons projectile
  :config
  (dashboard-setup-startup-hook)

  (setq dashboard-set-heading-icons t)
  (setq dashboard-set-file-icons t)
  (setq dashboard-center-content t))

(use-package hl-todo
  :ensure t
  :config
  (customize-set-variable 'hl-todo-highlight-punctuation ":!.")
  (add-to-list 'hl-todo-keyword-faces '("WARNING" . "#cc0000"))
  (add-to-list 'hl-todo-keyword-faces '("BEWARE" . "#aa0000"))
  (add-to-list 'hl-todo-keyword-faces '("DEPRECATED" . "#aa0000")))

(provide 'misc-init)
