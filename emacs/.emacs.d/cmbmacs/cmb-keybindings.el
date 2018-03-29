;; Navigate quickly
(global-set-key "\C-cg" 'goto-line)
(global-set-key "\C-cG" 'goto-char)

;; Auto-comment and uncomment
(global-set-key "\C-cc" 'comment-region)
(global-set-key "\C-cu" 'uncomment-region)


;; Functions defined in cmb-appearance
(global-set-key (kbd "C-c t") 'toggle-transparency)
(global-set-key [f11] 'toggle-fullscreen)

;; Unbind C-z
(global-unset-key (kbd "C-z"))

;; Allow downcase-region
(put 'downcase-region 'disabled nil)

(provide 'cmb-keybindings)
