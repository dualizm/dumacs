;;; du-js.el --- javascript/node.js конфигурация

(setf projectile-project-compilation-cmd
      #'(lambda ()
          (cond
           ((file-exists-p "package.json") "npm run build")
           ((file-exists-p "yarn.lock") "yarn build"))))

(setf projectile-project-run-cmd
      #'(lambda ()
          (cond
           ((file-exists-p "package.json") "npm run dev")
           ((file-exists-p "yarn.lock") "yarn dev")
           ((file-exists-p "vite.config.js") "npm run dev"))))

(setf projectile-project-test-cmd
      #'(lambda ()
          (cond
           ((file-exists-p "package.json") "npm test")
           ((file-exists-p "yarn.lock") "yarn test"))))

;; Специфичные игнорируемые пути для JS
(setf projectile-globally-ignored-directories
      (append projectile-globally-ignored-directories
              '("node_modules" ".next" ".nuxt" ".cache" "dist" "build" ".output")))

(setf projectile-globally-ignored-files
      (append projectile-globally-ignored-files
              '("package-lock.json" "yarn.lock" "*.min.js" "*.bundle.js")))

;; Дополнительные настройки для JS режима
(setq js-indent-level 2)
(setq typescript-indent-level 2)

(provide 'du-js)
