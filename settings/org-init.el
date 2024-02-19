(use-package org-roam
  :ensure t
  :custom
  (org-roam-directory "~/roam")
  :bind (("C-c n l" . org-roam-buffer-toggle)
         ("C-c n f" . org-roam-node-find)
         ("C-c n i" . org-roam-node-insert))
  :config
  (org-roam-setup))

(use-package org-roam-ui
  :ensure t
  :after org-roam
  :bind (("C-c n g" . org-roam-ui-open)))

(use-package org-bullets
  :ensure t)

(use-package ox-jira
  :ensure t)

(use-package org2blog
  :ensure t)

(defun my/wp-body-id-filter (output backend info)
  "Remove HTML attributes when exporting to wordpress"
  (when (eq backend 'wp)
    (replace-regexp-in-string " \\(id\\|class\\)=\"\\(outline-\\|text-\\|org\\)[[:alnum:]-]*\"" ""
                              output t)))

;; The default is to use "<td>". I don't want this as it renders badly on the
;; ThinLinc blog.
(setq org-html-table-header-tags '("<td scope=\"%s\"%s>" . "</td>"))

(add-to-list 'org-export-filter-final-output-functions 'my/wp-body-id-filter)

;; Prettify symbols.
(setq org-pretty-entities t
      org-fontify-whole-heading-line t
      org-src-tab-acts-natively t
      org-src-fontify-natively t
      org-fontify-quote-and-verse-blocks t
      org-ellipsis "↴")

(setq org-agenda-restore-windows-after-quit t)

;; Automatically export to kill ring (for simple export of notes to slack, jira
;; etc.)
(setq org-export-copy-to-kill-ring 'if-interactive)

;; Increase size of latex previews.
(setq org-format-latex-options
      (plist-put org-format-latex-options :scale 1.25))

;; Also bound to C-'.
(define-key org-mode-map (kbd "C-,") nil)

(defun my/org-open-at-point-same-window ()
  (interactive)
  (let ((org-link-frame-setup '((file . find-file))))
        (org-open-at-point t)))

(define-key org-mode-map (kbd "M-i") 'my/org-open-at-point-same-window)
(define-key org-mode-map (kbd "C-M-i") 'org-mark-ring-goto)


(defun open-todos-other-frame ()
  (interactive)
  (find-file-other-frame "~/org/todo.org"))

(defun my/org-mode-hook ()
  (interactive)
  (org-indent-mode 1)
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

(provide 'org-init)
