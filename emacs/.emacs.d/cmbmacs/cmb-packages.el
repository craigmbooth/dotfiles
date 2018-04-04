;;;Repositories for emacs packages
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(require 'package)
(require 'cl)

;;; Packages to be installed by package
(defvar cmb-packages
  '(zenburn-theme
    flatland-theme
    ace-jump-mode
    guru-mode
    python-mode
    groovy-mode
    markdown-mode
    php-mode
    autopair
    auto-dim-other-buffers
    diminish
    highlight-indentation
    pymacs
    rainbow-delimiters
    yasnippet
    )
  "Ensure all the following packages are installed via package manager.")

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

(package-initialize)

(defun cmb-packages-installed-p ()
  (loop for p in cmb-packages
        when (not (package-installed-p p)) do (return nil)
        finally (return t)))

;;Loop over packages and if one is not found, install it:
(unless (cmb-packages-installed-p)
  ;; check for new packages (package versions)
  (message "%s" "Emacs is now refreshing its package database...")
  (package-refresh-contents)
  (message "%s" " done.")
  ;; install the missing packages
  (dolist (p cmb-packages)
    (when (not (package-installed-p p))
      (package-install p))))

(provide 'cmb-packages)
