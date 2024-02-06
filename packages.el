(load "~/.emacs.d/api.el")

(require 'package)
(setf package-archives
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

(~> auto-complete
       | company
       :init (global-company-mode t)
       (setq company-idle-delay 0))

(~> highlight-indent-guides
       | highlight-indent-guides
       :config
       (setq highlight-indent-guides-method 'bitmap)
       :hook (prog-mode . highlight-indent-guides-mode))

(~> git
       | magit)

(~> completion
       | vertico
       :init (vertico-mode))

(~> motion
       | avy
       :bind (("C-:" . 'avy-goto-char)
	      ("C-'" . 'avy-goto-char-2)
	      ("M-g l" . 'avy-goto-line)
	      ("M-g f" . 'avy-goto-word-1)))

(~> helping
       | rainbow-mode
       :hook (prog-mode . rainbow-mode)
       | rainbow-delimiters
       :hook (prog-mode . rainbow-delimiters-mode)
       | paredit
       :hook (prog-mode . paredit-mode))

(~> lsp
       | lsp-mode
       :hook (api/lsp-mods-transfrom
	      | c-mode)
       :commands (lsp lsp-deferred)
       | lsp-ui
       :commands lsp-ui-mode)

(~> lisp
       | sly
       :init
       (setq inferior-lisp-program "sbcl"))

(~> themes
       | kaolin-themes
       | cherry-blossom-theme
       | naysayer-theme
       | majapahit-themes)

