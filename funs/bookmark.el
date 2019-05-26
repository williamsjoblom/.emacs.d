
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
;; Variables.
;;--------------------------------------------------------------------------------

(defvar my/bookmark-list nil)

;;--------------------------------------------------------------------------------
;; Paths.
;;--------------------------------------------------------------------------------

(defun my/bookmark-current-file ()
  "Get path of local bookmarks file (or global file if not in a project)."
  (if (projectile-project-root)
      (concat
       (file-name-as-directory (projectile-project-root))
       ".project-bookmarks")
    (my/bookmark-global-file)))

(defun my/bookmark-global-file ()
  "Get path of global bookmarks file."
  (concat
     (file-name-as-directory user-emacs-directory)
     ".global-bookmarks"))

;;--------------------------------------------------------------------------------
;; Utility.
;;--------------------------------------------------------------------------------

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

(global-set-key (kbd "<f1>") 'my/bookmark-jump-f1)
(global-set-key (kbd "C-<f1>") 'my/bookmark-set-f1)
