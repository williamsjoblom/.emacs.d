;; Previous window
(defun prev-window ()
  (interactive)
  (other-window -1))

;; Indent buffer.
(defun indent-buffer ()
  (interactive)
  (save-excursion
    (indent-region (point-min) (point-max) nil)))

;;
;; Recently killed buffers
;;
(defvar killed-file-list nil
  "List of recently killed files.")

(defun add-file-to-killed-file-list ()
  "If buffer is associated with a file name, add that file to the
`killed-file-list' when killing the buffer."
  (when buffer-file-name
    (push buffer-file-name killed-file-list)))

(add-hook 'kill-buffer-hook #'add-file-to-killed-file-list)

(defun reopen-killed-file ()
  "Reopen the most recently killed file, if one exists."
  (interactive)
  (when killed-file-list
    (find-file (pop killed-file-list))))

(defun reopen-killed-file-fancy ()
  "Pick a file to revisit from a list of files killed during this Emacs session."
  (interactive)
  (if killed-file-list
      (let ((file (completing-read "Reopen killed buffer: " killed-file-list
                                   nil nil nil nil (car killed-file-list))))
        (when file
          (setq killed-file-list (cl-delete file killed-file-list :test #'equal))
          (find-file file)))
    (error "No recently-killed buffers to reopen")))

;;
;; Reload dir locals
;;
(defun reload-dir-locals-current-buffer ()
  "Reload dir locals for the current buffer"
  (interactive)
  (let ((enable-local-variables :all))
    (hack-dir-local-variables-non-file-buffer)))

(defun reload-dir-locals ()
  "For every buffer with the same `default-directory` as the
current buffer's, reload dir-locals."
  (interactive)
  (let ((dir default-directory))
    (dolist (buffer (buffer-list))
      (with-current-buffer buffer
        (when (equal default-directory dir))
        (reload-dir-locals-current-buffer)))))


;; Insert C doc comment.
(defun c-doc-comment ()
  (interactive)
  (beginning-of-line)
  (open-line 1)
  (indent-according-to-mode)
  (let* ((indent (current-column)))
    (insert "/**\n")
    (indent-to indent)
    (insert " * \n")
    (indent-to indent)
    (insert " */")
    (end-of-line 0)))


;; Insert C block comment
(defun c-block-comment ()
  (interactive)
  (beginning-of-line)
  (open-line 1)
  (indent-according-to-mode)
  (let* ((indent (current-column))
	 (stars (make-string (- 64 indent) ?*)))
    (insert "/")
    (insert stars "\n")
    (indent-to indent)
    (insert " * \n")
    (indent-to indent)
    (insert " " stars "/")
    (end-of-line 0)))

(defun eval-and-kill-last-sexp ()
  "Eval and kill sexp before point; print value to buffer"
  (interactive)
  (backward-kill-sexp)
  (let ((sexp (current-kill 0)))
    (condition-case nil
        (prin1 (eval (read sexp))
               (current-buffer))
      (error (undo)))))

(defun copy-to-markdown-snippet ()
  "Copy region to markdown snippet"
  (interactive)
  (when (region-active-p)
    (let ((region (buffer-substring-no-properties
                   (region-beginning)
                   (region-end))))
      (if (= (count-lines (region-beginning) (region-end)) 1)
          (kill-new (concat "`" region "`"))
        (kill-new (concat "```\n" region "```\n"))))
    (pop-mark)))

(defun first-matching-buffer (regexp)
  "First buffer matching the given regexp"
  (require 'seq)
  (car (seq-filter (apply-partially #'string-match-p regexp)
                   (mapcar 'buffer-name (buffer-list)))))

(defun save-project-relative-line ()
    "Save the current file path (relative to projectile root)
along with the current line number"
  (interactive)
  (kill-new (format "%s:%d"
                    (file-relative-name
                     (buffer-file-name (current-buffer))
                     (projectile-project-root))
                    (line-number-at-pos))))

(defun sudo-find-file (file)
  "Open FILE as root."
  (interactive "FOpen file as root: ")
  (when (file-writable-p file)
    (user-error "File is user writeable, aborting sudo"))
  (find-file (if (file-remote-p file)
                 (concat "/" (file-remote-p file 'method) ":"
                         (file-remote-p file 'user) "@"
                         (file-remote-p file 'host)
                         "|sudo:root@"
                         (file-remote-p file 'host) ":"
                         (file-remote-p file 'localname))
               (concat "/sudo:root@localhost:" file))))

(provide 'general-funs)
