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
;;;;| (edit-text)
;;;;|----------------------------------------------------|
(set-gbinds '(
  "C-x c" delete-char
  "C-x w" kill-word
  "C-x l" kill-line
  "C-x s" kill-sentence
  "C-x h" delete-horizontal-space
  "C-q"     quoted-insert
  "C-x p"   fill-paragraph
))
;;;;|----------------------------------------------------|
