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

(load "~/.emacs.d/pre-init.el") ; contains configuration functions

;;;|---------------------------------------------------------|
;;;| configuration files |
;;;|---------------------------------------------------------|
(load-configs
  '(
    settings ; general settings 
    binds ; mappings
    themes ; theme settings
    plugins ; plugins
))
;;;|---------------------------------------------------------|
