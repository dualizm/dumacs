;;;;|--------------------------------------------------------|
;;;;| @AUTHORS notidman <ognieff@yandex.ru>
;;;;|
;;;;| @URL https://github.com/notidman/nimacs
;;;;|
;;;;| @PROJECT-NAME nimacs
;;;;|
;;;;| @DATE-START 29-09-22
;;;;|
;;;;| @BRIEF file contains configuration settings
;;;;|
;;;;|--------------------------------------------------------|

;;;|---------------------------------------------------------|
;;;| (settings)
;;;|---------------------------------------------------------|
(load-settings
  '(
    gui
    font
    start-screen
))
;;;|---------------------------------------------------------|


;;;|---------------------------------------------------------|
;;;| (transparency)
;;;|---------------------------------------------------------|
; ;;(set-frame-parameter (selected-frame) 'alpha '(<active> . <inactive>))
; ;;(set-frame-parameter (selected-frame) 'alpha <both>)
; (set-frame-parameter (selected-frame) 'alpha '(85 . 50))
; (add-to-list 'default-frame-alist '(alpha . (85 . 50)))
;;;|---------------------------------------------------------|

;;;|---------------------------------------------------------|
;;;| (fullscreen)
;;;|---------------------------------------------------------|
; (defun fullscreen ()
;        (interactive)
;        (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
;                  '(2 "_NET_WM_STATE_FULLSCREEN" 0)))
; (fullscreen)
;;;|---------------------------------------------------------|
