;;;; du-lib.el --- Коллекция полезных функций

(defun du/transform-vertical-lines (list)
  "Трансформирует '(aboba | biba 2 | jokerge) в ((aboba) (biba 2) (jokerge))."
  (let (result current)
    (dolist (element list)
      (if (eql element '|)
	  (progn
	    (push (nreverse current) result)
	    (setf current nil))
	(push element current)))
    (unless (null current) (push (nreverse current) result))
    (nreverse result)))

(defmacro du/defpacks (name &rest packages)
  "Объявляет пакеты в стиле (du/defpacks lisp | sly | slime)."
  (unless (and (symbolp name) (not (eql name '|)))
    (error "Enter the name of the package category!"))
  `(progn
     ,@(mapcar
	(lambda (package)
	  `(use-package ,(car package) ,@(cdr package)))
	`,(du/transform-vertical-lines (cdr packages)))))

(defun du/select-font (font)
  "Устанавливает шрифт для Emacs."
  (if (find-font (font-spec :name font))
      (set-face-attribute 'default nil :font font :height 130)
    (error (format "Font not found: [%s]" font))))

(defmacro du/unless-cases (&rest cases)
  "Выполняет все ложные случаи."
  `(progn
     ,@(mapcar #'(lambda (case) `(unless ,(car case) ,@(cdr case))) cases)))

(defun du/save-directories (backups saves)
  "Конфигурирует файлы в директории backup и save."
  (du/unless-cases
   ((file-directory-p backups) (make-directory backups))
   ((file-directory-p saves) (make-directory saves)))
  (setf
   backup-directory-alist `((".*" . ,backups))
   auto-save-file-name-transforms `((".*" ,saves t))))

(defun du/fullscreen ()
  "Заставляет Emacs открываться на весь экран."
  (interactive)
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
			 '(2 "_NET_WM_STATE_FULLSCREEN" 0)))

(defun du/remove-tabs ()
  "Заменяет все табы в файле на пробелы."
  (interactive)
  (set-variable 'tab-width 2)
  (mark-whole-buffer)
  (untabify (region-beginning) (region-end))
  (keyboard-quit))

(defun du/toggle-comment-on-line ()
  "Комментирует или раскомментирует регион."
  (interactive)
  (comment-or-uncomment-region (line-beginning-position) (line-end-position)))

(defun du/remove-last-char (string)
  "Возвращает новую строку с удалённым последним символов в STRING."
  (substring string 0 -1))

(defun du/disable-display-line-numbers-mode ()
  "Выключает отображение чисел в строках."
  (display-line-numbers-mode 0))

(defun du/create-and-setup-project (dir command)
  "Создаёт директорию (если нужна), запускает комманду и устанавливает проект."
  (interactive "DВведите директорию: \nsВведите консольную комманду: ")

  ;; создаём директорию если её нет
  (unless (file-directory-p dir)
    (make-directory dir t)
    (message "Директория создана в %s" dir))

  ;; переходим в директорию
  (let ((default-directory dir))
    ;; выполняем комманду
    (async-shell-command command)

    ;; добавляем в проекты
    (projectile-add-known-project dir)

    ;; открываем файловый менеджер в директории
    (dired dir)

    (message "Проект создан в %s" dir)))

(defun du/create-node-project (dir)
  "Создаёт Node.js проект с npm init"
  (interactive "DВведите директорию проекта: ")
  (du/create-and-setup-project dir "npm init -y"))

(defun du/git-clone-and-setup-project (url dir)
  "Клонирует репозиторий и устанавливает проект."
  (interactive "sВведите git url: \nDВведите выбранную директорию: ")
  (du/create-and-setup-project dir (format "git clone %s ." url)))

(defun du/create-project ()
  "Создание проекта с его выбором."
  (interactive)

  (let ((dir (read-directory-name "Директория проекта: "))
	(type (completing-read "Тип проекта: "
			       '("node" "git" "empty"))))
    (pcase type
      ("node" (du/create-node-project dir))
      ("git" (du/git-clone-and-setup-project
	      (read-string "Git url: ") dir))
      ("empty" (du/create-and-setup-project dir "echo 'Проект создан'"))
      (_ (error "Неизвестный тип проекта.")))))

(defun du/delete-inside-quotes (&optional keep-quotes)
  "Удаляет текст внутри кавычек, где находится курсор.
Если KEEP-QUOTES не nil, оставляет кавычки на месте.
Поддерживает экранированные кавычки (\\\", \\')."
  (interactive "P")
  (let ((quotes '("\"" "'" "`" "“" "‘"))
        (max-look-back 1000)
        start end quote-char open-pos close-pos)
    
    (save-excursion
      (save-restriction
        (widen)
        (setq start (point))
        
        ;; Функция для поиска кавычки с учетом экранирования
        (defun find-quote-backward (quote)
          (let ((found nil)
                (search-limit (max (point-min) (- (point) max-look-back))))
            (while (and (not found) 
                       (re-search-backward (regexp-quote quote) 
                                          search-limit t))
              ;; Проверяем, не экранирована ли кавычка
              (let ((prev-char (char-before (point))))
                (unless (eq prev-char ?\\)
                  (setq found (point)))))
            found))
        
        ;; Ищем открывающую кавычку
        (setq open-pos nil)
        (dolist (q quotes)
          (let ((pos (find-quote-backward q)))
            (when (and pos (or (null open-pos) (> pos open-pos)))
              (setq open-pos pos)
              (setq quote-char q))))
        
        (when open-pos
          (goto-char open-pos)
          (forward-char (length quote-char))
          
          ;; Ищем закрывающую кавычку
          (defun find-quote-forward (quote)
            (let ((found nil)
                  (search-limit (min (point-max) (+ (point) max-look-back))))
              (while (and (not found)
                         (re-search-forward (regexp-quote quote) 
                                           search-limit t))
                ;; Проверяем, не экранирована ли кавычка
                (save-excursion
                  (backward-char (length quote))
                  (let ((prev-char (char-before (point))))
                    (unless (eq prev-char ?\\)
                      (setq found (point))))))
              found))
          
          (setq close-pos (find-quote-forward quote-char))
          
          (when (and close-pos (> start open-pos) (< start close-pos))
            ;; Удаляем
            (if keep-quotes
                ;; Оставляем кавычки
                (delete-region (1+ open-pos) (1- close-pos))
              ;; Удаляем вместе с кавычками
              (delete-region open-pos close-pos))
            
            (goto-char open-pos)
            (unless keep-quotes
              (insert quote-char))
            (message "Текст %s кавычек удален" 
                     (if keep-quotes "внутри" "вместе с"))))))))
  
