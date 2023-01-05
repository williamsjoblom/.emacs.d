;; Machine predicates.
(defun at-home-p ()
  (string= (system-name) "tesla"))

(defun at-thinkpad-p ()
  (string= (system-name) "maxwell"))

(defun at-work-p ()
  (string= (system-name) "wilsj"))

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

;; Increase for lsp-mode:
(setq read-process-output-max (* 1024 1024))

(setq create-lockfiles nil)

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

;;; Load configuration without dependencies.
(require 'base)

;;; Initialize 'use-package'.
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
;; (add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
;; (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
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
(require 'cmake-init)
(require 'python-init)
(require 'glsl-init)
(require 'pike-init)
(require 'eshell-init)
(require 'dired-init)
(require 'multiple-cursors-init)
(require 'yas-init)
(require 'pdf-init)
(require 'latex-init)
(require 'java-init)
(require 'avy-init)

(require 'moinmoin-mode nil 'noerror)

;; Work related thingies:
(setq bug-reference-url-format
      "https://www.cendio.com/bugzilla/show_bug.cgi?id=%s")
(setq ctc-path "/local/home/wilsj/ctc/")
(setq tl-prefix "/opt/thinlinc/")

(setq cendio-emacs-dir (expand-file-name "cendio-emacs" user-emacs-directory))
(add-to-list 'load-path cendio-emacs-dir)

(require 'cendio-emacs-base nil 'noerror)
(require 'cendio-bz nil 'noerror)
(global-set-key (kbd "C-x M-b") 'bz-transient)

;; Load API keys from secret.el if present on the system.
(require 'secret nil 'noerror)

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
   '("bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "37768a79b479684b0756dec7c0fc7652082910c37d8863c35b702db3f16000f8" "c0a0c2f40c110b5b212eb4f2dad6ac9cac07eb70380631151fa75556b0100063" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "1d78d6d05d98ad5b95205670fe6022d15dabf8d131fe087752cc55df03d88595" "b583823b9ee1573074e7cbfd63623fe844030d911e9279a7c8a5d16de7df0ed0" "9129c2759b8ba8e8396fe92535449de3e7ba61fd34569a488dd64e80f5041c9f" default))
 '(hl-todo-highlight-punctuation ":!.")
 '(package-selected-packages
   '(exec-path-from-shell speed-type dired-narrow editorconfig po-mode python-pytest ayu-theme spacemacs-theme github-theme string-inflection fill-column-indicator htmlize which-key expand-region org-bullets multiple-cursors matlab-mode minions moody doom-modeline poet-theme highlight-escape-sequences gruvbox-theme hl-todo highlight2clipboard dashboard all-the-icons counsel-tramp yasnippet counsel-spotify ivy-rich gist glsl-mode company-anaconda anaconda-mode kotlin-mode flycheck-kotlin cmake-font-lock rjsx-mode dap-mode projectile-ripgrep flycheck flycheck-mode lsp-ui cquery company-lsp use-package swiper company)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'narrow-to-region 'disabled nil)
(put 'upcase-region 'disabled nil)
