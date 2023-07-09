(load "~/.emacs.d/api.el")

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
	   (clojure-mode . lsp-deferred))
    :commands (lsp lsp-deferred)
    | lsp-ui
    :commands lsp-ui-mode)

(|> ocaml
    | tuareg
    :mode "\\.ocamlinit\\'"
    | dune
    | utop
    :hook (tuareg-mode . utop-minor-mode)
    | merlin-mode
    :hook ((tuareg-mode . merlin-mode)
	   (merlin-mode . company-mode))
    | merlin-eldoc
    :hook (tuareg-mode . merlin-eldoc-setup)
    | flycheck-ocaml
    :config (flycheck-ocaml-setup))

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
    | naysayer-theme
    | jazz-theme)

(|> web
    | js-doc
    | js2-mode
    | ac-js2
    | web-mode
    | json-mode)
