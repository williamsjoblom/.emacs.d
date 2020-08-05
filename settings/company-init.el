(use-package company
  :ensure t
  :bind (("C-;" . company-complete-common))
  :init
  (setq company-idle-delay            0.0
	company-minimum-prefix-length 1
	company-show-numbers          nil
	company-tooltip-limit         10
	company-dabbrev-downcase      nil)
  :config
  (setq company-backends (delete 'company-semantic company-backends)))

(use-package company-lsp
  :ensure t
  :after (company lsp-mode)
  :config
  (add-to-list 'company-backends 'company-capf))

(provide 'company-init)
