(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(require 'el-get)
(el-get-install 'irony-mode)
(el-get-install 'color-theme)
(el-get-install 'atom-dark-theme)
(el-get-install 'rainbow-delimiters)
(el-get-install 'yasnippet)
(el-get-install 'editorconfig)
(el-get-install 'highlight-symbol)
(el-get-install 'cmake-mode)
(el-get-install 'anything)
(el-get-install 'anything-exuberant-ctags)
(el-get-install 'company-irony)
(el-get-install 'go-mode)
(el-get-install 'yaml-mode)
(el-get-install 'jedi)
(el-get-install 'company-jedi)
(el-get-install 'highlight-symbol)
(kill-emacs)

