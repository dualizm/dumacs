;;; du-settings.el --- dumacs настройки

(load "du-lib.el")

;; предупреждения
(defvar warning-minimum-level :emergency)
(setf byte-compile-warnings '(not docstring)
      visible-bell 'ignore
      ring-bell-function 'ignore)

;; yes/no -> y/n
(defalias 'yes-or-no-p 'y-or-n-p)

;; директории для сохранения
(du/save-directories
 "~/.emacs.d/.backups/"
 "~/.emacs.d/.auto-saves/")

;; ui
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))
(when (fboundp 'menu-bar-mode)
  (menu-bar-mode -1))
(blink-cursor-mode -1)

;; начальный frame
(add-to-list 'default-frame-alist '(height . 45))
(add-to-list 'default-frame-alist '(width . 100))

;; шрифт
(du/select-font
 "-JB-JetBrains Mono-normal-normal-normal-*-19-*-*-*-m-0-iso10646-1")

;; запуск
(setf inhibit-startup-screen t
      inhibit-startup-message t)

;; показывает путь в заголовке фрейма
(setq-default frame-title-format "%b (%f)")

;; прозрачность
;;(set-frame-parameter (selected-frame) 'alpha '(95 . 50))
;;(add-to-list 'default-frame-alist '(alpha . (95 . 50)))

;; mode line
(defvar display-time-24hr-format t)
(defvar display-time-interval 60)
(display-time)

;; highlight line
(global-hl-line-mode t)

;; line numbers
(global-display-line-numbers-mode t)
(dolist (hook '(shell-mode-hook
		term-mode-hook
		eshell-mode-hook
		org-mode-hook))
  (add-hook hook #'du/disable-display-line-numbers-mode))

;; shell scripts
(setq-default sh-basic-offset 2
              sh-indentation 2)

;; Make gc pauses faster by decreasing the threshold.
;;(setq gc-cons-threshold (* 2 1000 1000))

;; theme
(load-theme 'deeper-blue t)
