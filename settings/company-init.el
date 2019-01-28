(use-package company
  :ensure t
  :bind (("C-;" . company-complete-common))
  :init
  (setq company-idle-delay            0.5
	company-minimum-prefix-length 0
	company-show-numbers          nil
	company-tooltip-limit         10
	company-dabbrev-downcase      nil)
  :config
  (setq company-backends (delete 'company-semantic company-backends)))

(use-package company-lsp
  :ensure t
  :after company lsp-mode)

(provide 'company-init)
