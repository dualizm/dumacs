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
;;;| (module loading functions)
;;;|---------------------------------------------------------|
(cl-defun load-configs (dir-names &key (subdir "")) 
  (dolist (dir-name dir-names)
    (load 
      (concat "~/.emacs.d/config/" subdir
        (to-string dir-name) "/init.el"))))

(defun load-plugins (dir-names)
  (load-configs dir-names :subdir "plugins/"))

(defun load-binds (dir-names)
  (load-configs dir-names :subdir "binds/"))

(defun load-settings (dir-names)
  (load-configs dir-names :subdir "settings/"))

(defun to-string (name)
  (format "%s" name))

(defun set-bind (key-comb fun)
  (global-set-key (kbd key-comb) fun))

; (defun set-binds (&rest key-fun))

; (defmacro create-bind (key-comb function)
;   (global-set-key (kbd key-comb) function))
;;;|---------------------------------------------------------|
