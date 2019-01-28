(use-package ivy
  :ensure t
  :init
  (setq ivy-re-builders-alist '((t . ivy--regex-plus)))
  (setq xref-show-xrefs-function #'ivy-xref-show-xrefs)
  (ivy-mode 1))

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


(provide 'ivy-init)
