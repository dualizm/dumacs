(load "~/.emacs.d/api.el")

;; speed up startup
(setq gc-cons-percentage 0.6)
(setq gc-cons-threshold most-positive-fixnum)

;;; warnings
(defvar warning-minimum-level :emergency)
(setf visible-bell 1)

(save-directories "~/.emacs.d/.backups/" "~/.emacs.d/.auto-saves/")

;;; gui
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode)   (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode)   (menu-bar-mode -1))

;;; font
;;(defont "-JB-JetBrains Mono-normal-normal-normal-*-19-*-*-*-m-0-iso10646-1")
(defont "-CTDB-Fira Code-normal-normal-normal-*-13-*-*-*-m-0-iso10646-1")

;;; start screen
(setq inhibit-startup-screen t)

;;; transparency
(set-frame-parameter (selected-frame) 'alpha '(95 . 50))
;;(add-to-list 'default-frame-alist '(alpha . (95 . 50)))

;;; mode line
(defvar display-time-24hr-format t)
(defvar display-time-interval 1)
(display-time)

;;; binds
(global-set-key (kbd "C-x |") 'toggle-window-split)

(global-set-key (kbd "C-x p l")
		(lambda ()
		  (interactive)
		  (insert (char-from-name "GREEK SMALL LETTER LAMBDA"))))
