;;;;|
;;;;| @AUTHORS cloezure <ognieff@yandex.ru>
;;;;|
;;;;| @URL https://github.com/cloezure/ezmacs
;;;;|
;;;;| @PROJECT-NAME ezmacs
;;;;|
;;;;| @DATE-START 29-09-22
;;;;|
;;;;| @BRIEF contains loadable modules for config.
;;;;|

;;; settings
;;; gui
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode)   (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode)   (menu-bar-mode -1))

;;; font
(set-frame-font
 "-PfEd-GohuFont NFM-normal-normal-normal-*-*-*-*-*-m-0-iso10646-1"
 nil t)
(set-face-attribute 'default nil :height 140)

;;; auto-save
(setq backup-directory-alist
      `((".*" . "~/.emacs.d/.backups/")))
(setq auto-save-file-name-transforms
      `((".*" "~/.emacs.d/.auto-saves/" t)))
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

;;; orgmode
(defun org-mode-setup ()
  (org-indent-mode))
;;  (variable-pitch-mode 1)
;;  (auto-fill-mode 0)
;;  (visual-line-mode 1))

(use-package org
  :hook (org-mode . org-mode-setup))

(use-package org-bullets
  :hook
  (org-mode . org-bullets-mode))

;;; global
(use-package company
  :init (global-company-mode t)
  (setq company-idle-delay 0))

;;; music player
(use-package bongo)

(use-package pdf-tools)
(use-package meson-mode)
(use-package transpose-frame)
(use-package magit)
(use-package vertico
  :init (vertico-mode))
;;;(use-package vterm)
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

(use-package makefile-executor)
(use-package lsp-mode
  :hook ((c-mode . lsp-deferred)
	 (c++-mode . lsp-deferred)))
(use-package lsp-ui
  :commands lsp-ui-mode)

;;; lisp
(setq inferior-lisp-program "sbcl")
(use-package sly)
(use-package geiser-racket)
(use-package geiser-chicken)
(use-package geiser-guile)

;;; theme
(use-package cherry-blossom-theme)
(use-package naysayer-theme)
(use-package orangey-bits-theme)
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

