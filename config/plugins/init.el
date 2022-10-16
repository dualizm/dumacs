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
    use-package         ; improvements require
    pulse               ; cool bean
    smooth-scroll       ; cool scroll
    sly                 ; old -> slime
    evil                ; hjkl
    lsp                 ; auto complete
    linum               ; line numbers
    rainbow-mode        ; hightlight #d34474
    rainbow-delimiters  ; (((((((()))))))) many colors
    company             ; auto compl[ete]
    ido                 ; interactively do things 
    bs                  ; buffer selection
  ; projectlite         ; project interaction library
)) 
;;;|---------------------------------------------------------|
