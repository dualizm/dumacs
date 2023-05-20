;;; funez.el --- Collection of useful functions

;;; Commentary:

;;; ezmacs collection of functions --- Collection of useful functions

;;; Code:

;;; FUNCTIONS
(defun maplist (fn list)							     
  "FN: a designator for a function that must take as many arguments as there are lists.
   LIST: a proper list."							     
  (if (null list) list								     
    (cons (funcall fn list) (maplist fn (cdr list)))))				     
										     
(defun reduce (fn init list)							     
  "FN: afaf.  INIT: wkefw.  LIST: rqweqw."					     
  (if (null list) init								     
    (reduce fn (funcall fn init (car list)) (cdr list))))			     
										     
(defun tail (list)								     
  "LIST: bsa."									     
  (if (null (cdr list)) (car list)						     
    (tail (cdr list))))								     

;;; EMACS CONFIG FUNCTIONS
(defun toggle-window-split ()
  "Toggle window."
  (interactive)
  (if (= (count-windows) 2)					   
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
	  (if this-win-2nd (other-window 1))))))		   

(defun subparse-|> (result acc list)						     
  "RESULT: fsdf.  ACC: aedasd.  LIST: wsfsd."					     
  (if (null list)								     
      (append result (list acc))						     
    (if (eq (car list) '|)							     
	(subparse-|> (append result (list acc)) '() (cdr list))			     
      (subparse-|> result (append acc (list (car list))) (cdr list)))))		     
										     
(defun parse-|> (list)								     
  "LIST: asd."									     
  (subparse-|> '() '() list))							     
										     
(defmacro |> (name &rest packages)						     
  "NAME: is category name.  PACKAGES: is collection of use-packages."		     
  `(progn									     
     ,@(let ((p (parse-|> (cdr packages))))					     
	 (mapcar								     
	  #'(lambda (package)							     
	      `(use-package ,(car package) ,@(cdr package)))			     
	  p))))

(defun defont (font)
  "FONT: fsdf."
  (when (find-font (font-spec :name font))
    (set-face-attribute 'default nil :font font :height 130)))

(defmacro unless-cond (&rest cases)					     
  "CASES: list forms."							     
  `(progn								     
     ,@(mapcar #'(lambda (case) `(unless ,(car case) ,(cadar case))) cases)))

(defun save-directories (backups saves)			
  "BACKUPS: sdff.  SAVE: wsefd."
  (unless-cond			
   ((file-directory-p backups) (make-directory backups))
   ((file-directory-p saves) (make-directory saves)))
  (setq backup-directory-alist
	`((".*" . ,backups)))
  (setq auto-save-file-name-transforms
	`((".*" ,saves t))))

(defun fullscreen ()
  "Sdfs."
  (interactive)
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32	     
			 '(2 "_NET_WM_STATE_FULLSCREEN" 0)))
;;; funez.el ends here
