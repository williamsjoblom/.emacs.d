;; Syntax highlighting for code blocks.
(setq org-src-fontify-natively t)
(setq org-src-tab-acts-natively t)

;; Prettify symbols.
(setq org-pretty-entities t)

(defun my/org-mode-hook ()
  (add-to-list 'org-emphasis-alist
               '("_" (:foreground "red"))))

(setq org-todo-keywords
      '((sequence "TODO" "|" "VERIFY" "DONE")))
(setq org-log-done 'time)

(defun org-summary-todo (n-done n-not-done)
  "Switch entry to DONE when all subentries are done, to TODO otherwise."
  (let (org-log-done org-log-states)   ; turn off logging
    (org-todo (if (= n-not-done 0) "DONE" "VERIFY" "TODO"))))

(add-hook 'org-after-todo-statistics-hook 'org-summary-todo)

(add-hook 'org-mode-hook 'my/org-mode-hook)

(provide 'org-init)
