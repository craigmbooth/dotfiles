
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(when (< emacs-major-version 24)
  (message "Will be missing some features with emacs major version < 24"))

(add-to-list 'load-path "~/.emacs.d/cmbmacs/")
(add-to-list 'load-path "~/.emacs.d/local/")

;; Hide menu bar, tool bar, scroll bar and splash screen
;; early on in startup to avoid having these elements flash on then off.
(when (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(setq inhibit-startup-message t)

;;Before trying anything else, initialize packages
(require 'cmb-packages)

;; The following are required in a number of different files
(require 'diminish)
(require 'cl)

(require 'cmb-appearance)  ;; Customized appearance
(require 'cmb-navigation)  ;; Macros for navigating emacs frames and files
(require 'cmb-textedit)    ;; Macros for editing plaintext
(require 'cmb-python)      ;; Settings for editing python
(require 'cmb-php)         ;; Settings for editing PHP
(require 'cmb-keybindings) ;; Remapped keys
(require 'cmb-diminish)    ;; Hide irrelevant minor modes

;; Load files any specific to local machine, which are stored
;; in user-emacs-directory/local/
(setq local-settings-dir
      (concat user-emacs-directory "local/"))
(when (file-exists-p local-settings-dir)
  (mapc 'load (directory-files local-settings-dir nil "^[^#].*el$")))

;; Leave a message saying when Emacs was loaded
(message "Starting up Emacs version %s at %s (PID=%d)"
          emacs-version  (format-time-string "%T %a %d %b %y") (emacs-pid)
)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (groovy-mode yasnippet rainbow-delimiters pymacs highlight-indentation diminish auto-dim-other-buffers autopair php-mode markdown-mode python-mode guru-mode ace-jump-mode flatland-theme zenburn-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
