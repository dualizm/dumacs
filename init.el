;;;;|----------------------------------------------------|
;;;;| @AUTHORS ezqb <ognieff@yandex.ru>
;;;;|
;;;;| @URL https://github.com/ezqb/ezmacs
;;;;|
;;;;| @PROJECT-NAME ezmacs
;;;;|
;;;;| @DATE-START 29-09-22
;;;;|
;;;;| @BRIEF contains loadable modules for config.
;;;;|
;;;;|----------------------------------------------------|

;;; settings
;;; gui
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode)   (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode)   (menu-bar-mode -1))

;;; font
(set-frame-font 
 "-fsdf-PragmataPro-normal-normal-normal-*-19-*-*-*-m-0-iso10646-1"
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

<<<<<<< HEAD
;;; lisp
=======
;; lisp
>>>>>>> 2199aaa ([upd])
(setq inferior-lisp-program "sbcl")
(use-package sly)
(use-package geiser-racket)
(use-package geiser-chicken)
(use-package geiser-guile)

;;; theme
(use-package cherry-blossom-theme)
(use-package naysayer-theme)
(use-package orangey-bits-theme)
(load-theme 'cherry-blossom t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
<<<<<<< HEAD
   '(magit org-bullets yasnippet vertico use-package transpose-frame sly rainbow-mode rainbow-delimiters pdf-tools orangey-bits-theme naysayer-theme meson-mode makefile-executor lsp-ui jazz-theme green-screen-theme geiser-racket geiser-guile geiser-chicken doom-themes company cherry-blossom-theme avy)))
=======
   '(lsp-ui lsp-mode makefile-executor doom-themes geiser-chicken geiser-racket sly rainbow-delimiters rainbow-mode yasnippet avy vertico transpose-frame pdf-tools company use-package)))
>>>>>>> 2199aaa ([upd])
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
