;;;;|--------------------------------------------------------|
;;;;| @AUTHORS notidman <ognieff@yandex.ru>
;;;;|
;;;;| @URL https://github.com/notidman/nimacs
;;;;|
;;;;| @PROJECT-NAME nimacs
;;;;|
;;;;| @DATE-START 29-09-22
;;;;|
;;;;| @BRIEF plugin config
;;;;|
;;;;|--------------------------------------------------------|

;;;|---------------------------------------------------------|
;;;| (lsp)
;;;|---------------------------------------------------------|
(use-package lsp-mode
    :hook ((c-mode . lsp-deferred)
           (c++-mode . lsp-deferred)))
;;;|---------------------------------------------------------|
; (use-package lsp-mode
;   :bind ((:map lsp-mode-map
;                ("M-<return>" . lsp-execute-code-action))
;          (:map c++-mode-map
;                ("C-c x" . lsp-clangd-find-other-file))
;          (:map c-mode-map
;                ("C-c x" . lsp-clangd-find-other-file)))
;   :hook ((c-mode . lsp-deferred)
;          (c++-mode . lsp-deferred)
;          (typescript-mode . lsp-deferred)
;          (javascript-mode . lsp-deferred)
;          (js-mode . lsp-deferred)
;          (rust-mode . lsp-deferred))
;   :commands (lsp lsp-deferred)
;   :init
;   ;; Increase the amount of data emacs reads from processes
;   (setq read-process-output-max (* 1024 1024))
;   (setq lsp-enable-snippet nil)
;   (setq lsp-enable-on-type-formatting nil)
;   (setq lsp-enable-indentation nil)
;   (with-eval-after-load 'js
;     (define-key js-mode-map (kbd "M-.") nil))
;   (setq lsp-diagnostics-provider :flymake)
;   (setq lsp-keymap-prefix "C-x L")
;   (add-hook 'lsp-completion-mode-hook
;             (lambda ()
;               (setf (alist-get 'lsp-capf completion-category-defaults) '((styles . (orderless flex)))))))
