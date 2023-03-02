(defvar ezmacs-info
  '((file         . "init.el")
    (authors      . "cloezure")
    (email        . "ognieff@yandex.ru")
    (url          . "https://github.com/cloezure/ezmacs")
    (project-name . "ezmacs")
    (date-start   . "29-09-22")
    (brief        . "config for author")))

(defun ezmacs-about (key)
  (message (cdr (assoc key ezmacs-info))))

;;; daemon
(server-start)

;;; settings
;;; gui
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode)   (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode)   (menu-bar-mode -1))

;;; font
;;(set-frame-font
;; "-PfEd-GohuFont NFM-normal-normal-normal-*-*-*-*-*-m-0-iso10646-1"
;; nil t)
(set-face-attribute 'default nil :height 140)

(defmacro unless-cond (&rest cases)
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

;;; music player
(use-package bongo)

;;; highlight-indent-guides
(use-package highlight-indent-guides
  :config
  (setq highlight-indent-guides-method 'bitmap)
  :hook (prog-mode . highlight-indent-guides-mode))

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
	 (c++-mode . lsp-deferred)))
(use-package lsp-ui
  :commands lsp-ui-mode)

;;; lisp
(setq inferior-lisp-program "sbcl")
(use-package sly)
(use-package geiser-racket)
(use-package geiser-chicken)
(use-package geiser-guile)

;;; c/cxx
(use-package meson-mode)
(use-package makefile-executor)

;;; nix
(use-package nix-mode
  :mode "\\.nix\\'")

;;; theme
(use-package cherry-blossom-theme)
(use-package naysayer-theme)
(use-package orangey-bits-theme)
(use-package jazz-theme)
(load-theme 'cherry-blossom t)

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
   '(flycheck highlight-indent-guides nix-mode yasnippet vertico use-package transpose-frame sly rainbow-mode rainbow-delimiters pdf-tools org-bullets orangey-bits-theme naysayer-theme meson-mode makefile-executor magit lsp-ui jazz-theme geiser-racket geiser-guile geiser-chicken company cherry-blossom-theme bongo avy)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
