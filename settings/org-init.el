;; Syntax highlighting for code blocks.
(setq org-src-fontify-natively t)
(setq org-src-tab-acts-natively t)

;; Prettify symbols.
(setq org-pretty-entities t)

(add-to-list 'org-emphasis-alist
             '("_" (:foreground "red")))

(provide 'org-init)
