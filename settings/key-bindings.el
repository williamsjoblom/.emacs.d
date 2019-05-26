;; Buffer switching.
(global-set-key (kbd "C-M-.") 'next-buffer)
(global-set-key (kbd "C-M-,") 'previous-buffer)

;; Window switching.
(global-set-key (kbd "C-.") 'other-window)
(global-set-key (kbd "C-,") 'prev-window)

;; Unbind pageup and pagedown
(global-unset-key (kbd "<next>"))
(global-unset-key (kbd "<prior>"))

;; Don't show buffer kill prompt.
(global-set-key (kbd "C-x k") 'kill-this-buffer)

;; Poker3 bindings
(global-set-key (kbd "H-i") 'previous-line)
(global-set-key (kbd "H-k") 'next-line)
(global-set-key (kbd "H-l") 'right-char)
(global-set-key (kbd "H-j") 'left-char)
(global-set-key (kbd "H-M-i") 'backward-paragraph)
(global-set-key (kbd "H-M-k") 'forward-paragraph)
(global-set-key (kbd "H-M-l") 'right-word)
(global-set-key (kbd "H-M-j") 'left-word)

(global-set-key (kbd "M-<left>") 'left-word)
(global-set-key (kbd "M-<up>") 'backward-paragraph)
(global-set-key (kbd "M-<down>") 'forward-paragraph)
(global-set-key (kbd "M-<right>") 'right-word)

;; Allows reopening recently killed buffers with C-x j and C-x C-j
(global-set-key (kbd "C-x j") 'reopen-killed-file)
(global-set-key (kbd "C-x C-j") 'reopen-killed-file-fancy)

(global-set-key (kbd "C-]") 'comment-or-uncomment-region)

;; Bookmark bindings
(global-set-key (kbd "<f1>") (lambda () (interactive) (bookmark-jump "f1")))
(global-set-key (kbd "<f2>") (lambda () (interactive) (bookmark-jump "f2")))
(global-set-key (kbd "<f3>") (lambda () (interactive) (bookmark-jump "f3")))
(global-set-key (kbd "<f4>") (lambda () (interactive) (bookmark-jump "f4")))
(global-set-key (kbd "<f5>") (lambda () (interactive) (bookmark-jump "f5")))
(global-set-key (kbd "<f6>") (lambda () (interactive) (bookmark-jump "f6")))
(global-set-key (kbd "<f7>") (lambda () (interactive) (bookmark-jump "f7")))
(global-set-key (kbd "<f8>") (lambda () (interactive) (bookmark-jump "f8")))
(global-set-key (kbd "<f9>") (lambda () (interactive) (bookmark-jump "f9")))
(global-set-key (kbd "<f10>") (lambda () (interactive) (bookmark-jump "f10")))
(global-set-key (kbd "<f11>") (lambda () (interactive) (bookmark-jump "f11")))
(global-set-key (kbd "<f12>") (lambda () (interactive) (bookmark-jump "f12")))


(global-set-key (kbd "C-<f1>") (lambda () (interactive) (bookmark-set "f1")))
(global-set-key (kbd "C-<f2>") (lambda () (interactive) (bookmark-set "f2")))
(global-set-key (kbd "C-<f3>") (lambda () (interactive) (bookmark-set "f3")))
(global-set-key (kbd "C-<f4>") (lambda () (interactive) (bookmark-set "f4")))
(global-set-key (kbd "C-<f5>") (lambda () (interactive) (bookmark-set "f5")))
(global-set-key (kbd "C-<f6>") (lambda () (interactive) (bookmark-set "f6")))
(global-set-key (kbd "C-<f7>") (lambda () (interactive) (bookmark-set "f7")))
(global-set-key (kbd "C-<f8>") (lambda () (interactive) (bookmark-set "f8")))
(global-set-key (kbd "C-<f9>") (lambda () (interactive) (bookmark-set "f9")))
(global-set-key (kbd "C-<f10>") (lambda () (interactive) (bookmark-set "f10")))
(global-set-key (kbd "C-<f11>") (lambda () (interactive) (bookmark-set "f11")))
(global-set-key (kbd "C-<f12>") (lambda () (interactive) (bookmark-set "f12")))

(provide 'key-bindings)
