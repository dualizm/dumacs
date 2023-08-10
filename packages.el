(load "~/.emacs.d/api.el")

(require 'package)
(add-to-list 'package-archives
	     '(("melpa-stable" . "https://stable.melpa.org/packages/")
	       ("melpa" . "https://melpa.org/packages/")
               ("elpa" . "https://elpa.gnu.org/packages/")
               ("nongnu" . "https://elpa.nongnu.org/nongnu/")))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents t)
  (package-install 'use-package))

(eval-and-compile
  (require 'use-package))

(eval-and-compile
  (setq use-package-always-ensure t
        use-package-expand-minimally t))

(|> auto-complete
    | company
    :init (global-company-mode t)
    (setq company-idle-delay 0))

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
	   (php-mode . lsp-deferred)
	   (clojure-mode . lsp-deferred))
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
    | geiser-chez
    | geiser-guile)

(|> clojure
    | clojure-mode
    | cider)

(|> c/cxx
    | meson-mode
    | makefile-executor)

(|> rust
    | rust-mode)

(|> themes
    | cherry-blossom-theme
    | naysayer-theme
    | majapahit-themes)

(|> web
    | js-doc
    | js2-mode
    | ac-js2
    | web-mode
    | json-mode)

(|> php
    | php-mode)
