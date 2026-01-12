;;;; du-packages.el --- конфигурация пакетов

;; boostrap straight.el
(defvar bootstrap-version)
(eval-and-compile
  (let ((bootstrap-file
         (expand-file-name
          "straight/repos/straight.el/bootstrap.el"
          (or (bound-and-true-p straight-base-dir)
              user-emacs-directory)))
        (bootstrap-version 7))
    (unless (file-exists-p bootstrap-file)
      (with-current-buffer
          (url-retrieve-synchronously
           "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
           'silent 'inhibit-cookies)
        (goto-char (point-max))
        (eval-print-last-sexp)))
    (load bootstrap-file nil 'nomessage)))

(straight-use-package 'company)
(straight-use-package 'company-box)

(straight-use-package 'vertico)
(straight-use-package 'rainbow-mode)

;; проекты
(straight-use-package 'projectile)

;; файлы
(straight-use-package 'treemacs)

(when (and (package-installed-p 'treemacs)
	   (package-installed-p 'projectile))
  (straight-use-package 'treemacs-projectile))

;; снипеты
(straight-use-package 'yasnippet)

;; lsp
(straight-use-package 'lsp-mode)
(straight-use-package 'lsp-ui)

;; подсветка синтансиса
(straight-use-package 'tree-sitter)
(straight-use-package 'tree-sitter-langs)

;; git
(straight-use-package 'magit)

(straight-use-package 'diff-hl)

;; clojure
(straight-use-package 'clojure-mode)
(straight-use-package 'cider)

;; common-lisp
(straight-use-package 'sly)

;; javascript

;; Форматирование
;;(add-hook 'js-ts-mode-hook #'prettier-js-mode)
;;(add-hook 'typescript-ts-mode-hook #'prettier-js-mode)
;;(add-hook 'tsx-ts-mode-hook #'prettier-js-mode)

(provide 'du-packages)
