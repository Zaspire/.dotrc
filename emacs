(package-initialize)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(setq stack-trace-on-error t)

(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
(setq exec-path (append exec-path '("/usr/local/bin")))

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(require 'el-get)
(el-get 'sync)

;; with emacs 25.2 gpg does not ask for password without it
(setf epa-pinentry-mode 'loopback)

;; Disable overwrite mode.
(global-unset-key (kbd "<insert>"))

(require 'color-theme)
(color-theme-initialize)
(if (display-graphic-p)
    (load-theme 'cyberpunk t)
    (load-theme 'cyberpunk t))
(set-frame-font "Monospace 12")

(require 'yasnippet)
(yas-global-mode 1)

(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

(setq-default show-trailing-whitespace t)
(global-hl-line-mode 1)

;remove scroll glitches
(setq redisplay-dont-pause t
      scroll-conservatively most-positive-fixnum
      scroll-step 0)
(cua-selection-mode t)
(setq x-select-enable-clipboard t)
(set-scroll-bar-mode 'right)
(setq make-backup-files nil)
(setq backup-inhibited t)
(setq auto-save-default nil)
(setq indent-tabs-mode nil)
(tool-bar-mode 0)
(column-number-mode 1)
(mouse-avoidance-mode 'animate)
(setq-default truncate-lines t)
;disable help screen
(setq inhibit-splash-screen t)
;maximize frame
(set-frame-parameter nil 'fullscreen 'fullboth)
(fset 'yes-or-no-p 'y-or-n-p)

(setq-default tab-width 4)

;; Python Hook
(add-hook 'python-mode-hook '(lambda ()
			       (setq python-indent 2)))
;; env for run-python
(setq python-shell-interpreter (expand-file-name "~/.emacs.d/VE3/bin/python3"))

(require 'highlight-symbol)
(global-set-key [(control h)] 'highlight-symbol)

(require 'uniquify)
(setq
  uniquify-buffer-name-style 'post-forward
  uniquify-separator ":")

(add-hook 'after-init-hook 'global-company-mode)
(require 'company)
(setq company-backends (delete 'company-clang company-backends))


(set-variable 'bazel-format-command (expand-file-name "~/work/goroot/bin/buildifier"))
(require 'bazel-mode)
(add-to-list 'auto-mode-alist '("BUILD\\'" . bazel-mode))
(add-hook 'bazel-mode-hook (lambda () (add-hook 'before-save-hook #'bazel-format nil t)))

(setq ycmd--log-enabled t)
(setq-default ycmd-global-config (expand-file-name "~/.dotrc/global_conf.py"))
(set-variable 'ycmd-server-command (list (expand-file-name "~/.emacs.d/VE3/bin/python3") (expand-file-name "~/.dotrc/ycmd/ycmd/__main__.py")))
(require 'ycmd)
(add-hook 'after-init-hook #'global-ycmd-mode)
(require 'company-ycmd)
(company-ycmd-setup)
(setq ycmd-force-semantic-completion t)

(load "editorconfig")
(editorconfig-mode 1)


(global-set-key (kbd "C-x ?") 'company-complete)
(global-set-key (kbd "C-x .") 'ycmd-goto-declaration)

(add-hook 'c-mode-common-hook
  (lambda()
    (local-set-key  (kbd "C-c o") 'ff-find-other-file)))

(require 'cmake-mode)
(setq auto-mode-alist
      (append '(("CMakeLists\\.txt\\'" . cmake-mode)
		("\\.cmake\\'" . cmake-mode))
	      auto-mode-alist))

(global-set-key [(control f2)] 'highlight-symbol-at-point)
(global-set-key [kp-subtract] 'undo)
(global-set-key (kbd "C-z") 'anything)
(global-set-key (kbd "C-x C-z") 'anything)

(require 'uuid)
(setq server-name (uuid-string))
(setenv "MYEMACSSERVERNAME" server-name)
(server-start)

(require 'bash-completion)
(bash-completion-setup)

; jump between (){}
(global-set-key "%" 'match-paren)
(defun match-paren (arg)
  (interactive "p")
  (message "%s" last-command)
  (if (memq last-command '(self-insert-command))
      (self-insert-command (or arg 1))
    (cond ((looking-at "\(") (forward-list 1) (backward-char 1))
	  ((looking-at "\{") (forward-list 1) (backward-char 1))
	  ((looking-at "\}") (forward-char 1) (backward-list 1))
	  ((looking-at "\)") (forward-char 1) (backward-list 1))
	  (t (self-insert-command (or arg 1))))))

(require 'multiple-cursors)
(global-set-key (kbd "M-S-<mouse-1>") 'mc/add-cursor-on-click)

(require 'color-identifiers-mode)
(add-hook 'after-init-hook 'global-color-identifiers-mode)

(setq untabify-modes '(js-mode html-mode mhtml-mode ts-mode))
(defun untabify-hook ()
  (when (member major-mode untabify-modes)
    (untabify (point-min) (point-max))))
(add-hook 'before-save-hook 'untabify-hook)

(require 'switch-window)
(global-set-key (kbd "C-`") 'switch-window)

(setq-default explicit-shell-file-name "/bin/bash")
(defun ushell ()
  (interactive)
  (call-interactively 'shell)
  (rename-buffer (generate-new-buffer-name "*sh*")))
(ushell)
(delete-other-windows)

(require 'google-this)  ;; C-c / g
(google-this-mode 1)
(require 'google-translate-default-ui)
(global-set-key "\C-ct" 'google-translate-at-point)
(setq google-translate-default-source-language "en")
(setq google-translate-default-target-language "ru")

(require 'goto-last-change)
(global-set-key "\C-x\C-\\" 'goto-last-change)

(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)
