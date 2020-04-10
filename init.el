(require 'package)

(load-theme 'tsdh-dark t)

(setq package-enable-at-startup nil)

(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)

(add-to-list 'load-path "~/.emacs.d/site-lisp/use-package")
(package-initialize)
(require 'use-package)

(with-eval-after-load 'info
  (info-initialize)
  (add-to-list 'Info-directory-list
               "~/.emacs.d/site-lisp/use-package/"))

(use-package slime
    :ensure t
    :config
    (setq inferior-lisp-program "/usr/bin/sbcl")
    (setq slime-contribs '(slime-fancy slime-asdf)))


(defconst lisp-family-mode-hooks
  '(emacs-lisp-mode-hook
    eval-expression-minibuffer-setup-hook
    ielm-mode-hook
    lisp-mode-hook
    lisp-interaction-mode-hook
    scheme-mode-hook
    clojure-mode-hook))

(use-package paredit
  :ensure t
  :config
  (autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
  (dolist (hook lisp-family-mode-hooks)
    (add-hook hook #'enable-paredit-mode)))

(use-package rainbow-delimiters
  :ensure t
  :config
  (dolist (hook lisp-family-mode-hooks)
    (add-hook hook #'rainbow-delimiters-mode)))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("7111eb5bf050352a88a5bc6d8165cf5f18aa159a38c27e22d46d3bc39528255e" default)))
 '(package-selected-packages (quote (rainbow-delimiters paredit slime))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
