;; (use-package gruvbox-theme
;;   :ensure t
;;   :config
;;   (load-theme 'gruvbox-light-hard t)
;;   (let ((line (face-attribute 'mode-line :underline)))
;;     (set-face-attribute 'mode-line          nil :overline   line)
;;     (set-face-attribute 'mode-line-inactive nil :overline   line)
;;     (set-face-attribute 'mode-line-inactive nil :underline  line)
;;     (set-face-attribute 'mode-line          nil :box        nil)
;;     (set-face-attribute 'mode-line-inactive nil :box        nil)
;;     (set-face-attribute 'mode-line          nil :background "#f2e5bc")
;;     (set-face-attribute 'mode-line-inactive nil :background "#ebdbb2")))

;; (use-package dakrone-light-theme
;;   :ensure t
;;   :config
;;   (load-theme 'dakrone-light t))

(use-package nord-theme
  :ensure t
  :config
  (if (daemonp)
      (add-hook 'after-make-frame-functions
                (lambda (frame)
                  (select-frame frame)
                  (load-theme 'nord t)))
    (load-theme 'nord t)))

;; (use-package spacemacs-theme
;;   :ensure t
;;   :config
;;   (if (daemonp)
;;       (add-hook 'after-make-frame-functions
;;                 (lambda (frame)
;;                   (select-frame frame)
;;                   (load-theme 'spacemacs-light t)))
;;     (load-theme 'spacemacs-light t)))

(use-package moody
  :ensure t
  :config
  (setq x-underline-at-descent-line t)
  (moody-replace-mode-line-buffer-identification)
  (moody-replace-vc-mode))

(use-package minions
  :ensure t
  :config
  (minions-mode 1))

(let ((h (system-name)))
  (cond ((at-home-p)
         (set-face-attribute 'default nil
                             :family "Iosevka"
                             :height 110
                             :weight 'normal
                             :width 'normal))
        ((at-thinkpad-p)
         (set-face-attribute 'default nil
                              :family "Iosevka"
                              :height 100
                              :weight 'bold
                              :width 'normal))
         ((at-work-p)
          (set-face-attribute 'default nil
                              :family "Iosevka"
                              :height 100
                              :weight 'normal
                              :width 'normal))))

(setq frame-title-format `("%b@emacs" ,(number-to-string emacs-major-version)))

(provide 'theme-init)
