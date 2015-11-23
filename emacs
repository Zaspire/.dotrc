(setq stack-trace-on-error t)

(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
(setq exec-path (append exec-path '("/usr/local/bin")))

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(require 'el-get)
(el-get 'sync)

(require 'color-theme)
(color-theme-initialize)
(if (display-graphic-p)
    (color-theme-dark-laptop))

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

(require 'highlight-symbol)
(global-set-key [(control h)] 'highlight-symbol)

(require 'uniquify)
(setq
  uniquify-buffer-name-style 'post-forward
  uniquify-separator ":")

(load "editorconfig")

(add-hook 'after-init-hook 'global-company-mode)
(require 'company)
(require 'company-irony)
(add-hook 'irony-mode-hook 'company-irony-setup-begin-commands)
(add-to-list 'company-backends 'company-irony)
(setq company-backends (delete 'company-clang company-backends))

(add-hook 'c-mode-common-hook
  (lambda()
    (local-set-key  (kbd "C-c o") 'ff-find-other-file)))
(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)
(defun my-irony-mode-hook ()
  (yas-minor-mode 1)
  (define-key irony-mode-map [remap completion-at-point]
    'irony-completion-at-point-async)
  (define-key irony-mode-map [remap complete-symbol]
    'irony-completion-at-point-async)
  (local-set-key (kbd "C-c ?") 'irony-completion-at-point-async))
(add-hook 'irony-mode-hook 'my-irony-mode-hook)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

(add-to-list 'load-path "~/work/goroot/src/github.com/nsf/gocode/emacs-company/")
(require 'company-go)
(defun my-go-mode-hook ()
  (set (make-local-variable 'company-backends) '(company-go))
  (local-set-key (kbd "C-.") 'godef-jump))
(add-hook 'go-mode-hook 'my-go-mode-hook)

(defun my-python-mode-hook ()
  (add-to-list 'company-backends 'company-jedi))
(add-hook 'python-mode-hook 'my-python-mode-hook)

(require 'cmake-mode)
(setq auto-mode-alist
      (append '(("CMakeLists\\.txt\\'" . cmake-mode)
		("\\.cmake\\'" . cmake-mode))
	      auto-mode-alist))

(global-set-key [(control f3)] 'highlight-symbol-at-point)
(global-set-key [kp-subtract] 'undo)
(require 'anything-exuberant-ctags)
(global-set-key (kbd "C-z") 'anything)
(global-set-key (kbd "C-x C-z") 'anything)

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
