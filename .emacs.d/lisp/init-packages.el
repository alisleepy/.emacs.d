(require 'cl)

;;加载github上的插件
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list
   'package-archives
   '("melpa" . "http://melpa.org/packages/")
   t))
(require 'cl)
;;在这添加自己所需要的插件
;; alect-themes
;; zenburn-theme
(defvar wkk/packages '(
				 company
				 monokai-theme
				 hungry-delete
				 swiper
				 counsel
				 smartparens
				 js2-mode
				 nodejs-repl
				 exec-path-from-shell
				 popwin
			         auto-complete
			         company-php
			         helm-themes
			         ample-theme
			         neotree
			         all-the-icons
			         php-mode
				 flymake-easy
			         flymake-php
			         web-mode
			         window-numbering
			         dumb-jump
			         tabbar-ruler
			         ggtags
		       ) "Default packages")

(setq package-selected-packages wkk/packages)

(defun wkk/packages-installed-p ()
  (loop for pkg in wkk/packages
	when (not (package-installed-p pkg)) do (return nil)
	finally (return t)
	)
  )
(unless (wkk/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg wkk/packages)
  (when (not (package-installed-p pkg))
    (package-install pkg)
    )))

;; let emacs could find the execuable
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))


(global-hungry-delete-mode)

;;(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
(smartparens-global-mode t)

(ivy-mode 1)
(setq ivy-use-virtual-buffers t)


;; config js2-mode for js files
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       auto-mode-alist))

(global-company-mode t)


(load-theme 'monokai t)

(require 'popwin)    ;;when require, wh(setq company-minimum-prefix-length 1)en not require
(popwin-mode t)

(provide 'init-packages)