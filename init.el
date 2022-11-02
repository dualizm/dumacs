;;;;|----------------------------------------------------|
;;;;| @AUTHORS notidman <ognieff@yandex.ru>
;;;;|
;;;;| @URL https://github.com/notidman/nimacs
;;;;|
;;;;| @PROJECT-NAME nimacs
;;;;|
;;;;| @DATE-START 29-09-22
;;;;|
;;;;| @BRIEF contains loadable modules for config.
;;;;|
;;;;|----------------------------------------------------|

; contains configuration functions
(load "~/.emacs.d/nimacs-api.el") 

;;;;|----------------------------------------------------|
;;;;| (configuration files)
;;;;|----------------------------------------------------|
(load-configs '(
    settings ; general settings 
    package  ; package config
    themes   ; themes settings
    plugins  ; plugins
    binds    ; nimacs layout
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
   '(yasnippet lsp-ivy lsp-ui use-package sly rainbow-mode rainbow-delimiters macrostep lsp-mode ivy evil company cherry-blossom-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
