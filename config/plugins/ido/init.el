;;;;|----------------------------------------------------|
;;;;| @AUTHORS notidman <ognieff@yandex.ru>
;;;;|
;;;;| @URL https://github.com/notidman/nimacs
;;;;|
;;;;| @PROJECT-NAME nimacs
;;;;|
;;;;| @DATE-START 29-09-22
;;;;|
;;;;| @BRIEF plugin config
;;;;|
;;;;|----------------------------------------------------|

;;;;|----------------------------------------------------|
;;;;| (ido)
;;;;|----------------------------------------------------|
(use-package ido
  :init
    (ido-mode t)
  :config
    (setq ido-enable-flex-matching t)
    (setq ido-everywhere t))
;;;;|----------------------------------------------------|
