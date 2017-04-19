(load "php-mode")
; 这两句是告诉emacs对于.php的文件自动加载php-mode
(add-to-list 'auto-mode-alist '("\\.php\\'" . php-mode))
(add-to-list 'auto-mode-alist '("\\.phps\\'" . php-mode))


(require 'flymake-php)
  (add-hook 'php-mode-hook 'flymake-php-load)


;;运行php
(define-key php-mode-map
[menu-bar php php-run]
'("Run PHP" . php-run))
(defun php-run ()
	(interactive)
	(message buffer-file-name)
	(shell-command
	(concat "D:/wamp/bin/php/php5.5.12/php.exe -f \""
	(buffer-file-name)
"\"")))
;;这里是绑定函数到快捷键C+c r
(defun my-php-mode()
  (define-key php-mode-map [(control c) (r)] 'php-run)
  (hs-minor-mode t)
  (setq c-basic-offset 4)
  (linum-mode t)
  (setq indent-tabs-mode nil)
  (setq php-template-compatibility nil)
  (subword-mode 1)
)
(add-hook 'php-mode-hook 'my-php-mode)


(provide 'init-php)