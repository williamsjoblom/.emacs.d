(use-package gist
  :ensure t
  :bind (("C-c g p" . gist-buffer-private)
         ("C-c g g" . gist-buffer)))

(use-package all-the-icons
  :ensure t)

(use-package which-key
  :ensure t
  :config
  (which-key-setup-side-window-bottom))

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

(use-package fill-column-indicator
  :ensure t
  :config
  (add-hook 'prog-mode-hook 'display-fill-column-indicator-mode))

(use-package hl-todo
  :ensure t
  :hook ((prog-mode . hl-todo-mode)
         (conf-mode . hl-todo-mode))
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

(use-package csv-mode
  :ensure t
  :mode "\\.csv\\'")

(use-package editorconfig
  :ensure t
  :config
  (editorconfig-mode 1))

(defun my/add-systemd-service-boilerplate ()
  "Add systemd service boilerplate to an empty file if its
extension is '.service"
  (interactive)
  (yas-expand-snippet "[Unit]
Description=$1
After=multi-user.target

[Service]
Type=$2
ExecStart=$3
${4:User=$5}
${6:Group=$7}

[Install]
WantedBy=multi-user.target"))

(use-package autoinsert
  :ensure t
  :init
  (setq auto-insert-query nil)
  (add-hook 'find-file-hook 'auto-insert)
  (auto-insert-mode 1)
  :config
  (define-auto-insert "\\.service$" [my/add-systemd-service-boilerplate]))

(use-package exec-path-from-shell
  :ensure t
  :config
  (exec-path-from-shell-initialize))

(provide 'misc-init)
