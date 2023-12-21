;;; init.el --- Initialization file for ezmacs

;;; Commentary:

;; ezmacs startup file --- Initialization for ezmacs

;;; Code:

;;; ABOUT EZMACS

(defvar ezmacs-info
  '((file         . "init.el")
    (authors      . "ezeire")
    (version      . "0.0.4")
    (email        . "ognieff@yandex.ru")
    (url          . "https://github.com/cloezure/ezmacs")
    (project-name . "ezmacs")
    (date-start   . "29-09-22")
    (brief        . "config for author"))
  "Contain information about the ezmacs build.")

(defun ezmacs-about (key)
  "KEY: value from ezmacs-info."
  (message (cdr (assoc key ezmacs-info))))

(load "~/.emacs.d/ez.el")
(load "~/.emacs.d/settings.el")
(load "~/.emacs.d/packages.el")

(load-theme 'kaolin-ocean t)

;;; init.el ends here
