;;;;|--------------------------------------------------------|
;;;;| @AUTHORS notidman <ognieff@yandex.ru>
;;;;|
;;;;| @URL https://github.com/notidman/nimacs
;;;;|
;;;;| @PROJECT-NAME nimacs
;;;;|
;;;;| @DATE-START 29-09-22
;;;;|
;;;;| @BRIEF contains loadable modules for config.
;;;;|
;;;;|--------------------------------------------------------|

(load "~/.emacs.d/pre-init.el") ; contains configuration functions

;;;|---------------------------------------------------------|
;;;| configuration files |
;;;|---------------------------------------------------------|
(load-config  
  '(
    ;; general settings 
    "settings"

    ;; mappings
    "mappings" 

    ;; theme settings
    "themes"
))
;;;|---------------------------------------------------------|

;;;|---------------------------------------------------------|
;;;| plugin files |
;;;|---------------------------------------------------------|
(load-plugin  
  '(
    "package" ; package (use-package) config
    "evil"    ; vim like hjkl
)) 
;;;|---------------------------------------------------------|




















    ;; Project Interaction Library for Emacs  
    ; (load-plugin "projectlite/init.el")
; ; Cool scroll
; (use-package smooth-scroll
;   :ensure t)
; (smooth-scroll-mode)
; ; Cool bean
; (use-package pulse
;   ;; Highlight cursor postion after movement
;   :ensure t
;   :defer t
;   :init (defun pulse-line (&rest _)
;           (pulse-momentary-highlight-one-line (point)))
;   (dolist (command '(other-window windmove-do-window-select mouse-set-point mouse-select-window))
;     (advice-add command :after #'pulse-line)))
; ; Support CL
; (use-package slime
;   :ensure t)
; (setq inferior-lisp-program "sbcl")



;;; |
;;; | Old
;;; V

; ;;; [SETTINGS]
; ;;==============================================
;
; ;; [LINUM]
; (global-linum-mode t)
;
; ;; [IDO]
; (setq ido-enable-flex-matching t)
; (setq ido-everywhere t)
; (ido-mode t)
;
; ;; [BS]
; (setq bs-configurations
;       '(("files" "^\\*scratch\\*" nil nil bs-visits-non-file bs-sort-buffer-interns-are-last)))
;
; (setq redisplay-dont-pause t
;   scroll-margin 1
;   scroll-step 1
;   scroll-conservatively 10000
;   scroll-preserve-screen-position 1)
; ;;==============================================
;
