(setq bug-reference-url-format "https://www.cendio.com/bugzilla/show_bug.cgi?id=%s")
(setq ctc-path "/local/home/wilsj/ctc/")
(setq tl-prefix "/opt/thinlinc/")

(defun cendio/parent-package-dir (path)
  "Base directory of the package where `path' resides."
  (let ((parent-path (file-name-directory (directory-file-name path)))
        (normalized-ctc-path (file-name-as-directory ctc-path)))
    (cond ((string= parent-path normalized-ctc-path) path)
          ((string= parent-path "/") nil)
          (t (cendio/parent-package-dir
              (file-name-directory (directory-file-name path)))))))

(defun cendio/python-test-path (file-path)
  (let* ((test-filename (concat "test_" (file-name-nondirectory file-path)))
         (tests-directory (expand-file-name
                           "tests"
                           (cendio/parent-package-dir file-path))))
    (expand-file-name test-filename tests-directory)))

(defun cendio/python-implementation-path (test-path)
  (let ((parent-package (cendio/parent-package-dir test-path))
        (impl-file (substring (file-name-nondirectory test-path) 5)))
    (car (directory-files-recursively parent-package (concat impl-file "$")))))

(defun cendio/python-test-file-p (test-path)
  (string= "test_" (substring (file-name-nondirectory test-path) 0 5)))

(defun cendio/nearest-makefile (to)
  (let ((dir (locate-dominating-file to "Makefile")))
    (if dir (concat dir "Makefile") nil)))

(defun cendio/find-nearest-makefile ()
  (interactive)
  (find-file (cendio/nearest-makefile default-directory)))

(defun cendio/ctc-to-tl-prefix-path (file)
  (let ((rel-path (file-relative-name file (cendio/parent-package-dir file))))
    (expand-file-name rel-path tl-prefix)))

(defun cendio/find-python-impl-file ()
    "Switch to buffer visiting the implementation file corresponding to
the current open unit test buffer, creating one if none already exists."
  (interactive)
  (find-file (cendio/python-implementation-path (buffer-file-name))))

(defun cendio/find-python-impl-file-other-window ()
    "Switch to buffer visiting the implementation file corresponding to
the current open unit test buffer, creating one if none already exists."
  (interactive)
  (find-file-other-window (cendio/python-implementation-path buffer-file-name)))

(defun cendio/find-python-test-file ()
  "Switch to buffer visiting the unit test file corresponding to
the current open buffer, creating one if none already exists."
  (interactive)
  (find-file (cendio/python-test-path (buffer-file-name))))

(defun cendio/find-python-test-file-other-window ()
  "Switch to buffer visiting the unit test file corresponding to
the current open buffer, creating one if none already exists."
  (interactive)
  (find-file-other-window (cendio/python-test-path (buffer-file-name))))

(defun cendio/find-other-python-file ()
  "Switch to buffer buffer visiting the unit test of the
currently visited implementation file or vice versa."
  (interactive)
  (if (cendio/python-test-file-p (buffer-file-name))
      (cendio/find-python-impl-file)
    (cendio/find-python-test-file)))

(defun cendio/find-other-python-file-other-window ()
  "Switch to buffer buffer visiting the unit test of the
currently visited implementation file or vice versa."
  (interactive)
  (if (cendio/python-test-file-p (buffer-file-name))
      (cendio/find-python-impl-file-other-window)
    (cendio/find-python-test-file-other-window)))

(defun cendio/find-file-in-tl-prefix ()
  (interactive)
  (let ((tl-prefix-file (cendio/ctc-to-tl-prefix-path (buffer-file-name))))
    (if (file-readable-p tl-prefix-file)
        (find-file tl-prefix-file)
      (message (format "Unable to find/read file: %s" tl-prefix-file)))))

(provide 'cendio-init)
;;; cendio-init.el ends here
