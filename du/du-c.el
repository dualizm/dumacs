;;;; du-c.el --- C функции для работы

(defun add-implementation ()
  "Добавляет функцию реализации в .c файл из строчки объявления в .h файле."
  (interactive)
  (let ((line-text (buffer-substring-no-properties (line-beginning-position) (line-end-position)))
	(current-file (buffer-file-name))
	c-file file-created?)
    ;; TODO Проверяем корректность объявления
    ;; Поиск соответствующего .c файла
    (cond
     ((string-match "\\(.*\\)\\.h$" current-file)
      (setq c-file (concat (match-string 1 current-file) ".c")))
     ((string-match "\\(.*\\)_impl\\.h$" current-file)
      (setq c-file (concat (match-string 1 current-file) ".c")))
     (t
      (error "Текущий файл не является .h файлом")))
    
    ;; Проверка существования .c файла
    (unless (file-exists-p c-file)
      (if (y-or-n-p (format "Файл %s не существует. Создать?" c-file))
	  (let ((content (format "#include \"%s\"\n" (file-name-nondirectory current-file))))
            (write-region content nil c-file)
	    (setq file-created? t))
        (error "Файл .c не найден")))
    
    ;; Переход в .c файл
    (find-file c-file)

    ;; Поиск уже существующей реализации
    ;; Если файл был создан с нуля то просто добавляем объявление
    ;; иначе пытаемся найти определение
    (unless file-created?
      (goto-char (point-min))
      (when (search-forward (du/remove-last-char line-text) nil t)
	(error "Реализация уже существует в строке %d" (line-number-at-pos))))

    ;; Переходим в конец файла
    (goto-char (point-max))
    (newline)
    (insert (du/remote-last-char line-text) " {\n/* TODO */\n}\n")
    (message "Реализация функции '%s' добавлена!" (du/remote-last-char line-text))))

(provide 'du-c)
