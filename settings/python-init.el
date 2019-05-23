
(defun my/python-mode-hook ()
  (interactive)
  (company-mode))


(use-package anaconda-mode
  :ensure t
  :hook ((python-mode . anaconda-mode)
         (python-mode . my/python-mode-hook)))

(use-package company-anaconda
  :after anaconda-mode
  :ensure t
  :config
  '(add-to-list 'company-backends 'company-anaconda))

(setq python-shell-interpreter "python3")

(provide 'python-init)
