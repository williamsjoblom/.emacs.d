;; Remove GUI bloat
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(setq inhibit-splash-screen t)

;; Line numbering
(global-linum-mode t)

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

;; Disable scroll acceleration.
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1) ((control) . nil)))

;; Kill trailing whitespace on save.
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(provide 'base)
