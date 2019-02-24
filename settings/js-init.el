(use-package js2-mode
  :ensure t
  :mode "\\.js\\'"
  :bind (:map global-map
	      ("C-M-k" . c-doc-comment)
	      ("C-M-j" . c-block-comment)))

(use-package rjsx-mode
  :ensure t
  :after js2-mode
  :mode "\\.jsx\\'")

(provide 'js-init)
