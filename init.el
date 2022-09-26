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
(load-configs
  '(
    ;; general settings 
    settings

    ;; mappings
    mappings

    ;; theme settings
    themes
))
;;;|---------------------------------------------------------|

;;;|---------------------------------------------------------|
;;;| plugin files |
;;;|---------------------------------------------------------|
(load-plugins
  '(
    package       ; package (use-package) config
    evil          ; vim like hjkl
    pulse         ; cool bean
    smooth-scroll ; cool scroll
  ; projectlite   ; project interaction library
)) 
;;;|---------------------------------------------------------|

;;;|
;;;| Old
;;;V

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
; ;;==============================================
