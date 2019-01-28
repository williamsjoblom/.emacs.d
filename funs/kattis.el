(setq kattis-executable "/home/wax/.local/share/kattis/submit.py")

(defun kattis-submit-silent ()
  "Submit current buffer to kattis."
  (interactive)
  (kattis-submit nil))

(defun kattis-submit-and-open-browser ()
  "Submit current buffer to Kattis and open the result page."
  (interactive)
  (kattis-submit t))

(defun kattis-submit (&optional open-browser)
  (or open-browser (setq open-browser nil))
  (process-send-string
   (start-process "kattis" "*kattis*"
                  "python3" kattis-executable
                  "--force"
                  buffer-file-name)
   (if open-browser "y\n" "n\n")))

(provide 'kattis)
