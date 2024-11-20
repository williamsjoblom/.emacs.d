(use-package ivy
  :ensure t
  :demand
  :bind (:map global-map
              ("C-x c" . ivy-resume))
  :init
  (setq ivy-re-builders-alist '((t . ivy--regex-plus)))
  (setq xref-show-xrefs-function #'ivy-xref-show-xrefs)
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t))

(defun my/ivy-rich-switch-buffer-icon (candidate)
  (with-current-buffer
      (get-buffer candidate)
    (let ((icon (all-the-icons-icon-for-mode major-mode)))
      (if (symbolp icon)
          (all-the-icons-icon-for-mode 'fundamental-mode)
        icon))))

(use-package ivy-rich
  :ensure t
  :after ivy
  :config
  (setq ivy-rich-parse-remote-buffer nil) ; Make tramp SNAP!
  (ivy-rich-mode 1))

(use-package lsp-ivy
  :ensure t
  :after ivy lsp)

(use-package swiper
  :ensure t
  :after ivy
  :bind (:map global-map
	      ("C-s" . swiper)
	      ("C-S-s" . swiper-all)))

(use-package counsel
  :ensure t
  :after ivy
  :bind (:map global-map ("M-x" . counsel-M-x))
  :bind (:map minibuffer-local-map ("C-r" . counsel-minibuffer-history))
  :config
  (counsel-mode 1))

(use-package counsel-tramp
  :ensure t
  :after counsel
  :bind (:map global-map
	      ("C-x t" . counsel-tramp))
  :config
  (setq tramp-default-method "ssh"))

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

(provide 'completion-init)
