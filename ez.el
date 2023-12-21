;;; ez.el --- Collection of useful functions

;;; Commentary:

;;; ezmacs collection of functions --- Collection of useful functions

;;; Code:

;;; EMACS CONFIG FUNCTIONS
(defun toggle-window-split ()
  "Toggle window."
  (interactive)
  (if (= (count-windows)
      (let* ((this-win-buffer (window-buffer))
	     (next-win-buffer (window-buffer (next-window)))
	     (this-win-edges (window-edges (selected-window)))
	     (next-win-edges (window-edges (next-window)))
	     (this-win-2nd (not (and (<= (car this-win-edges)
					 (car next-win-edges))
				     (<= (cadr this-win-edges)
					 (cadr next-win-edges)))))
	     (splitter
	      (if (= (car this-win-edges)
		     (car (window-edges (next-window))))
		  'split-window-horizontally
		'split-window-vertically)))
	(delete-other-windows)
	(let ((first-win (selected-window)))
	  (funcall splitter)
	  (if this-win-2nd (other-window 1))
	  (set-window-buffer (selected-window) this-win-buffer)
	  (set-window-buffer (next-window) next-win-buffer)
	  (select-window first-win)
	  (if this-win-2nd (other-window 1)))))))

(defun ez/parse (list)
  "LIST: contain |."
  (letrec ((parse
	    (lambda (result acc list)
	      (if (null list)
		  (append result (list acc))
		(if (eq (car list) '|)
		    (funcall parse (append result (list acc)) '() (cdr list))
		  (funcall parse result (append acc (list (car list))) (cdr list)))))))
    (funcall parse '() '() list)))

(defmacro ez/>> (name &rest packages)
  "NAME: is catoegory name.  PACKAGES: is collection of use-packages."
  (when (or (eql name '|) (listp name))
    (error "Enter the name of the package category!"))
  (let ((packages (ez/parse (cdr packages))))
    `((lambda ()
	 ,@(mapcar
	    #'(lambda (package)
		`(use-package ,(car package) ,@(cdr package)))
	    packages)))))

(defmacro ez/lsp-mods-transfrom (&rest mods)
  (let ((mods (ez/parse (cdr mods))))
    `,@(mapcar
	#'(lambda (mod)
	    `(,(car mod) . lsp-deferred)) mods)))

(defun ez/font (font)
  "FONT: selected font."
  (when (find-font (font-spec :name font))
    (set-face-attribute 'default nil :font font :height 120)))

(defmacro ez/unless-map (&rest cases)
  "CASES: list forms."
  `(progn
     ,@(mapcar #'(lambda (case) `(unless ,(car case) ,(cadar case))) cases)))

(defun ez/save-directories (backups saves)
  "BACKUPS: the path to the directory with backups.
SAVES: the path to the directory with saves."
  (ez/unless-map
   ((file-directory-p backups) (make-directory backups))
   ((file-directory-p saves) (make-directory saves)))
  (setq backup-directory-alist
	`((".*" . ,backups)))
  (setq auto-save-file-name-transforms
	`((".*" ,saves t))))

(defun fullscreen ()
  "Make Emacs to fullscreen."
  (interactive)
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
			 '(2 "_NET_WM_STATE_FULLSCREEN" 0)))
;;; funez.el ends here
