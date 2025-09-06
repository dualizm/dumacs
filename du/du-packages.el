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
  :config (setq company-idle-delay 0))

(use-package vertico
  :config (vertico-mode))

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
;; (use-package magit

;; common-lisp
(use-package sly
  :config (setq inferior-lisp-program "sbcl"))
