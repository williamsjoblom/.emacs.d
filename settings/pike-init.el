(c-add-style "pike"
             '((c-basic-offset . 4 )
               (c-comment-only-lines-offset . (0 . 0))
               (c-indent-comments-syntactically-p . t)
               (indent-tabs-mode . nil)
               (c-offsets-alist .
                                ((defun-open          . c-indent-one-line-block)
                                 (class-open          . c-indent-one-line-block)
                                 (inline-open         . c-indent-one-line-block)
                                 (topmost-intro-cont  . 0)
                                 (brace-list-open     . c-indent-one-line-block)
                                 (brace-list-close    . c-lineup-close-paren)
                                 (statement-case-open . +)
                                 (substatement-open   . c-indent-one-line-block)
                                 (case-label          . +)
                                 (label               . 0)
                                 (arglist-intro       . +)
                                 (arglist-close       . c-lineup-close-paren)
                                 (extern-lang-open    . c-indent-one-line-block)))))

(defun pike-doc-comment ()
  "Insert pike doc comment."
  (interactive)
  (beginning-of-line)
  (open-line 1)
  (indent-according-to-mode)
  (let* ((indent (current-column)))
    (insert "//! ")
    (indent-to indent)
    (end-of-line 1)))

(defun my/pike-mode-hook ()
  (setq c-default-style "bsd"
        c-basic-offset 4)

  (hl-todo-mode)

  (flyspell-prog-mode)
  (define-key flyspell-mode-map (kbd "C-.") nil)
  (define-key flyspell-mode-map (kbd "C-,") nil)

  (local-set-key (kbd "C-c i") 'indent-buffer)
  (column-number-mode)

  (local-set-key (kbd "C-M-k") 'pike-doc-comment)
  (local-set-key (kbd "C-M-j") 'c-block-comment)

  (c-set-style "pike"))

(add-hook 'pike-mode-hook 'my/pike-mode-hook)

(provide 'pike-init)
