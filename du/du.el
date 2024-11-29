;;; du.el --- Collection of useful functions

(defun du/parse-vertical-lines (list)
  (let ((result '()) (buff '()))
    (dolist (el list)
      (if (eq el '|)
	  (progn
	    (push (nreverse buff) result)
	    (setq buff '()))
	(push el buff)))
    (unless (null buff) (push (nreverse buff) result))
    (nreverse result)))

(defmacro du/defpacks (name &rest packages)
  (unless (and (symbolp name) (not (eql name '|)))
    (error "Enter the name of the package category!"))
  `(progn
     ,@(mapcar
	(lambda (package)
	  `(use-package ,(car package) ,@(cdr package)))
	`,(du/parse-vertical-lines (cdr packages)))))

(defun du/deffont (font)
  (when (find-font (font-spec :name font))
    (set-face-attribute 'default nil :font font :height 120)))

(defmacro du/unless-map (&rest cases)
  `(progn
     ,@(mapcar #'(lambda (case) `(unless ,(car case) ,(cadar case))) cases)))

(defun du/save-directories (backups saves)
  (du/unless-map
   ((file-directory-p backups) (make-directory backups))
   ((file-directory-p saves) (make-directory saves)))
  (setq backup-directory-alist
	`((".*" . ,backups)))
  (setq auto-save-file-name-transforms
	`((".*" ,saves t))))

(defun du/fullscreen ()
  (interactive)
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
			 '(2 "_NET_WM_STATE_FULLSCREEN" 0)))

(defun du/remove-tabs ()
  (interactive)
  (set-variable 'tab-width 2)
  (mark-whole-buffer)
  (untabify (region-beginning) (region-end))
  (keyboard-quit))

(defun du/toggle-comment-on-line ()
  "comment or uncomment line"
  (interactive)
  (comment-or-uncomment-region (line-beginning-position) (line-end-position)))


