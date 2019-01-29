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

(setq-default indent-tabs-mode nil)

;; Enable highlighting of matching parenteses.
(show-paren-mode 1)

;; Enable undo/redo for window modifications.
(winner-mode)

(provide 'base)
