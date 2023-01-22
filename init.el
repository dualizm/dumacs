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

;;;;| package
(require 'package)
(setf package-archives
      '(("melpa" . "https://melpa.org/packages/")
        ("elpa" . "https://elpa.gnu.org/packages/")
        ("nongnu" . "https://elpa.nongnu.org/nongnu/")))
(package-initialize)

(dolist (package '(use-package))
   (unless (package-installed-p package)
       (package-install package)))

(eval-and-compile
  (setq use-package-always-ensure t
        use-package-expand-minimally t))

;;;;| settings
;; gui
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode)   (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode)   (menu-bar-mode -1))

;; font
(set-frame-font 
  "-SAJA-CaskaydiaCove Nerd Font-normal-normal-normal-*-*-*-*-*-m-0-iso10646-1"
  nil t)
(set-face-attribute 'default nil :height 110)

;; auto-save
(setq backup-directory-alist
      `((".*" . "~/.emacs.d/backups/")))
(setq auto-save-file-name-transforms
      `((".*" "~/.emacs.d/auto-saves/" t)))
;; start screen
(setq inhibit-startup-screen t)

;; transparency
; ;;(set-frame-parameter (selected-frame) 'alpha '(<active> . <inactive>))
; ;;(set-frame-parameter (selected-frame) 'alpha <both>)
; (set-frame-parameter (selected-frame) 'alpha '(85 . 50))
; (add-to-list 'default-frame-alist '(alpha . (85 . 50)))

;; fullscreen
; ((lambda ()
;        (interactive)
;        (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
;                  '(2 "_NET_WM_STATE_FULLSCREEN" 0))))

;; theme
; (load-theme 'modus-vivendi t)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
