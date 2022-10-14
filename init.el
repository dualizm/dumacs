;;;;|--------------------------------------------------------|
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
;;;;|--------------------------------------------------------|

; contains configuration functions
(load "~/.emacs.d/nimacs-api.el") 

;;;|---------------------------------------------------------|
;;;| (configuration files)
;;;|---------------------------------------------------------|
(load-configs '(
    settings ; general settings 
    plugins  ; plugins
    themes   ; themes settings
    binds    ; nimacs layout
))
;;;|---------------------------------------------------------|
