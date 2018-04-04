(require 'python-mode)
(require 'highlight-indentation)

(defun activate-cmb-python-settings ()
  "This function to be called from python-mode-hook sets the
  required modes"
  (progn
    (message "Entering Python mode")

    (rainbow-delimiters-mode +1)
    (add-hook 'before-save-hook 'delete-trailing-whitespace)
    ; Highlight trailing whitespace and lines over 80 characters
    (setq whitespace-line-column 80
          whitespace-style '(face tabs trailing lines-tail))
    (highlight-indentation-mode +1)
    (diminish 'highlight-indentation-mode)
    (whitespace-mode +1)
    (diminish 'whitespace-mode)    
    (message "Completed entering Python mode")))

(add-hook 'python-mode-hook 'activate-cmb-python-settings)

(require 'yasnippet)
(yas-global-mode 1)

(provide 'cmb-python)
