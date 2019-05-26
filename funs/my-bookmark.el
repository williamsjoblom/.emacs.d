
(defun my/bookmark-set (name)
  "Set bookmark named bookmark to current point."
  (interactive "MSet bookmark: ")
  (let* ((point (point))
         (entry (cons name (cons buffer-file-name point))))
    ;; Remove previous bookmark bound to 'name' if present.
    (setq my/bookmark-list
          (delq (assoc name my/bookmark-list) my/bookmark-list))
    ;; Push new value
    (push entry my/bookmark-list)))


(defun my/bookmark-jump (name)
  "Set bookmark named bookmark to current point."
  (interactive "MJump to bookmark: ")
  (let ((bookmark (assoc name my/bookmark-list)))
    (if bookmark
        (progn
          (switch-to-buffer (find-file-noselect
                             (my/bookmark-file-name bookmark)))
          (goto-char (my/bookmark-point bookmark)))
      (message "Bookmark \"" name "\" not set"))))


;;--------------------------------------------------------------------------------
;; Save/load.
;;--------------------------------------------------------------------------------

(defun my/bookmark-save-all ()
  (save-excursion
    (let ((buffer (find-file-noselect
                   (my/bookmark-file))))
      (switch-to-buffer buffer)
      (erase-buffer)
      (goto-char (point-min))
      (insert "(setq my/bookmark-list '(\n")

      (dolist (bookmark my/bookmark-list)
        (insert "  ") ;; Indentation for readability.
        (my/bookmark-append bookmark))
      
      (insert "))")
      (save-buffer)
      (kill-buffer))))


(defun my/bookmark-append (bookmark)
  (let ((name (my/bookmark-name bookmark))
        (file-name (my/bookmark-file-name bookmark))
        (p (my/bookmark-point bookmark)))
    (insert "(\"" name "\" . (\"" file-name "\" . " (number-to-string p) "))\n")))


(defun my/bookmark-load-all ()
  (interactive)
  (save-excursion
    (let ((buffer (find-file-noselect
                   (my/bookmark-file))))
      (eval-buffer buffer)
      (kill-buffer buffer))))

;;--------------------------------------------------------------------------------
;; Variables.
;;--------------------------------------------------------------------------------

(defvar my/bookmark-list nil)

;;--------------------------------------------------------------------------------
;; Paths.
;;--------------------------------------------------------------------------------
(defun my/bookmark-file ()
  "Get path of global bookmarks file."
  (concat
     (file-name-as-directory user-emacs-directory)
     ".bookmarks"))

;;--------------------------------------------------------------------------------
;; Utility.
;;--------------------------------------------------------------------------------

(defun my/bookmark-name (bookmark)
  "Get name of bookmark."
  (car bookmark))

(defun my/bookmark-file-name (bookmark)
  "Get file name from bookmark."
  (car (cdr bookmark)))

(defun my/bookmark-point (bookmark)
  "Get point from bookmark."
  (cdr (cdr bookmark)))


(defun my/bookmark-set-f1 ()
  "Set bookmark for <f1> key."
  (interactive)
  ;; (setq my/bookmark-list nil)
  (my/bookmark-set "f1"))

(defun my/bookmark-jump-f1 ()
  "Set bookmark for <f1> key."
  (interactive)
  ;; (setq my/bookmark-list nil)
  (my/bookmark-jump "f1"))

(provide 'my-bookmark)
