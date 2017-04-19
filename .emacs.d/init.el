;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/lisp/")

(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

;; add more personal func
;; new init-func.el 


(custom-set-variables
 '(ac-quick-help-delay 0.08)
 '(company-idle-delay 0.08)
 '(company-minimum-prefix-length 1)
 '(custom-safe-themes
   (quote
    ("a800120841da457aa2f86b98fb9fd8df8ba682cebde033d7dbf8077c1b7d677a" default)))
 '(package-selected-packages (quote (monokai-theme company)))
 '(show-paren-mode t))

;;全局buffer中补全
;; (global-company-mode t)
(add-hook 'after-init-hook 'global-company-mode)

(ac-config-default)

;; (require 'init-func.el)
(require 'init-packages)
(require 'init-ui)
(require 'init-better-defaults)
(require 'init-keybindings)
(require 'org)
(require 'init-php)        ;;自定义的关于php的配置
(require 'init-html)       ;;自定义的关于web/html的配置


(setq custom-file (expand-file-name "lisp/custom.el" user-emacs-directory))
(load-file custom-file)
















