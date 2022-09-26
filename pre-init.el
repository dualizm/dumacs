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
        (to-string dir-name) "/init.el"))))

(defun load-subdir-config (dir-names subdir)
  (dolist (dir-name dir-names)
    (load 
      (concat "~/.emacs.d/config/" subdir "/" 
        (to-string dir-name) "/init.el"))))

(defun load-plugins (dir-names)
  (load-subdir-config dir-names "plugins"))

(defun load-binds (dir-names)
  (load-subdir-config dir-names "binds"))

(defun to-string (name)
  (format "%s" name))
;;;|---------------------------------------------------------|
