(use-package lsp-pyright
  :ensure t)

(defun python-block-comment ()
  (interactive)
  (beginning-of-line)
  (open-line 1)
  (let* ((indent (current-column))
	 (stars (make-string (- 78 indent) ?#)))
    (insert stars "\n")
    (indent-to indent)
    (insert "# \n")
    (indent-to indent)
    (insert stars)
    (end-of-line 0)))

(defun my/python-mode-hook ()
  (require 'lsp-pyright)
  (lsp)
  (company-mode)
  (column-number-mode)
  (local-set-key (kbd "C-M-k") 'python-block-comment))

(add-hook 'python-mode-hook 'my/python-mode-hook)
;; (use-package anaconda-mode
;;   :ensure t
;;   :hook ((python-mode . anaconda-mode)
;;          (python-mode . my/python-mode-hook)))

;; (use-package company-anaconda
;;   :after anaconda-mode
;;   :ensure t
;;   :config
;;   '(add-to-list 'company-backends 'company-anaconda))

(setq python-shell-interpreter "python3")


(provide 'python-init)
