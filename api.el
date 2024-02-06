;;; api.el --- Collection of useful functions

(defun api/parse (list)
  (letrec ((parse
	    (lambda (result acc list)
	      (if (null list)
		  (append result (list acc))
		(if (eq (car list) '|)
		    (funcall parse (append result (list acc)) '() (cdr list))
		  (funcall parse result (append acc (list (car list))) (cdr list)))))))
    (funcall parse '() '() list)))

(defmacro ~> (name &rest packages)
  (when (or (eql name '|) (listp name))
    (error "Enter the name of the package category!"))
  (let ((packages (api/parse (cdr packages))))
    `((lambda ()
	 ,@(mapcar
	    #'(lambda (package)
		`(use-package ,(car package) ,@(cdr package)))
	    packages)))))

(defmacro api/lsp-mods-transfrom (&rest mods)
  (let ((mods (api/parse (cdr mods))))
    `,@(mapcar
	#'(lambda (mod)
	    `(,(car mod) . lsp-deferred)) mods)))

(defun api/font (font)
  (when (find-font (font-spec :name font))
    (set-face-attribute 'default nil :font font :height 120)))

(defmacro api/unless-map (&rest cases)
  `(progn
     ,@(mapcar #'(lambda (case) `(unless ,(car case) ,(cadar case))) cases)))

(defun api/save-directories (backups saves)
  (api/unless-map
   ((file-directory-p backups) (make-directory backups))
   ((file-directory-p saves) (make-directory saves)))
  (setq backup-directory-alist
	`((".*" . ,backups)))
  (setq auto-save-file-name-transforms
	`((".*" ,saves t))))

(defun api/fullscreen ()
  (interactive)
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
			 '(2 "_NET_WM_STATE_FULLSCREEN" 0)))

