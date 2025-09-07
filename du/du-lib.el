;;; du-lib.el --- Коллекция полезных функций

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
  
