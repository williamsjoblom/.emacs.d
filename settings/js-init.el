(use-package tide
  :ensure t)

(defun setup-tide ()
  "Setup tide-mode and friends for current buffer"
  (interactive)
  (tide-setup)

  (flycheck-mode 1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))

  (eldoc-mode 1)
  (tide-hl-identifier-mode 1)
  (company-mode 1))

(add-hook 'js-mode-hook #'setup-tide)

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
