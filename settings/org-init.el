(use-package org-bullets
  :ensure t)

(use-package epresent
  :ensure t
  :config
  (defun my/epresent-start-presentation-hook ()
    (linum-mode -1)
    (visual-line-mode))
  (add-hook 'epresent-start-presentation-hook
            'my/epresent-start-presentation-hook)
  (setq epresent-mode-line nil))

;; Prettify symbols.
(setq org-pretty-entities t
      org-fontify-whole-heading-line t
      org-src-tab-acts-natively t
      org-src-fontify-natively t
      org-fontify-quote-and-verse-blocks t
      org-ellipsis "↴")

;; Increase size of latex previews.
(setq org-format-latex-options
      (plist-put org-format-latex-options :scale 1.25))

(defun open-todos-other-frame ()
  (interactive)
  (find-file-other-frame "~/org/todo.org"))

(defun my/org-mode-hook ()
  (interactive)
  (org-bullets-mode 1)

  (setq-local line-spacing 0.1)
  (setq-local left-margin-width 2)
  (setq-local right-margin-width 2)
  (linum-mode -1)
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

;; Faces
(set-face-attribute 'org-level-1 nil
                    :weight 'semi-light
                    :slant 'normal
                    :height 1.0)

(set-face-attribute 'org-level-2 nil
                    :weight 'semi-light
                    :slant 'normal
                    :height 1.0)

(set-face-attribute 'org-level-3 nil
                    :weight 'semi-light
                    :slant 'normal
                    :height 1.05)

(set-face-attribute 'org-level-4 nil
                    :weight 'semi-light
                    :slant 'normal
                    :height 1.0)

(set-face-attribute 'org-level-5 nil
                    :weight 'semi-light
                    :slant 'normal
                    :height 1.0)

(set-face-attribute 'org-quote nil
                    :slant 'italic)

(set-face-attribute 'org-done nil
                    :strike-through t)

(set-face-attribute 'org-block-begin-line nil
                    :height 1.0)

(set-face-attribute 'org-block-end-line nil
                    :height 1.0)

(set-face-attribute 'org-done nil
                    :strike-through t)

(provide 'org-init)
