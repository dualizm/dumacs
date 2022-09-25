;;;;|--------------------------------------------------------|
;;;;| @AUTHORS notidman <ognieff@yandex.ru>
;;;;|
;;;;| @URL https://github.com/notidman/nimacs
;;;;|
;;;;| @PROJECT-NAME nimacs
;;;;|
;;;;| @DATE-START 29-09-22
;;;;|
;;;;| @BRIEF contains configuration functions
;;;;|
;;;;|--------------------------------------------------------|

;;;|---------------------------------------------------------|
;;;| module loading functions |
;;;|---------------------------------------------------------|
(defun load-config (dir-names) 
  (dolist (dir-name dir-names)
    (load (concat "~/.emacs.d/config/" dir-name "/init.el"))))

(defun load-plugin (dir-names)
  (dolist (dir-name dir-names)
    (load (concat "~/.emacs.d/config/plugin/" dir-name "/init.el"))))
;;;|---------------------------------------------------------|
