;;;; du-settings.el --- dumacs настройки

;; предупреждения
(defvar warning-minimum-level :emergency)
(setq byte-compile-warnings '(not docstring))
(setq visible-bell 'ignore)
(setq ring-bell-function 'ignore)

;; yes/no -> y/n
(defalias 'yes-or-no-p 'y-or-n-p)

;; директории для сохранения
(du/save-directories
 "~/.emacs.d/.backups/"
 "~/.emacs.d/.auto-saves/")

;; ui
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))
(when (fboundp 'menu-bar-mode)
  (menu-bar-mode -1))
(when (fboundp 'blink-cursor-mode)
  (blink-cursor-mode -1))

;; начальный frame
(add-to-list 'default-frame-alist '(height . 45))
(add-to-list 'default-frame-alist '(width . 100))

;; шрифт
(du/select-font "-JB-JetBrains Mono-normal-normal-normal-*-19-*-*-*-m-0-iso10646-1")

;; показывает путь в заголовке фрейма
(setq frame-title-format "%b (%f)")

;; прозрачность
;;(set-frame-parameter (selected-frame) 'alpha '(95 . 50))
;;(add-to-list 'default-frame-alist '(alpha . (95 . 50)))

;; mode line
(setq display-time-24hr-format t)
(setq display-time-interval 60)
(display-time-mode 1)

;; highlight line
(global-hl-line-mode 1)

;; line numbers
(global-display-line-numbers-mode 1)

(dolist (hook '(shell-mode-hook
                term-mode-hook
		eshell-mode-hook
		org-mode-hook))
  (add-hook hook #'du/disable-display-line-numbers-mode))

;; shell scripts
(setq sh-basic-offset 2)
(setq sh-indentation 2)

;; Make gc pauses faster by decreasing the threshold.
;;(setq gc-cons-threshold (* 2 1000 1000))

;; theme
(load-theme 'deeper-blue t)

;; company
(add-hook 'prog-mode-hook 'company-mode)
(add-hook 'text-mode-hook 'company-mode)
(setq company-idle-delay 0.3)
(setq company-minimum-prefix-length 2)

;; company-box
(with-eval-after-load 'company
  (add-hook 'company-mode-hook 'company-box-mode)
  (company-box-mode 1))

;; vertico
(vertico-mode 1)

;; rainbow-mode
(setq rainbow-html-colors t)
(setq rainbow-x-colors t)
(setq rainbow-hex-colors t)
(setq rainbow-rgb-colors t)
(setq rainbow-color-names t)

;; projectile
(projectile-mode 1)
(setq projectile-ignored-projects '("~/tmp" "/tmp"))

;; treemacs
(with-eval-after-load 'treemacs
  (treemacs-follow-mode t)
  (treemacs-filewatch-mode t)
  (global-set-key (kbd "C-c t") 'treemacs-select-window))

;; yasnippet
(yas-global-mode 1)
(push "~/.emacs.d/snippets/" yas-snippet-dirs)
(add-to-list 'auto-mode-alist '("/snippets/" . snippet-mode))

;; tree-sitter
(with-eval-after-load 'tree-sitter
  (global-tree-sitter-mode 1)
  (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode)

  (require 'tree-sitter-langs)
  (let ((languages-support elisp javascript css html json lua c cpp))
    (dolist (lang languages-support t)
      (tree-sitter-require lang))))

;; diff-hl
(add-hook 'prog-mode-hook 'diff-hl-mode)
(add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh)

;; lsp
(setq lsp-headerline-breadcrumb-segments '(path-up-to-project file symbols))
(setq lsp-ui-peek-always-show t)
(setq lsp-ui-sideline-show-hover t)
(setq lsp-ui-doc-enable t)

;; lua
(add-to-list 'interpreter-mode-alist '("lua" . lua-mode))

;; common lisp
(setq inferior-lisp-program "sbcl")

(provide 'du-settings)

