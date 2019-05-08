(use-package ivy
  :ensure t
  :init
  (setq ivy-re-builders-alist '((t . ivy--regex-plus)))
  (setq xref-show-xrefs-function #'ivy-xref-show-xrefs)
  :config
  (ivy-mode 1))

(use-package ivy-rich
  :ensure t
  :after ivy
  :config
  (ivy-rich-mode 1))

(use-package swiper
  :ensure t
  :after ivy
  :bind (:map global-map
	      ("C-s" . swiper)
	      ("C-S-s" . swiper-all)))

(use-package counsel
  :ensure t
  :after ivy
  :bind (:map global-map
	      ("M-x" . counsel-M-x)))

(use-package counsel-projectile
  :ensure t
  :after projectile counsel
  :config
  (counsel-projectile-mode))

(use-package counsel-spotify
  :ensure t
  :after counsel
  :bind (:map global-map
              ("C-x C-\\" . counsel-spotify-search-track)))

(provide 'ivy-init)
