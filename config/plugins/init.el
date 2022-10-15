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
;;;| (plugins)
;;;|---------------------------------------------------------|
(load-plugins '(
    use-package   ; improvements require
    pulse         ; cool bean
    smooth-scroll ; cool scroll
    sly           ; old -> slime
    evil          ; hjkl
    lsp           ; auto complete
    linum         ; line numbers
  ; projectlite   ; project interaction library

)) 
;;;|---------------------------------------------------------|

;;;|
;;;| Old
;;;V

; ;;; [SETTINGS]
; ;;==============================================
; ;; [IDO]
; (setq ido-enable-flex-matching t)
; (setq ido-everywhere t)
; (ido-mode t)
;
; ;; [BS]
; (setq bs-configurations
;       '(("files" "^\\*scratch\\*" nil nil bs-visits-non-file bs-sort-buffer-interns-are-last)))
; ;;==============================================
