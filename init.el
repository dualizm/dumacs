;;; init.el --- Initialization file for ezmacs

;;; Commentary:

;; ezmacs startup file --- Initialization for ezmacs

;;; Code:

(defvar ezmacs-info
  '((file         . "init.el")
    (authors      . "cloezure")
    (version      . "0.0.2")
    (email        . "ognieff@yandex.ru")
    (url          . "https://github.com/cloezure/ezmacs")
    (project-name . "ezmacs")
    (date-start   . "29-09-22")
    (brief        . "config for author"))
  "Contain information about the ezmacs build.")

(defun ezmacs-about (key)
  "KEY: value from ezmacs-info."
  (message (cdr (assoc key ezmacs-info))))

(defun open-config ()
  "Open ezmacs config."
  (find-file "~/.emacs.d/init.el"))

(defalias 'open-config 'emacs-lisp-byte-compile)

;;; settings
;;; warnings
(setq warning-minimum-level :emergency)

;;; gui
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode)   (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode)   (menu-bar-mode -1))

;;; font
(let ((font "-JB-JetBrains Mono-normal-normal-normal-*-19-*-*-*-m-0-iso10646-1"))
  (when (find-font (font-spec :name font))
    (set-face-attribute 'default nil :font font :height 140)))

(defmacro unless-cond (&rest cases)
  "CASES: list forms."
  `(progn
     ,@(mapcar #'(lambda (case) `(unless ,(car case) ,(cadr case))) cases)))

;;; auto-save
(defun save-directories (backups saves)
  (unless-cond
   ((file-directory-p backups) (make-directory backups))
   ((file-directory-p saves) (make-directory saves)))
  (setq backup-directory-alist
	`((".*" . ,backups)))
  (setq auto-save-file-name-transforms
	`((".*" ,saves t))))

(save-directories "~/.emacs.d/.backups/" "~/.emacs.d/.auto-saves/")
;;; start screen
(setq inhibit-startup-screen t)

