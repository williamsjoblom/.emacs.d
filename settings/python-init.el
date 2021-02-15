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

(setq my/python-interpreter-prefix
      (if (at-work-p) "cbrun x86_64 " ""))

(defun my/run-python ()
  "Wrapper around `run-python' which, given a prefix arg, starts
python2 instead of python3"
  (interactive)
  (setq python-shell-interpreter
        (concat my/python-interpreter-prefix
                (if (equal current-prefix-arg nil)
                    "python3"
                  "python2")))
  (call-interactively 'run-python))

(define-key python-mode-map (kbd "C-c C-p") 'my/run-python)

(defun my/python-mode-hook ()
  (require 'lsp-pyright)
  (lsp)
  (company-mode)
  (column-number-mode)
  (local-set-key (kbd "C-M-k") 'my/python-block-comment)
  (local-set-key (kbd "C-c c c") 'my/python-coverage-current-buffer)
  (local-set-key (kbd "C-c c r") 'my/python-coverage-pop-up-report)
  (local-set-key (kbd "C-c c h") 'my/python-coverage-open-html))

(add-hook 'python-mode-hook 'my/python-mode-hook)

(provide 'python-init)
