(eval-after-load "auto-dim-other-buffers"
  '(diminish 'auto-dim-other-buffers-mode))

(eval-after-load "guru-mode"
  '(diminish 'guru-mode))


(add-hook 'emacs-lisp-mode-hook
          (lambda ()
            (setq mode-name "elisp")))

(diminish 'abbrev-mode)

(eval-after-load "autopair" '(diminish 'autopair-mode))

(eval-after-load "yasnippet" '(diminish 'yas-minor-mode))

(provide 'cmb-diminish)
