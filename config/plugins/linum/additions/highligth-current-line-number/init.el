;;;;|--------------------------------------------------------|
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
;;;;|--------------------------------------------------------|

;;;|---------------------------------------------------------|
;;;| (linum/highligth-current-line-number)
;;;|---------------------------------------------------------|
(require 'linum)

;; Customization
(defface linum-current-line-number-face
  `((t :inherit linum
       :foreground "#d34474" ;"goldenrod"
       :weight bold))
  "Face for displaying the current line number."
  :group 'linum)

(defvar linum-current-line 1 "Current line number.")
(defvar linum-border-width 1 "Border width for linum.")

;; Functions
(defadvice linum-update (before advice-linum-update activate)
  "Set the current line."
  (setq linum-current-line (line-number-at-pos)
        ;; It's the same algorithm that linum dynamic. I only had added one
        ;; space in front of the first digit.
        linum-border-width (number-to-string
                            (+ 1 (length
                                  (number-to-string
                                   (count-lines (point-min) (point-max))))))))

(defun linum-highlight-current-line-number (line-number)
  "Highlight the current line number using `linum-current-line-number-face' face."
  (let ((face (if (= line-number linum-current-line)
                  'linum-current-line-number-face
                'linum)))
    (propertize (format (concat "%" linum-border-width "d") line-number)
                'face face)))

(provide 'linum-highlight-current-line-number)
(setq linum-format 'linum-highlight-current-line-number)
;;;|---------------------------------------------------------|
