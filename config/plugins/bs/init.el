;;;;|--------------------------------------------------------|
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
;;;;|--------------------------------------------------------|

;;;|---------------------------------------------------------|
;;;| (bs)
;;;|---------------------------------------------------------|
(use-package bs
  :init
  (setq bs-configurations
        '(("files" "^\\*scratch\\*"
           nil nil
           bs-visits-non-file 
           bs-sort-buffer-interns-are-last))))
;;;|---------------------------------------------------------|
