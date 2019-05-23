(use-package yasnippet
  :ensure t)

(use-package gist
  :ensure t
  :bind (("C-c g p" . gist-buffer-private)
         ("C-c g g" . gist-buffer)))

(provide 'misc-init)
