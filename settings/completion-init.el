;; Use vertico for neater presentation of completions.
(use-package vertico
  :ensure t
  :init
  (vertico-mode))

;; Persistent minibuffer history across sessions.
(use-package savehist
  :ensure t
  :init
  (savehist-mode))

;; Use the `orderless' completion style for fuzzy completions.
(use-package orderless
  :ensure t
  :custom
  (orderless-component-separator #'orderless-escapable-split-on-space)
  (completion-styles '(orderless basic))
  (completion-category-defaults nil)
  (completion-category-overrides '((file (styles partial-completion)))))

;; Enable rich annotations using the Marginalia package
(use-package marginalia
  :ensure t
  :init

  ;; Projectile
  (add-to-list 'marginalia-command-categories
               '(projectile-find-file . project-file))
  (add-to-list 'marginalia-command-categories
               '(counsel-projectile-switch-to-buffer . buffer))
  (add-to-list 'marginalia-command-categories
               '(projectile-switch-project . project-file))

  (marginalia-mode))

(use-package embark
  :ensure t

  :bind
  (("C-=" . embark-act)
   ("C-M-=" . embark-dwim)
   :map embark-file-map
   ("S" . sudo-find-file))

  :init

  ;; Optionally replace the key help with a completing-read interface
  (setq prefix-help-command #'embark-prefix-help-command)

  :config

  ;; Hide the mode line of the Embark live/completions buffers
  (add-to-list 'display-buffer-alist
               '("\\`\\*Embark Collect \\(Live\\|Completions\\)\\*"
                 nil
                 (window-parameters (mode-line-format . none)))))

(use-package nerd-icons-completion
  :ensure t
  :config
  (nerd-icons-completion-mode))

(provide 'completion-init)
