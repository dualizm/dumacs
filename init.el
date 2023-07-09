;;; init.el --- Initialization file for ezmacs

;;; Commentary:

;; ezmacs startup file --- Initialization for ezmacs

;;; Code:

;;; ABOUT EZMACS

(defvar ezmacs-info
  '((file         . "init.el")
    (authors      . "cloezure")
    (version      . "0.0.3")
    (email        . "ognieff@yandex.ru")
    (url          . "https://github.com/cloezure/ezmacs")
    (project-name . "ezmacs")
    (date-start   . "29-09-22")
    (brief        . "config for author"))
  "Contain information about the ezmacs build.")

(defun ezmacs-about (key)
  "KEY: value from ezmacs-info."
  (message (cdr (assoc key ezmacs-info))))

(load "~/.emacs.d/api.el")
(load "~/.emacs.d/settings.el")
(load "~/.emacs.d/packages.el")

(load-theme 'naysayer t)

;;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(flycheck-ocaml merlin-eldoc merlin-mode utop dune tuareg naysayer-theme gruvbox-theme geiser-chicken geiser-chibi caml caml-mode ocaml-mode paredit-mode paredit parinfer-mode parinfer inf-clojure inf-clojure-mode cider cider-mode clojure-mode haskell-mode yasnippet vertico use-package transpose-frame sly-quicklisp rust-mode rmsbolt rainbow-mode rainbow-delimiters racket-mode pdf-tools org-bullets meson-mode makefile-executor magit lsp-ui js2-mode jazz-theme highlight-indent-guides geiser-guile geiser-gauche geiser-gambit geiser-chez flycheck consult company cherry-blossom-theme avy))
 '(warning-suppress-log-types '((comp) (comp)))
 '(warning-suppress-types '((comp))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
