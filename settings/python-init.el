(use-package lsp-pyright
  :ensure t)

(defun my/python-coverage-current-buffer ()
  "Check coverage for current buffer"
  (interactive)
  (shell-command (concat "coverage run --branch " (buffer-file-name))))

(defun my/python-coverage-pop-up-report ()
  "Show python coverage report in new window"
  (interactive)
  (with-temp-buffer-window "*coverage*" 'display-buffer-pop-up-window nil
    (prin1 (shell-command-to-string "coverage report"))))

(defun my/python-coverage-open-html ()
  "Check coverage, generate html report, and open it with the
default browser"
  (interactive)
  (my/python-coverage-current-buffer)
  (let ((dir (make-temp-file "coverage" t)))
    (shell-command (concat "coverage html -d " dir))
    (shell-command (concat "xdg-open " (expand-file-name "index.html" dir)))))

(defun my/python-block-comment ()
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
  ;; LSP (that I feel uncomfortable lifting out globally):
  (local-set-key (kbd "C-c s") 'lsp-ivy-workspace-symbol)
  ;; Coverage:
  (local-set-key (kbd "C-c c c") 'my/python-coverage-current-buffer)
  (local-set-key (kbd "C-c c r") 'my/python-coverage-pop-up-report)
  (local-set-key (kbd "C-c c h") 'my/python-coverage-open-html)
  ;; Documentation:
  (local-set-key (kbd "C-M-k") 'my/python-block-comment))

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
