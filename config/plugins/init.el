;;;;|----------------------------------------------------|
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
;;;;|----------------------------------------------------|

;;;;|----------------------------------------------------|
;;;;| (plugins)
;;;;|----------------------------------------------------|
(load-plugins '(
    use-package         ; improvements require
    pulse               ; cool bean
    smooth-scroll       ; cool scroll
    sly                 ; old -> slime
  ; evil                ; hjkl (bad for emacs)
    lsp                 ; auto complete
    linum               ; line numbers
    rainbow-mode        ; hightlight #d34474
    rainbow-delimiters  ; (((((((()))))))) many colors
    company             ; auto compl[ete]
  ; bs                  ; buffer selection
    ivy                 ; tools for minibuffer completion
    yas                 ; template system
    flycheck            ; syntax checking
  ; ido                 ; interactively do things 
    projectile          ; project interaction library
)) 
;;;;|----------------------------------------------------|
