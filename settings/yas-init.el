(setq my/snippet-dir
      (expand-file-name "snippets" user-emacs-directory))

(use-package yasnippet
  :ensure t
  :config
  ;; Add snippet paths
  (setq yas-snippet-dirs
        '(my/snippet-dir))
  (yas-global-mode 1))

(provide 'yas-init)
