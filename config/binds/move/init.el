;;;;|--------------------------------------------------------|
;;;;| AUTHORS notidman <ognieff@yandex.ru>
;;;;|
;;;;| @URL https://github.com/notidman/nimacs
;;;;|
;;;;| @PROJECT-NAME nimacs
;;;;|
;;;;| @DATE-START 29-09-22
;;;;|
;;;;| @BRIEF contains bindings for nimacs
;;;;|
;;;;|--------------------------------------------------------|

;;;|---------------------------------------------------------|
;;;| move |
;;;|---------------------------------------------------------|
(global-set-key (kbd "M-h") 'backward-char)
(global-set-key (kbd "M-k") 'previous-line)
(global-set-key (kbd "M-j") 'next-line)
(global-set-key (kbd "M-l") 'forward-char)

(global-set-key (kbd "M-L") 'move-end-of-line)
(global-set-key (kbd "M-H") 'move-beginning-of-line)
(global-set-key (kbd "M-K") 'scroll-down-command)
(global-set-key (kbd "M-J") 'scroll-up-command)
;;;|---------------------------------------------------------|

