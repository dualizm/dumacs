;;; init.el --- Initialization file for dumacs

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; DUMACS INFO
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; AUTHORS: dualizm
;;; VERSION: 0.0.5
;;; EMAIL: ognieff@gmail.com
;;; URL: "https://github.com/dualizm/dumacs"
;;; DATE CREATED: 29-09-22
;;; BRIEF: config for author
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(load "~/.emacs.d/du.el")
(load "~/.emacs.d/du-conf.el")
(load "~/.emacs.d/du-pkgs.el")

(load-theme 'kaolin-ocean t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(ajrepl janet-mode majapahit-themes naysayer-theme cherry-blossom-theme kaolin-themes sly lsp-ui lsp-mode paredit rainbow-delimiters rainbow-mode avy vertico magit highlight-indent-guides company)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
