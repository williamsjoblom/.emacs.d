(use-package cmake-ide
  :ensure t
  :init
  (setq cmake-ide-make-command "make --no-print-directory -j8")
  :config
  (cmake-ide-setup))

(setq c-basic-offset  4
      c-default-style "linux")

(defun my/c++-mode-hook ()
  (flycheck-mode)
  (company-mode)
  (add-to-list 'company-backends 'company-lsp)
  (lsp)
  (lsp-mode)
  (lsp-ui-mode)
  
  (local-set-key (kbd "M-i") 'xref-find-definitions)
  (local-set-key (kbd "C-M-i") 'xref-pop-marker-stack)
  (local-set-key (kbd "M-o") 'ff-find-other-file)
  (local-set-key (kbd "C-c m") 'cmake-ide-compile)
  (local-set-key (kbd "C-c i") 'indent-buffer)
  
  ;; Bind C-m to 'compile', <return> needs to be bound to
  ;; 'newline' since it is bound to C-m by default.
  (cond (window-system
	 (local-set-key (kbd "<return>") 'newline)
	 (local-set-key (kbd "C-m") 'compile)))

  (local-set-key (kbd "C-M-k") 'c-doc-comment)
  (local-set-key (kbd "C-M-j") 'c-block-comment))

(add-hook 'c++-mode-hook 'my/c++-mode-hook)

(provide 'c++-init)
