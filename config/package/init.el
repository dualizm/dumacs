;;;;|--------------------------------------------------------|
;;;;| @AUTHORS notidman <ognieff@yandex.ru>
;;;;|
;;;;| @URL https://github.com/notidman/nimacs
;;;;|
;;;;| @PROJECT-NAME nimacs
;;;;|
;;;;| @DATE-START 29-09-22
;;;;|
;;;;| @BRIEF sets up a convenient management system 
;;;;|           of plugins and mirrors
;;;;|
;;;;|--------------------------------------------------------|

;;;|---------------------------------------------------------|
;;;| (package)
;;;|---------------------------------------------------------|
(require 'package)
(setf package-archives
      '(("melpa" . "https://melpa.org/packages/")
        ("elpa" . "https://elpa.gnu.org/packages/")
        ("nongnu" . "https://elpa.nongnu.org/nongnu/")))
(package-initialize)

(dolist (package '(use-package))
   (unless (package-installed-p package)
       (package-install package)))

(eval-and-compile
  (setq use-package-always-ensure t
        use-package-expand-minimally t))
;;;|---------------------------------------------------------|
