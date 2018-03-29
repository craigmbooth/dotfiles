(defun smarter-move-beginning-of-line (arg)
  "Move point back to indentation of beginning of line.

Move point to the first non-whitespace character on this line.
If point is already there, move to the beginning of the line.
Effectively toggle between the first non-whitespace character and
the beginning of the line.

If ARG is not nil or 1, move forward ARG - 1 lines first.  If
point reaches the beginning or end of the buffer, stop there."
  (interactive "^p")
  (setq arg (or arg 1))

  ;; Move lines first
  (when (/= arg 1)
    (let ((line-move-visual nil))
      (forward-line (1- arg))))

  (let ((orig-point (point)))
    (back-to-indentation)
    (when (= orig-point (point))
      (move-beginning-of-line 1))))

;; remap C-a to `smarter-move-beginning-of-line'
(global-set-key [remap move-beginning-of-line]
                'smarter-move-beginning-of-line)

;; Edit files on other machines
(require 'tramp)
(setq tramp-default-method "ssh")

;;Interactively do things.  Better autocompleteion
(require 'ido)
(ido-mode t)

;;allow ~ to take you directly home in ido-find-file
(add-hook 'ido-setup-hook
 (lambda ()
   ;; Go straight home
   (define-key ido-file-completion-map
     (kbd "~")
     (lambda ()
       (interactive)
       (if (looking-back "/")
           (insert "~/")
         (call-interactively 'self-insert-command))))))


;; allow shorter answers than [yes] or [no]
(defalias 'yes-or-no-p 'y-or-n-p)

;; always indent with spaces
(setq-default indent-tabs-mode nil)

;; Move the *~ files to ~/.emacs.d/saves/
(unless (file-exists-p "~/.emacs.d/saves/")
  (make-directory "~/.emacs.d/saves/"))

(setq
   backup-by-copying t      ; don't clobber symlinks
   backup-directory-alist
    '(("." . "~/.emacs.d/saves/"))    ; don't litter my fs tree
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 2
   version-control t)       ; use versioned backups

;;Enable windmove bindings so that shift-<direction> moves
;;Between buffers
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

;;Suppress use of arrow keys:
(require 'guru-mode)
(guru-global-mode +1)

;; Undo/redo window configuration with C-c <left>/<right>
(winner-mode 1)

;; Less idiosyncratic scrolling behavior
(setq redisplay-dont-pause t
      scroll-margin 1
      scroll-step 1
      scroll-conservatively 10000
      scroll-preserve-screen-position 1)

;; Settings for navigating the web with w3m
(setq browse-url-browser-function 'w3m-browse-url)
(setq w3m-default-display-inline-images t)

;; Use C-c [SPC] to enter ace-jump-mode
(require 'ace-jump-mode)
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

;; Automatically close off parens
(require 'autopair)
(autopair-global-mode 1)

;; On a Mac, make the Meta key into option:
(setq mac-option-key-is-meta nil)
(setq mac-command-key-is-meta t)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)

;; If you open a file in a non-existent directory, offer to create it
;; http://iqbalansari.github.io/blog/2014/12/07/automatically-create-parent-directories-on-visiting-a-new-file-in-emacs/
(defun my-create-non-existent-directory ()
      (let ((parent-directory (file-name-directory buffer-file-name)))
        (when (and (not (file-exists-p parent-directory))
                   (y-or-n-p (format "Directory `%s' does not exist! Create it?" parent-directory)))
          (make-directory parent-directory t))))

(add-to-list 'find-file-not-found-functions #'my-create-non-existent-directory)

(provide 'cmb-navigation)
