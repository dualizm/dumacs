;;;;|----------------------------------------------------|
;;;;| @AUTHORS notidman <ognieff@yandex.ru>
;;;;|
;;;;| @URL https://github.com/notidman/nimacs
;;;;|
;;;;| @PROJECT-NAME nimacs
;;;;|
;;;;| @DATE-START 29-09-22
;;;;|
;;;;| @BRIEF plugin config
;;;;|
;;;;|----------------------------------------------------|

;;;;|----------------------------------------------------|
;;;;| (pulse)
;;;;|----------------------------------------------------|
(use-package pulse
  ;; Highlight cursor postion after movement
  :defer t
  :init 
  (defun pulse-line (&rest _)
          (pulse-momentary-highlight-one-line (point)))
  (dolist (command '(other-window windmove-do-window-select mouse-set-point mouse-select-window))
    (advice-add command :after #'pulse-line)))
;;;;|----------------------------------------------------|
