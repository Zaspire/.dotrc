(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(require 'el-get)
(el-get-install 'irony-mode)
(el-get-install 'color-theme)
(el-get-install 'rainbow-delimiters)
(el-get-install 'yasnippet)
(el-get-install 'auto-complete)
(el-get-install 'ac-irony)
(el-get-install 'editorconfig)
(kill-emacs)

