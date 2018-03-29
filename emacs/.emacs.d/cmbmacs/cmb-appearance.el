;; Zenburn theme with electric pink cursor
(when (> emacs-major-version 23)
(progn
  (load-theme 'flatland t)
  (add-to-list 'default-frame-alist '(cursor-color . "#f00bac"))
))

;; Stop the cursor from blinking
(blink-cursor-mode -1)

;; Always show column number
(column-number-mode 1)

;; Dim inactive buffers.  Default dim face is a black background, make
;; this gray.
(auto-dim-other-buffers-mode 1)
(set-face-attribute 'auto-dim-other-buffers-face nil :background "#1B1B1B")

;; Change appearance of the fringes to show extent of buffer
(setq-default indicate-buffer-boundaries 'left)
(setq-default indicate-empty-lines +1)

;; Make the cursor stretch when it's on a wide-char like a tab:
(setq x-stretch-cursor t)

;; When opening two files with the same name, don't name
;; the second one file<2>, instead prepend the directory
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;; highlight matching parens
(show-paren-mode 1)

;; put emacs: [buffer name] in frame title
(setq frame-title-format
  '("emacs: " (buffer-file-name "%f"
    (dired-directory dired-directory "%b"))))

;; Define a function that toggles fullscreen
(defun toggle-fullscreen ()
  "Toggle full screen on X11"
  (interactive)
  (when (eq window-system 'x)
    (set-frame-parameter
     nil 'fullscreen
     (when (not (frame-parameter nil 'fullscreen)) 'fullboth))))

;; Ensure correct encoding system
(prefer-coding-system 'utf-8)
(set-language-environment 'utf-8)
(set-default-coding-systems 'utf-8)
(set-selection-coding-system 'utf-8)
(set-locale-environment "en_US.UTF-8")

;; Set default opacity to 100% and define a function to turn
;; it down to 85%.  The function is bound to a key in cmb-keybindings.el
(set-frame-parameter (selected-frame) 'alpha '(100 100))
(defun toggle-transparency ()
   (interactive)
   (if (/=
        (cadr (frame-parameter nil 'alpha))
        100)
       (set-frame-parameter nil 'alpha '(100 100))
     (set-frame-parameter nil 'alpha '(85 50))))

(provide 'cmb-appearance)
