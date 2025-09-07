;;; .emacs --- Initialization file for dumacs
;;; author  dualizm
;;; version 1.0.0
;;; email   ognieff@gmail.com
;;; url     https://github.com/dualizm/dumacs
;;; start   29-09-22

(add-to-list 'load-path "~/.emacs.d/du/")

(load "du-packages.el")
(load "du-settings.el")
(load "du-bind.el")
(load "du-treesit.el")
(load "du-js.el")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(company-box diff-hl eslintd-fix lsp-ui magit prettier-js
                 rainbow-mode sly treemacs-projectile vertico
                 yasnippet)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
