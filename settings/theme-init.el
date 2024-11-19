(use-package doom-themes
  :ensure t
  :config
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t)

  (load-theme 'doom-Iosvkem t)

  (doom-themes-org-config))

;; (use-package spacemacs-theme
;;   :ensure t
;;   :config
;;   (if (daemonp)
;;       (add-hook 'after-make-frame-functions
;;                 (lambda (frame)
;;                   (select-frame frame)
;;                   (load-theme 'spacemacs-light t)))
;;     (load-theme 'spacemacs-light t)))

(use-package moody
  :ensure t
  :config
  (moody-replace-mode-line-front-space)
  (moody-replace-mode-line-buffer-identification)
  (moody-replace-vc-mode))

(use-package minions
  :ensure t
  :config
  (minions-mode 1))

(use-package solaire-mode
  :ensure t
  :config
  (solaire-global-mode 1))

(setq frame-title-format `("%b@emacs" ,(number-to-string emacs-major-version)))

(provide 'theme-init)
