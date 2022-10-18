;;;;|----------------------------------------------------|
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
;;;;|----------------------------------------------------|

;;;;|----------------------------------------------------|
;;;;| (move)
;;;;|----------------------------------------------------|
(set-gbinds '(
   "M-h"  backward-char 
   "M-k"  previous-line 
   "M-j"  next-line 
   "M-l"  forward-char 
   "M-L"  move-end-of-line 
   "M-H"  move-beginning-of-line 
   "M-K"  scroll-down-command 
   "M-J"  scroll-up-command 
   "M-f"  forward-word 
   "M-b"  backward-word 
   "M-<"  beginning-of-buffer 
   "M->"  end-of-buffer 
   "M-p"  goto-line 
))
;;;;|----------------------------------------------------|
