;;; init.el --- Initialization file for dumacs

(defvar dumacs-info
  '((file         . "init.el")
    (authors      . "dualizm")
    (version      . "0.0.4")
    (email        . "ognieff@yandex.ru")
    (url          . "https://github.com/dualizm/dumacs")
    (project-name . "dumacs")
    (date-start   . "29-09-22")
    (brief        . "config for author"))
  "Contain information about the dumacs build.")

(defun dumacs-about (key)
  (message (cdr (assoc key dumacs-info))))

(load "~/.emacs.d/api.el")
(load "~/.emacs.d/settings.el")
(load "~/.emacs.d/packages.el")

(load-theme 'kaolin-ocean t)
