(use-package pdf-tools
  :ensure t
  :config
  ;; Clear the incompatible modes list to remove nag about
  ;; global-linum-mode. linum-mode is being disabled for pdf-view-mode
  ;; a few lines down.
  (setq pdf-view-incompatible-modes nil)
  (pdf-loader-install)
  (defun my/pdf-view-mode-hook ()
    ;; Disable line numbering in pdf-view-mode.
    (linum-mode -1))

  (add-hook 'pdf-view-mode-hook 'my/pdf-view-mode-hook))

(use-package pdf-view
  :ensure nil
  :after pdf-tools
  :bind (:map pdf-view-mode-map
              ;; swiper does not work in pdf-view-mode, use original
              ;; isearch-forward instead.
              ("C-s" . isearch-forward)))

(provide 'pdf-init)
