;;;;|--------------------------------------------------------|
;;;;| @AUTHORS notidman <ognieff@yandex.ru>
;;;;|
;;;;| @URL https://github.com/notidman/nimacs
;;;;|
;;;;| @PROJECT-NAME nimacs
;;;;|
;;;;| @DATE-START 29-09-22
;;;;|
;;;;| @BRIEF settings config
;;;;|
;;;;|--------------------------------------------------------|

;;;|---------------------------------------------------------|
;;;| (mode-line)
;;;|---------------------------------------------------------|
; (setq-default mode-line-format
;               `(" "
;                 ;; indicate if the buffer has been modified
;                 (:eval (propertize
;                         (if (and (not buffer-read-only) (buffer-modified-p))
;                             "● " "  " )
;                         'face 'error))
;
;                 ;; Buffer name (no longer than 1/3 of the screen)
;                 mode-line-buffer-identification
;                 ;; (:eval (concat  (let ((bname (buffer-name (current-buffer)))
;                 ;;                       (max-len (/ (window-total-width) 3)))
;                 ;;                   (if (> (length bname) max-len)
;                 ;;                       (substring bname 0 max-len)
;                 ;;                     bname))))
;                 ;; value of current line number
;                 " "
;                 " %l:%c"
;                 (:eval (propertize
;                         (concat " %p%"
;                                 " "
;                                 "「 %m 」")
;                         'face (if (cogent-line-selected-window-active-p)
;                                   'shadow
;                                 'mode-line-inactive)))
;
;                 ;; I still have yet to come up with a better option
;                 (:eval
;                  (propertize " " 'display
; 	                     `((space :align-to
; 			              (- (+ right right-fringe right-margin)
; 			                 ,(string-width (format-mode-line mode-line-misc-info)))))))
;                 mode-line-misc-info))
;;;|---------------------------------------------------------|
