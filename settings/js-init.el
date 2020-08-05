
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
