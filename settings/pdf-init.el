(use-package pdf-tools
  :ensure t
  :config
  (setq pdf-view-incompatible-modes nil)
  (pdf-loader-install)
  (defun my/pdf-view-mode-hook ()
    ;; Disable line numbering in pdf-view-mode.
    (linum-mode -1))

  (add-hook 'pdf-view-mode-hook 'my/pdf-view-mode-hook))

(provide 'pdf-init)
