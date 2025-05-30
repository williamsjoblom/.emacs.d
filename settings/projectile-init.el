(use-package magit
  :ensure t
  :after all-the-icons
  :custom
  (magit-format-file-function #'magit-format-file-all-the-icons)
  :init
  (when (at-work-p)
    (setq git-commit-summary-max-length 50
          git-commit-fill-column 72
          git-commit-style-convention-checks '('non-empty-second-line
                                               'overlong-summary-line))))

(use-package magit-svn
  :ensure t
  :after magit)

(defun diff-hl-dired-mode-unless-remote ()
    (unless (file-remote-p default-directory) (diff-hl-dired-mode)))

(use-package diff-hl
  :ensure t
  :hook ((prog-mode . diff-hl-mode)
         (dired-mode . diff-hl-dired-mode-unless-remote))
  :config
  (diff-hl-flydiff-mode))

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
