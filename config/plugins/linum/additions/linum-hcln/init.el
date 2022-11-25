;;;;|----------------------------------------------------|
;;;;| @AUTHORS notidman <ognieff@yandex.ru>
;;;;|
;;;;| @URL https://github.com/notidman/nimacs
;;;;|
;;;;| @PROJECT-NAME nimacs
;;;;|
;;;;| @DATE-START 29-09-22
;;;;|
;;;;| @BRIEF additions config
;;;;|
;;;;|----------------------------------------------------|

;;;;|----------------------------------------------------|
;;;;| (linum/linum-hcln)
;;;;|----------------------------------------------------|

(defface linum-current-line-number-face
  `((t :inherit linum
       :foreground "goldrod" ;;"#d34474"
       :weight bold))
  "Face for displaying the current line number."
  :group 'linum)

(defvar linum-current-line 1 "Current line number.")
(defvar linum-border-width 1 "Border width for linum.")

(defun width-border ()
  (number-to-string (+ 1 (length (number-to-string
    (count-lines (point-min) (point-max)))))))

;; Functions
(defadvice linum-update (before advice-linum-update activate)
  "Set the current line."
  (setq linum-current-line (line-number-at-pos)
        linum-border-width (width-border)))

(defun linum-highlight-current-line-number (line-number)
  "Highlight the current line number using `linum-current-line-number-face' face."
  (let ((face (if (= line-number linum-current-line)
                  'linum-current-line-number-face
                'linum)))
    (propertize (format (concat "%" linum-border-width "d") line-number)
                'face face)))

(setq linum-format 'linum-highlight-current-line-number)
;;;;|----------------------------------------------------|
