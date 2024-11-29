;;; du-pkg.el -- Packages file for dumacs
(require 'package)
(setf package-archives
      '(("melpa-stable" . "https://stable.melpa.org/packages/")
	("melpa" . "https://melpa.org/packages/")
        ("elpa" . "https://elpa.gnu.org/packages/")
        ("nongnu" . "https://elpa.nongnu.org/nongnu/")))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents t)
  (package-install 'use-package))

(eval-and-compile
  (require 'use-package))

(eval-and-compile
  (setq use-package-always-ensure t
        use-package-expand-minimally t))

(use-package company
  :hook (prog-mode text-mode)
  :config (setq company-idle-delay 0))

(use-package vertico
  :config (vertico-mode))


