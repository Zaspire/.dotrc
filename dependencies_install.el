(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(require 'el-get)
(el-get-install 'color-theme)
(el-get-install 'rainbow-delimiters)
(el-get-install 'yasnippet)
(el-get-install 'editorconfig)
(el-get-install 'highlight-symbol)
(el-get-install 'cmake-mode)
(el-get-install 'anything)
(el-get-install 'go-mode)
(el-get-install 'yaml-mode)
(el-get-install 'company-mode)
(el-get-install 'dash)
(el-get-install 'emacs-ycmd)
(el-get-install 'highlight-symbol)
(el-get-install 'multiple-cursors)
(el-get-install 'color-identifiers-mode)
(el-get-install 'switch-window)
(el-get-install 'bash-completion)
(el-get-install 'uuid)
(el-get-install 'google-translate)
(el-get-install 'google-this)
(el-get-install 'goto-last-change)

(el-get-install 's)
(el-get-install 'f)

;; melpa
(package-install 'cyberpunk-theme)

(kill-emacs)

