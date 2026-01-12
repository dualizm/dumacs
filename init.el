;;;; init.el --- Initialization file for dumacs
;;;; author  dualizm
;;;; version 1.0.2
;;;; email   ognieff@gmail.com
;;;; url     https://github.com/dualizm/dumacs
;;;; start   29-09-22

;;; запуск
(setf inhibit-startup-screen t
      inhibit-startup-message t)

(add-to-list 'load-path "~/.emacs.d/du/")

(load "du-lib.el")

(load "du-packages.el")
(load "du-settings.el")
(load "du-bind.el")
(load "du-js.el")
(load "du-c.el")

(require 'package)
(package-initialize)
