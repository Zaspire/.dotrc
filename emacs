(setq stack-trace-on-error t)

(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
(setq exec-path (append exec-path '("/usr/local/bin")))

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(require 'el-get)
(el-get 'sync)

(load "~/Ubuntu One/emacs.el")

(require 'color-theme)
(color-theme-initialize)
(color-theme-dark-laptop)

(require 'yasnippet)
(yas-global-mode 1)

(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

(setq-default show-trailing-whitespace t)
(global-hl-line-mode 1)

(setq make-backup-files nil)
(setq backup-inhibited t)
(setq auto-save-default nil)
(setq indent-tabs-mode nil)
(tool-bar-mode 0)
(column-number-mode 1)
(mouse-avoidance-mode 'animate)
(setq-default truncate-lines t)

(add-hook 'c-mode-common-hook
  (lambda()
    (local-set-key  (kbd "C-c o") 'ff-find-other-file)))
