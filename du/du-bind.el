;; du-bind.el --- configuration of bindings
(load "du-lib.el")

;; переключение комментариев
(global-set-key (kbd "C-;") 'du/toggle-comment-on-line)

(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
