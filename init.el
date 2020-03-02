;; Bump up the gc-cons-threshold to 256MB during the first 3 seconds
;; after startup. The value is bumped to shave of .5 seconds at
;; startup and then restored to avoid noticable GC pauses during
;; editing.

;; (let ((default-gc-cons-threshold gc-cons-threshold))
;;   (setq gc-cons-threshold (* 256 1024 1024))
;;   (run-with-idle-timer
;;    3 nil
;;    (lambda (default-gc-cons-threshold)
;;      (setq gc-cons-threshold default-gc-cons-threshold)
;;      (message "%S garbage collections during startup"
;;               gcs-done))
;;    default-gc-cons-threshold))

;; NOTE: Scrapped the above reset to `default-gc-cons-threshold` since
;; lsp-mode becomes painfully slow with frequent gc pauses. We now
;; leave the threshold at 128mb.
(setq gc-cons-threshold (* 128 1024 1024))


;;; Start emacs server.
(server-start)

;;; Set ~/workbench/ as default startup directory.
(setq default-directory "~/workbench/")

;;; Add load paths.
;;;; Settings path.
(setq settings-dir
      (expand-file-name "settings" user-emacs-directory))

;;;; Functions dir.
(setq funs-dir
      (expand-file-name "funs" user-emacs-directory))

;;;; Generic load dir.
(setq load-dir
      (expand-file-name "load" user-emacs-directory))


(add-to-list 'load-path settings-dir)
(add-to-list 'load-path funs-dir)
(add-to-list 'load-path load-dir)

(add-to-list 'default-frame-alist
             '(font . "Input Mono-10"))


;;; Load configuration without dependencies.
(require 'base)

;;; Initialize 'use-package'.
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(require 'bind-key)

(require 'theme-init)
(require 'general-funs)
(require 'ivy-init)
(require 'docker-init)
(require 'company-init)
(require 'lsp-init)
(require 'flycheck-init)
(require 'c++-init)
(require 'elisp-init)
(require 'projectile-init)
(require 'compile-init)
(require 'org-init)
(require 'js-init)
(require 'misc-init)
(require 'csharp-init)
(require 'cmake-init)
;; (require 'kotlin-init)
(require 'python-init)
(require 'glsl-init)
(require 'pike-init)
(require 'eshell-init)
(require 'dired-init)
(require 'multiple-cursors-init)
(require 'yas-init)
(require 'pdf-init)

(require 'kattis)

;; Load API keys from secret.el if present on the system.
(require 'secret nil 'noerror)

(setq pike-format-executable
      "/home/williams/workbench/work/tools/format/pike-format.pike")
(require 'pike-format nil 'noerror)

(require 'key-bindings)

;; Scrolling on some mice results in a 'C-M-[()]'
;; bind these to scroll.
(global-set-key (kbd "C-M-(") 'mwheel-scroll)
(global-set-key (kbd "C-M-)") 'mwheel-scroll)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("b583823b9ee1573074e7cbfd63623fe844030d911e9279a7c8a5d16de7df0ed0" "9129c2759b8ba8e8396fe92535449de3e7ba61fd34569a488dd64e80f5041c9f" default)))
 '(hl-todo-highlight-punctuation ":!.")
 '(package-selected-packages
   (quote
    (expand-region org-bullets multiple-cursors matlab-mode minions moody doom-modeline poet-theme highlight-escape-sequences gruvbox-theme hl-todo highlight2clipboard dashboard all-the-icons counsel-tramp yasnippet counsel-spotify ivy-rich gist glsl-mode company-anaconda anaconda-mode kotlin-mode flycheck-kotlin cmake-font-lock rjsx-mode dap-mode projectile-ripgrep flycheck flycheck-mode lsp-ui cquery company-lsp use-package swiper company))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'narrow-to-region 'disabled nil)
