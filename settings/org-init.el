(use-package org-bullets
  :ensure t)

(use-package ox-jira
  :ensure t)

;; Prettify symbols.
(setq org-pretty-entities t
      org-fontify-whole-heading-line t
      org-src-tab-acts-natively t
      org-src-fontify-natively t
      org-fontify-quote-and-verse-blocks t
      org-ellipsis "↴")

;; Automatically export to kill ring (for simple export of notes to slack, jira
;; etc.)
(setq org-export-copy-to-kill-ring 'if-interactive)

;; Increase size of latex previews.
(setq org-format-latex-options
      (plist-put org-format-latex-options :scale 1.25))

;; Also bound to C-'.
(define-key org-mode-map (kbd "C-,") nil)

(defun open-todos-other-frame ()
  (interactive)
  (find-file-other-frame "~/org/todo.org"))

(defun my/org-mode-hook ()
  (interactive)
  (org-bullets-mode 1)

  (setq-local line-spacing 0.1)
  (setq-local left-margin-width 2)
  (setq-local right-margin-width 2)
  (bug-reference-mode))

(add-hook 'org-mode-hook 'my/org-mode-hook)

(setq org-todo-keywords
      '((sequence "TODO" "DOING" "FEEDBACK" "VERIFY" "|" "DONE" "DELEGATED")))
(setq org-log-done 'time)

(defun org-summary-todo (n-done n-not-done)
  "Switch entry to DONE when all subentries are done, to TODO otherwise."
  (let (org-log-done org-log-states)   ; turn off logging
    (org-todo (if (= n-not-done 0) "DONE" "VERIFY" "TODO"))))

;; (defun my/org-utf8-checkbox (checkbox)
;;   (case checkbox
;;         (on "☑")
;;         (trans "☐")
;;         (off "☒")
;;         (t "")))
;; (defadvice org-html-checkbox (around bugzilla activate)
;;   (setq ad-return-value (my/org-utf8-checkbox (ad-get-arg 0))))

(add-hook 'org-after-todo-statistics-hook 'org-summary-todo)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)))

;; Pretty list bullets.
(font-lock-add-keywords 'org-mode
                        '(("^ *\\([-]\\) "
                           (0
                            (prog1 ()
                              (compose-region (match-beginning 1)
                                              (match-end 1)
                                              "•"))))))

(set-face-attribute 'org-quote nil
                    :slant 'italic)

(set-face-attribute 'org-done nil
                    :strike-through t)

(set-face-attribute 'org-done nil
                    :strike-through t)

(provide 'org-init)
