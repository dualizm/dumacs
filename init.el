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

(load "~/.emacs.d/funez.el")

;;; SETTINGS

;;; warnings
(defvar warning-minimum-level :emergency)
(setf visible-bell 1)

(save-directories "~/.emacs.d/.backups/" "~/.emacs.d/.auto-saves/")

;;; gui
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode)   (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode)   (menu-bar-mode -1))

;;; font
;;(defont "-JB-JetBrains Mono-normal-normal-normal-*-19-*-*-*-m-0-iso10646-1")
(defont "-CTDB-Fira Code-normal-normal-normal-*-13-*-*-*-m-0-iso10646-1")

;;; start screen
(setq inhibit-startup-screen t)

;;; transparency
(set-frame-parameter (selected-frame) 'alpha '(95 . 50))
;;(add-to-list 'default-frame-alist '(alpha . (95 . 50)))

;;; mode line
(defvar display-time-24hr-format t)
(defvar display-time-interval 1)
(display-time)

;;; binds
(global-set-key (kbd "C-x |") 'toggle-window-split)

(global-set-key (kbd "C-x p l")
		(lambda ()
		  (interactive)
		  (insert (char-from-name "GREEK SMALL LETTER LAMBDA"))))

;;; PACKAGES
(require 'package)
(setf package-archives
      '(("melpa-stable" . "https://stable.melpa.org/packages/")
	("melpa" . "https://melpa.org/packages/")
        ("elpa" . "https://elpa.gnu.org/packages/")
        ("nongnu" . "https://elpa.nongnu.org/nongnu/")))
(package-initialize)

(dolist (package '(use-package))
  (unless (package-installed-p package)
    (package-install package)))

(eval-and-compile
  (setq use-package-always-ensure t
        use-package-expand-minimally t))

(eval-and-compile
  (require 'use-package))

(|> auto-complete
    | company
    :init (global-company-mode t)
    (setq company-idle-delay 0))

(|> syntax-checking
    | flycheck
    :init
    (global-flycheck-mode t))

(|> disassembly
    | rmsbolt)

(|> highlight-indent-guides
    | highlight-indent-guides
    :config
    (setq highlight-indent-guides-method 'bitmap)
    :hook (prog-mode . highlight-indent-guides-mode))

(|> org-mode
    | org
;;;(variable-pitch-mode 1)
;;;(auto-fill-mode 0)
;;;(visual-line-mode 1))
    :hook (org-mode . org-indent-mode)
    | org-bullets
    :hook
    (org-mode . org-bullets-mode))

(|> pdf-viewer
    | pdf-tools
    | transpose-frame)

(|> git
    | magit)

(|> completion
    | vertico
    :init (vertico-mode))

(|> motion
    | avy
    :bind (("C-:" . 'avy-goto-char)
	   ("C-'" . 'avy-goto-char-2)
	   ("M-g l" . 'avy-goto-line)
	   ("M-g f" . 'avy-goto-word-1)))

(|> template-system
    | yasnippet
    :config (yas-global-mode t))

(|> helping
    | rainbow-mode
    :hook (prog-mode . rainbow-mode)
    | rainbow-delimiters
    :hook (prog-mode . rainbow-delimiters-mode)
    | paredit
    :hook (prog-mode . paredit-mode))

(|> lsp
    | lsp-mode
    :hook ((c-mode . lsp-deferred)
	   (c++-mode . lsp-deferred)
	   (rust-mode . lsp-deferred)
	   (clojure-mode . lsp-deferred)
	   (ocaml-mode . lsp-deferred))
    :commands (lsp lsp-deferred)
    | lsp-ui
    :commands lsp-ui-mode)

(|> lisp
    | sly
    :init
    (setq inferior-lisp-program "sbcl")
    :config
    (use-package sly-quicklisp))

(|> scheme
    | geiser-chez)

(|> racket
    | racket-mode
    :hook
    (racket-mode . racket-xp-mode))

(|> clojure
    | clojure-mode
    | cider
    | inf-clojure)

(|> c/cxx
    | meson-mode
    | makefile-executor)

(|> rust
    | rust-mode)

(|> themes
    | cherry-blossom-theme
    | jazz-theme)

(|> web
    | js-doc
    | js2-mode
    | ac-js2
    | web-mode
    | json-mode)

(load-theme 'jazz t)

;;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(geiser-chibi caml caml-mode ocaml-mode paredit-mode paredit parinfer-mode parinfer inf-clojure inf-clojure-mode cider cider-mode clojure-mode haskell-mode yasnippet vertico use-package transpose-frame sly-quicklisp rust-mode rmsbolt rainbow-mode rainbow-delimiters racket-mode pdf-tools org-bullets meson-mode makefile-executor magit lsp-ui js2-mode jazz-theme highlight-indent-guides geiser-guile geiser-gauche geiser-gambit geiser-chez flycheck consult company cherry-blossom-theme avy)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
