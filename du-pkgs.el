(load "~/.emacs.d/du.el")

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

(du/defpacks
 auto-complete
 | company
 :init (global-company-mode t)
 (setq company-idle-delay 0))

(du/defpacks
 git
 | magit)

(du/defpacks
 completion
 | vertico
 :init (vertico-mode))

(du/defpacks motion
    | avy
    :bind (("M-g c" . 'avy-goto-char)
	   ("M-g l" . 'avy-goto-line)
	   ("M-g f" . 'avy-goto-word-1)))

(du/defpacks helping
    | rainbow-mode
    :hook (prog-mode . rainbow-mode)
    | rainbow-delimiters
    :hook (prog-mode . rainbow-delimiters-mode)
    | paredit
    :mode (("\\.lisp\\'" . paredit-mode)
	   ("\\.cl\\'" . paredit-mode)
	   ("\\.el\\'" . paredit-mode)
	   ("\\.scm\\'" . paredit-mode)
	   ("\\.ss\\'" . paredit-mode)
	   ("\\.rkt\\'" . paredit-mode)
	   ("\\.clj\\'" . paredit-mode)))

;; (~> lsp
;;     | lsp-mode
;;     :hook (api/lsp-mods-transfrom
;; 	   | c-mode)
;;     :commands (lsp lsp-deferred)
;;     | lsp-ui
;;     :commands lsp-ui-mode)

;; (~> lisp
;;     | sly
;;     :init
;;     (setq inferior-lisp-program "sbcl"))

(du/defpacks themes
    | kaolin-themes
    | cherry-blossom-theme
    | naysayer-theme
    | majapahit-themes)

