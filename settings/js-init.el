(defun setup-work-node-path ()
  (let ((node-path (expand-file-name "~/.nvm/versions/node/v14.21.1/bin/")))
    (unless (member node-path exec-path)
      (setq exec-path (append exec-path `(,node-path)))
      (setenv "PATH" (concat (getenv "PATH") ":" node-path)))))

(use-package tide
  :ensure t
  :bind (:map global-map
	      ("C-M-k" . c-doc-comment)
	      ("C-M-j" . c-block-comment)))

(defun my/ts-hook ()
  (interactive)

  (when (at-work-p)
    (setup-work-node-path))

  (lsp-mode)
  (flycheck-mode 1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))

  (eldoc-mode 1)
  (company-mode 1))

(use-package typescript-mode
  :ensure t
  :mode ("\\.ts\\'" . typescript-ts-mode)
  :hook (typescript-ts-mode . my/ts-hook))

(defun my/js-hook ()
  "Setup tide-mode and friends for current buffer"
  (interactive)

  (when (at-work-p)
      (setup-work-node-path))

  (tide-setup)

  (flycheck-mode 1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))

  (eldoc-mode 1)
  (tide-hl-identifier-mode 1)
  (company-mode 1))

(add-hook 'js-ts-mode-hook #'my/js-hook)

;; (use-package js2-mode
;;   :ensure t
;;   :mode
;;   ("\\.js\\'" . js2-mode)
;;   ;; :hook (js2-mode . tern-mode)
;;   :hook (js2-mode . setup-tide)
;;   :bind (:map global-map
;; 	      ("C-M-k" . c-doc-comment)
;; 	      ("C-M-j" . c-block-comment)))

;; (use-package rjsx-mode
;;   :ensure t
;;   :mode
;;   ("\\.jsx\\'" . rjsx-mode)
;;   :hook (rjsx-mode . setup-tide)
;;   :bind (:map global-map
;;               ("C-M-k" . c-doc-comment)
;; 	      ("C-M-j" . c-block-comment)))

(provide 'js-init)
