;;;;|--------------------------------------------------------|
;;;;| AUTHORS notidman <ognieff@yandex.ru>
;;;;|
;;;;| @URL https://github.com/notidman/nimacs
;;;;|
;;;;| @PROJECT-NAME nimacs
;;;;|
;;;;| @DATE-START 29-09-22
;;;;|
;;;;| @BRIEF contains plugins for nimacs
;;;;|
;;;;|--------------------------------------------------------|

;;;|---------------------------------------------------------|
;;;| plugins |
;;;|---------------------------------------------------------|
(load-plugins
  '(
    package       ; package (use-package) config
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