;;; transparency
;;(set-frame-parameter (selected-frame) 'alpha '(<active> . <inactive>))
;;(set-frame-parameter (selected-frame) 'alpha <both>)
(set-frame-parameter (selected-frame) 'alpha '(95 . 50))
;;(add-to-list 'default-frame-alist '(alpha . (100 . 50)))

;;; fullscreen
;;((lambda ()
;;   (interactive)
;;       (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
;;			       '(2 "_NET_WM_STATE_FULLSCREEN" 0))))

;;; mode line
(setq display-time-24hr-format t)
(setq display-time-interval 1)
(display-time)

;;; prettify-symbols
(setq prettify-symbols-alist '(("lambda" . 955)))

;;; bind
(global-set-key (kbd "M-h") 'left-char)
(global-set-key (kbd "M-j") 'next-line)
(global-set-key (kbd "M-k") 'previous-line)
(global-set-key (kbd "M-l") 'right-char)

;;; place lambda
(global-set-key (kbd "C-x p l")
		(lambda ()
		  (interactive)
		  (insert (char-from-name "GREEK SMALL LETTER LAMBDA"))))

;;; package
(require 'package)
(setf package-archives
      '(("melpa-stable" . "https://stable.melpa.org/packages/")
	("melpa" . "https://melpa.org/packages/")
        ("elpa" . "https://elpa.gnu.org/packages/")
        ("nongnu" . "https://elpa.nongnu.org/nongnu/")))
(package-initialize)

(dolist (package '(use-package))
  (unless (package-installed-p package)
    (package-install package)))

(eval-and-compile
  (setq use-package-always-ensure t
        use-package-expand-minimally t))

(eval-and-compile
  (require 'use-package))

;;; auto-complete
(use-package company
  :init (global-company-mode t)
  (setq company-idle-delay 0))

;;; syntax checking
(use-package flycheck
  :init
  (global-flycheck-mode t))

(use-package paredit
  :config
  (dolist (m '(emacs-lisp-mode-hook
               racket-mode-hook
               racket-repl-mode-hook))
    (add-hook m #'paredit-mode))
  (bind-keys :map paredit-mode-map
             ("{"   . paredit-open-curly)
             ("}"   . paredit-close-curly))
  (unless terminal-frame
    (bind-keys :map paredit-mode-map
               ("M-[" . paredit-wrap-square)
               ("M-{" . paredit-wrap-curly))))

;;; highlight-indent-guides
(use-package highlight-indent-guides
  :config
  (setq highlight-indent-guides-method 'bitmap)
  :hook (prog-mode . highlight-indent-guides-mode))

;;; orgmode
;;  (variable-pitch-mode 1)
;;  (auto-fill-mode 0)
;;  (visual-line-mode 1))
(use-package org
  :hook (org-mode . org-indent-mode))

(use-package org-bullets
  :hook
  (org-mode . org-bullets-mode))

;;; pdf viewer
(use-package pdf-tools)

(use-package transpose-frame)

;;; git client
(use-package magit)

(use-package vertico
  :init (vertico-mode))

(use-package avy
  :bind (("C-:" . 'avy-goto-char)
	 ("C-'" . 'avy-goto-char-2)
	 ("M-g l" . 'avy-goto-line)
	 ("M-g f" . 'avy-goto-word-1)))

(use-package yasnippet
  :config (yas-global-mode t))

(use-package rainbow-mode
  :hook (prog-mode . rainbow-mode))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package lsp-mode
  :hook ((c-mode . lsp-deferred)
	 (c++-mode . lsp-deferred)
	 ;; web mods
	 (css-mode . lsp-deferred)
	 (web-mode . lsp-deferred)
	 (html-mode . lsp-deferred)
	 (gfm-mode  . lsp-deferred)
	 (gfm-view-mode . lsp-deferred)
	 (sgml-mode  . lsp-deferred)
	 (json-mode  . lsp-deferred)
	 (js2-mode  . lsp-deferred)))
	 
(use-package lsp-ui
  :commands lsp-ui-mode)

;; web
(use-package js2-mode)
(use-package css-mode)

;;; lisp
(use-package sly
  :init
  (setq inferior-lisp-program "sbcl"))

;; scheme
(use-package geiser-chicken)
(use-package geiser-guile)

;; racket
(use-package racket-mode
  :hook
  (racket-mode . racket-xp-mode))

;; clojure
(use-package clojure-mode)
(use-package cider)
(use-package inf-clojure)

;; haskell
(use-package haskell-mode)

;;; c/cxx
(use-package meson-mode)
(use-package makefile-executor)

;;; themes
(use-package cherry-blossom-theme)
(use-package jazz-theme)
(use-package humanoid-themes)
(use-package gruber-darker-theme)
(use-package doom-themes
  :config
  (setq doom-themes-enable-bold t
	doom-themes-enable-italic t)

  (doom-themes-visual-bell-config)
  (doom-themes-org-config))

(load-theme 'gruber-darker t)

(defun toggle-window-split ()
  (interactive)
  (if (= (count-windows) 2)
      (let* ((this-win-buffer (window-buffer))
	     (next-win-buffer (window-buffer (next-window)))
	     (this-win-edges (window-edges (selected-window)))
	     (next-win-edges (window-edges (next-window)))
	     (this-win-2nd (not (and (<= (car this-win-edges)
					 (car next-win-edges))
				     (<= (cadr this-win-edges)
					 (cadr next-win-edges)))))
	     (splitter
	      (if (= (car this-win-edges)
		     (car (window-edges (next-window))))
		  'split-window-horizontally
		'split-window-vertically)))
	(delete-other-windows)
	(let ((first-win (selected-window)))
	  (funcall splitter)
	  (if this-win-2nd (other-window 1))
	  (set-window-buffer (selected-window) this-win-buffer)
	  (set-window-buffer (next-window) next-win-buffer)
	  (select-window first-win)
	  (if this-win-2nd (other-window 1))))))
(global-set-key (kbd "C-x |") 'toggle-window-split)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(paredit gruber-darker-theme racket-mode haskell-mode html-mode js2-mode cider-mode inf-clojure cider clojure-mode humanoid-themes emacs-humanoid-themes color-theme-sanityinc-tomorrow ample-theme doom-themes jazz-theme orangey-bits-theme naysayer-theme cherry-blossom-theme makefile-executor meson-mode geiser-guile geiser-chicken sly lsp-ui lsp-mode rainbow-delimiters rainbow-mode yasnippet avy vertico magit transpose-frame pdf-tools org-bullets highlight-indent-guides bongo flycheck company use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
