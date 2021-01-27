(use-package magit :ensure t)

(use-package projectile
  :ensure t
  :after magit
  :init
  (setq projectile-project-search-path '("~/workbench/")
        projectile-enable-caching t)
  :config
  (projectile-mode +1)
  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))

(use-package projectile-ripgrep
  :ensure t
  :after projectile)

(provide 'projectile-init)
