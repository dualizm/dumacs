;;;;|----------------------------------------------------|
;;;;| (bs)
;;;;|----------------------------------------------------|
(use-package bs
  :init
  (setq bs-configurations
        '(("files" "^\\*scratch\\*"
           nil nil
           bs-visits-non-file 
           bs-sort-buffer-interns-are-last))))
;;;;|----------------------------------------------------|
