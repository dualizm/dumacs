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

;;;;| settings
;; gui
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode)   (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode)   (menu-bar-mode -1))

;; font
(set-frame-font 
 "-UKWN-Iosevka Nerd Font Mono-normal-normal-normal-*-15-*-*-*-m-0-iso10646-1"
 nil t)
(set-face-attribute 'default nil :height 110)

;; auto-save
(setq backup-directory-alist
      `((".*" . "~/.emacs.d/.backups/")))
(setq auto-save-file-name-transforms
      `((".*" "~/.emacs.d/.auto-saves/" t)))
;; start screen
(setq inhibit-startup-screen t)

;; transparency
; ;;(set-frame-parameter (selected-frame) 'alpha '(<active> . <inactive>))
; ;;(set-frame-parameter (selected-frame) 'alpha <both>)
(set-frame-parameter (selected-frame) 'alpha '(95 . 50))
;(add-to-list 'default-frame-alist '(alpha . (85 . 50)))

;; fullscreen
; ((lambda ()
;        (interactive)
;        (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
;                  '(2 "_NET_WM_STATE_FULLSCREEN" 0))))

;; theme
; (load-theme 'modus-vivendi t)

;;;;| package
(require 'package)
(setf package-archives
      '(("melpa" . "https://melpa.org/packages/")
	("melpa-stable" . "https://stable.melpa.org/packages/")
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

;; global
(use-package company
  :init (global-company-mode t)
  (setq company-idle-delay 0))

(use-package pdf-tools)

(use-package transpose-frame)

;;(use-package magit)
(use-package vertico
  :init (vertico-mode))
;(use-package vterm)
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

;; lisp
(setq inferior-lisp-program "sbcl")
(use-package sly)
(use-package geiser-racket)
(use-package geiser-chicken)

;; theme
(use-package doom-themes
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (load-theme 'doom-ayu-dark t)

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)
  (doom-themes-org-config))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(doom-themes geiser-chicken geiser-racket sly rainbow-delimiters rainbow-mode yasnippet avy vertico transpose-frame pdf-tools company use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'upcase-region 'disabled nil)
