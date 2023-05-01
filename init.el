;;; init.el --- Initialization file for ezmacs

;;; Commentary:

;; ezmacs startup file --- Initialization for ezmacs

;;; Code:

(defvar ezmacs-info
  '((file         . "init.el")
    (authors      . "cloezure")
    (version      . "0.0.3")
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
    (set-face-attribute 'default nil :font font :height 160)))

(set-face-attribute 'default nil :font "-CTDB-Fira Code-normal-normal-normal-*-13-*-*-*-m-0-iso10646-1" :height 130)

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

;;; disassembly
(use-package rmsbolt)

;;; highlight-indent-guides
(use-package highlight-indent-guides
  :config
  (setq highlight-indent-guides-method 'bitmap)
  :hook (prog-mode . highlight-indent-guides-mode))

;;; orgmode
;;;  (variable-pitch-mode 1)
;;;  (auto-fill-mode 0)
;;;  (visual-line-mode 1))
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

(use-package consult)

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
  :hook ((c-mode . lsp)
	 (c++-mode . lsp)
	 (rust-mode . lsp)
	 ;; web mods
	 (css-mode . lsp)
	 (web-mode . lsp)
	 (html-mode . lsp)
	 (json-mode  . lsp)
	 (js2-mode  . lsp)))
	 
(use-package lsp-ui
  :commands lsp-ui-mode)

;;; web
(use-package js2-mode)
(use-package css-mode)

;;; lisp
(use-package sly
  :init
  (setq inferior-lisp-program "sbcl")
  :config
  (use-package sly-quicklisp))

;;; scheme
(use-package geiser-chez)

;;; racket
(use-package racket-mode
  :hook
  (racket-mode . racket-xp-mode))

;;; c/cxx
(use-package meson-mode)
(use-package makefile-executor)

;; rust
(use-package rust-mode)

;;; themes
(use-package cherry-blossom-theme)
(use-package jazz-theme)

(load-theme 'jazz t)

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
