(defun my/notmuch-show-view-as-patch ()
  "View the the current message as a patch."
  (interactive)
  (let* ((id (notmuch-show-get-message-id))
         (msg (notmuch-show-get-message-properties))
         (part (notmuch-show-get-part-properties))
         (subject (concat "Subject: " (notmuch-show-get-subject) "\n"))
         (diff-default-read-only t)
         (buf (get-buffer-create (concat "*notmuch-patch-" id "*")))
         (map (make-sparse-keymap)))
    (define-key map "q" 'notmuch-bury-or-kill-this-buffer)
    (switch-to-buffer buf)
    (let ((inhibit-read-only t))
      (erase-buffer)
      (insert subject)
      (insert (notmuch-get-bodypart-text msg part nil)))
    (set-buffer-modified-p nil)
    (diff-mode)
    (lexical-let ((new-ro-bind (cons 'buffer-read-only map)))
                 (add-to-list 'minor-mode-overriding-map-alist new-ro-bind))
    (goto-char (point-min))))

(use-package notmuch
  :ensure t
  :config
  (setq notmuch-fcc-dirs "sent +sent -unread -inbox")
  (setq notmuch-show-logo nil)
  (setq notmuch-hello-auto-refresh t)
  (define-key 'notmuch-show-part-map "d" 'my/notmuch-show-view-as-patch))

(use-package notmuch-indicator
  :ensure t
  :config
  (setq notmuch-indicator-args
        '((:terms "tag:unread and tag:inbox" :label "📥 " :face bold)))
  (notmuch-indicator-mode))

(setq mail-user-agent 'message-user-agent)
(setq message-send-mail-function 'smtpmail-send-it
      smtpmail-stream-type 'starttls
      smtpmail-smtp-server "mail.cendio.se"
      smtpmail-smtp-service 587)

(defun my/insert-email-signature ()
  (interactive)
  (save-excursion
    (insert "Best regards,\n")
    (insert "--\n")
    (insert "William Sjöblom\n")
    (insert "Cendio AB               https://cendio.com\n")
    (insert "Teknikringen 8          https://x.com/ThinLinc\n")
    (insert "583 30 Linköping        https://facebook.com/ThinLinc\n")
    (insert "Sweden\n")
    (insert "Phone: +46-13-214600\n")))

(defun my/insert-lenny ()
  (interactive)
  (insert "( ͡° ͜ʖ ͡°)"))

(define-key notmuch-message-mode-map (kbd "C-c C-s") 'my/insert-email-signature)
(define-key notmuch-message-mode-map (kbd "C-c C-l") 'my/insert-lenny)

(define-key notmuch-show-mode-map "r" 'notmuch-show-reply)
(define-key notmuch-show-mode-map "R" 'notmuch-show-reply-sender)

(defun my/open-tracker-thread-in-browser ()
  (interactive)
  (let ((subject-line (notmuch-show-get-subject)))
    (string-match "issue\\([[:digit:]]+\\)" subject-line)
    (let ((issue-number (match-string 1 subject-line)))
      (browse-url (concat "https://tracker.lkpg.cendio.se/tracker/issue"
                          issue-number)))))

(defun my/set-correct-issue-tracker-recipient ()
  "As the Cendio issue tracker handles sending email to correct
recipients, rewrite To: to always point at the tracker for
responses starting containing '[issueXXXX]'"
  (save-excursion
    (goto-char (point-min))
    (let ((allowed-recipient "support@cendio.se"))
      (when (re-search-forward "^Subject:.* \\[issue[0-9]+\\]" nil t)
        (goto-char (point-min))
        (when (re-search-forward "^To:.*" nil t)
          (replace-match "To: support@cendio.se") t)))))

(add-hook 'message-setup-hook #'my/set-correct-issue-tracker-recipient)

(define-key notmuch-show-mode-map (kbd "C-c C-t")
            'my/open-tracker-thread-in-browser)

;; LanguageTool API keys are in .gitignore, therefore LanguageTool may not
;; always be available. If not, fall back of flyspell mode.
(if (fboundp 'my/languagetool-server-mode)
    (add-hook 'message-mode-hook 'my/languagetool-server-mode)
  (add-hook 'message-mode-hook 'flyspell-mode))

(add-hook 'notmuch-hello-refresh-hook
          (lambda ()
            (if (and (eq (point) (point-min))
                     (search-forward "Saved searches:" nil t))
                (progn
                  (forward-line)
                  (widget-forward 1))
              (if (eq (widget-type (widget-at)) 'editable-field)
                  (beginning-of-line)))))

(provide 'email-init)
