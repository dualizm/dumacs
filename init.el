;;;;|----------------------------------------------------|
;;;;| @AUTHORS ezqb <ognieff@yandex.ru>
;;;;|
;;;;| @URL https://github.com/ezqb/ezmacs
;;;;|
;;;;| @PROJECT-NAME ezmacs
;;;;|
;;;;| @DATE-START 29-09-22
;;;;|
;;;;| @BRIEF contains loadable modules for config.
;;;;|
;;;;|----------------------------------------------------|

; contains configuration functions
(load "~/.emacs.d/ezmacs-api.el") 

;;;;|----------------------------------------------------|
;;;;| (configuration files)
;;;;|----------------------------------------------------|
(load-configs '(
    settings ; general settings 
    package  ; package config
    themes   ; themes settings
    plugins  ; plugins
    ;; binds    ; nimacs layout
))
;;;;|----------------------------------------------------|

;; TODO
;; ElectricPair
;; puni
;; 
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(magit yasnippet with-editor use-package transient sly rainbow-mode rainbow-delimiters projectile magit-section macrostep lsp-ui lsp-ivy linum-relative jazz-theme flycheck evil-commentary company cherry-blossom-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(linum-relative-current-face ((t (:foreground "goldrod")))))
