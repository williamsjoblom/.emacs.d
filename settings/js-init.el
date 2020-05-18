(use-package company-tern
    :ensure t
    :config
    (add-to-list 'company-backends 'company-tern))

(use-package tern
  :ensure t
  :commands tern-mode
  :after company-tern
  :hook (tern-mode . company-mode)
  :config
  (define-key tern-mode-keymap (kbd "C-M-.") nil)

  (define-key tern-mode-keymap (kbd "M-i") 'tern-find-definition)
  (define-key tern-mode-keymap (kbd "C-M-i") 'tern-pop-find-definition))



(use-package js2-mode
  :ensure t
  :mode
  ("\\.js\\'" . js2-mode)
  :hook (js2-mode . tern-mode)
  :bind (:map global-map
	      ("C-M-k" . c-doc-comment)
	      ("C-M-j" . c-block-comment)))

(use-package rjsx-mode
  :ensure t
  :mode
  ("\\.jsx\\'" . rjsx-mode)
  :hook (rjsx-mode . tern-mode)
  :bind (:map global-map
              ("C-M-k" . c-doc-comment)
	      ("C-M-j" . c-block-comment)))

(provide 'js-init)
