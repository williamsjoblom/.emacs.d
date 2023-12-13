(use-package pdf-tools
  :ensure t
  :config
  (pdf-loader-install))

(use-package pdf-view
  :ensure nil
  :after pdf-tools
  :bind (:map pdf-view-mode-map
              ;; swiper does not work in pdf-view-mode, use original
              ;; isearch-forward instead.
              ("C-s" . isearch-forward)))

(provide 'pdf-init)
