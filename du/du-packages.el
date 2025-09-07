;;; du-packages.el --- конфигурация пакетов

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

;; редактирование текста
(use-package company
  :hook (prog-mode text-mode)
  :config (setf company-idle-delay 0.3
		company-minimum-prefix-length 2))

(use-package company-box
  :hook (company-mode . company-box-mode))

(use-package vertico
  :config (vertico-mode))

(use-package rainbow-mode
  :config
  (setf rainbow-html-colors t
        rainbow-x-colors t
        rainbow-hex-colors t
        rainbow-rgb-colors t
        rainbow-color-names t))

;; lsp
(use-package lsp-mode
  :commands lsp
  :init (setf lsp-keymap-prefix "C-c l")
  :config
  (setf lsp-headerline-breadcrumb-segments '(path-up-to-project file symbols))
  (lsp-enable-which-key-integration t))

(use-package lsp-ui
  :after lsp-mode
  :commands lsp-ui-mode
  :config
  (setf lsp-ui-peek-always-show t
        lsp-ui-sideline-show-hover t
        lsp-ui-doc-enable t))

;; проекты
(use-package projectile
  :diminish projectile-mode
  :config
  (projectile-mode +1)
  (setf projectile-ignored-projects '("~/tmp" "/tmp")))

(with-eval-after-load 'projectile
  (load "du-js.el" nil :noerror)
  (message "JavaScript конфигурация загружена"))

;; файлы
(use-package treemacs
  :config
  (treemacs-follow-mode t)
  (treemacs-filewatch-mode t))

(use-package treemacs-projectile
  :after treemacs projectile)

;; снипеты
(use-package yasnippet
  :config
  (push "~/.emacs.d/snippets/" yas/snippet-dirs)
  (yas/global-mode t)
  (add-to-list 'auto-mode-alist '("/snippets/" . snippet-mode)))

;; git
(use-package magit
  :commands magit-status)

(use-package diff-hl
  :hook ((prog-mode . diff-hl-mode)
         (magit-post-refresh . diff-hl-magit-post-refresh)))

;; common-lisp
(use-package sly
  :config (setq inferior-lisp-program "sbcl"))

;; javascript
(use-package prettier-js
  :hook ((js-mode ts-mode jsx-mode typescript-mode) . prettier-js-mode))

(use-package eslintd-fix
  :hook ((js-mode ts-mode jsx-mode typescript-mode) . eslintd-fix-mode))

;; LSP интеграция
(add-hook 'js-ts-mode-hook #'lsp)
(add-hook 'typescript-ts-mode-hook #'lsp)
(add-hook 'tsx-ts-mode-hook #'lsp)

;; Форматирование
(add-hook 'js-ts-mode-hook #'prettier-js-mode)
(add-hook 'typescript-ts-mode-hook #'prettier-js-mode)
(add-hook 'tsx-ts-mode-hook #'prettier-js-mode)
