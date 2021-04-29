;; Remove GUI bloat
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(setq inhibit-splash-screen t)

;; Line numbering
(global-linum-mode t)

;; Disable ear damage
(setq visible-bell t)

;; Autofollow symlinks
(setq vc-follow-symlinks t)

;; Disable autosaving
(setq auto-save-default nil)

;; Use spaces instead of tabs.
(setq-default indent-tabs-mode nil)

;; Enable highlighting of matching parenteses.
(show-paren-mode 1)

;; Enable undo/redo for window modifications.
(winner-mode)

(defun first-trailing-whitespace ()
  (string-match-p "\\s-$"
                  (buffer-substring-no-properties
                   (point-min) (point-max))))

(defun maybe-add-delete-trailing-whitespace-hook ()
  (unless (first-trailing-whitespace)
    (add-hook 'before-save-hook 'delete-trailing-whitespace 0 t)))

;; Kill trailing whitespace on save if the buffer does not contain any
;; trailing whitespace when opened.
(add-hook 'prog-mode-hook 'maybe-add-delete-trailing-whitespace-hook)

;; Save system clipboard to kill ring before kill.
(setq save-interprogram-paste-before-kill t)

(setq-default fill-column 80)

;; Skip the step of writing "yes <return>" and settle with writing "y" instead
;; for yes/no prompts.
(defalias 'yes-or-no-p 'y-or-n-p)

;; Shrink left fringe!
(set-window-fringes nil 5 nil nil t)

;; Case sensitive search
(setq case-fold-search nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Scrolling
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq scroll-margin 0)

;; Disable scroll acceleration.
(setq mouse-wheel-progressive-speed t)

;; Always redraw while scrolling.
(setq fast-but-imprecise-scrolling nil)
(setq jit-lock-defer-time 0)

(provide 'base)
