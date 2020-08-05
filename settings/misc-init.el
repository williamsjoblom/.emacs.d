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
  (setq dashboard-center-content t)
  (setq dashboard-items '((recents . 20)
                          (projects . 5)
                          (bookmarks . 5)
                          (agenda . 5))))

(use-package hl-todo
  :ensure t
  :hook (prog-mode . hl-todo-mode)
  :config
  (customize-set-variable 'hl-todo-highlight-punctuation ":!.")
  (add-to-list 'hl-todo-keyword-faces '("WARNING" . "#cc0000"))
  (add-to-list 'hl-todo-keyword-faces '("BEWARE" . "#aa0000"))
  (add-to-list 'hl-todo-keyword-faces '("DEPRECATED" . "#aa0000"))
  (add-to-list 'hl-todo-keyword-faces '("REFACTOR" . "#cc9393")))

(use-package highlight-escape-sequences
  :ensure t
  :hook (prog-mode . hes-mode))

(use-package expand-region
  :ensure t
  :config
  (global-set-key (kbd "C-\\") 'er/expand-region))

(use-package restclient
  :ensure t)

(provide 'misc-init)
