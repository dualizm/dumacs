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
;;;| gui |
;;;|---------------------------------------------------------|
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
; (if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
;;;|---------------------------------------------------------|


;;;|---------------------------------------------------------|
;;;| font |
;;;|---------------------------------------------------------|
(set-frame-font 
  "-CTDB-FuraCode Nerd Font-normal-normal-normal-*-*-*-*-*-d-0-iso10646-1"
  nil t)
(set-face-attribute 'default nil :height 110)
;;;|---------------------------------------------------------|

;;;|---------------------------------------------------------|
;;;| transparency | 
;;;|---------------------------------------------------------|
; ;;(set-frame-parameter (selected-frame) 'alpha '(<active> . <inactive>))
; ;;(set-frame-parameter (selected-frame) 'alpha <both>)
; (set-frame-parameter (selected-frame) 'alpha '(85 . 50))
; (add-to-list 'default-frame-alist '(alpha . (85 . 50)))
;;;|---------------------------------------------------------|

;;;|---------------------------------------------------------|
;;;| fullscreen |
;;;|---------------------------------------------------------|
; (defun fullscreen ()
;        (interactive)
;        (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
;                  '(2 "_NET_WM_STATE_FULLSCREEN" 0)))
; (fullscreen)
;;;|---------------------------------------------------------|
