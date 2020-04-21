
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

;; Insert C block comment
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


(provide 'python-init)
