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
(defun load-configs (dir-names) 
  (dolist (dir-name dir-names)
    (load 
      (concat "~/.emacs.d/config/" 
        (convert-to-string dir-name) "/init.el"))))

(defun load-plugins (dir-names)
  (dolist (dir-name dir-names)
    (load 
      (concat "~/.emacs.d/config/plugin/" 
        (convert-to-string dir-name) "/init.el"))))

(defun convert-to-string (name)
  (format "%s" name))
;;;|---------------------------------------------------------|
