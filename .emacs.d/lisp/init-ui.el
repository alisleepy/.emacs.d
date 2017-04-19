(tool-bar-mode -1)
(scroll-bar-mode -1)

(setq inhibit-splash-screen t)

(setq-default cursor-type 'bar)

(setq  initial-frame-alist (quote ((fullscreen . maximized))))

(global-hl-line-mode t)

;;个人信息
(setq user-full-name "wkk")
(setq user-mail-address "wkkvow@hotmail.com")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-quick-help-delay 0.08)
 '(company-idle-delay 0.08)
 '(company-minimum-prefix-length 1)
 '(custom-safe-themes
   (quote
    ("a800120841da457aa2f86b98fb9fd8df8ba682cebde033d7dbf8077c1b7d677a" default)))
 '(package-selected-packages (quote (monokai-theme company)))
 '(show-paren-mode t))

;; 指针颜色设置为白色
(set-cursor-color "red")
;; 鼠标颜色设置为白色
(set-mouse-color "red")

;;目录树
(add-to-list 'load-path "/some/path/neotree")
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)
;;目录树下的图标
(require 'all-the-icons)

(show-paren-mode t)
(setq show-paren-style 'parentheses)
;; 显示时间，格式如下
(display-time-mode 1)
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)
(transient-mark-mode t) 

(set-default-font "-outline-Consolas-normal-r-normal-normal-16-120-96-96-c-*-iso8859-1")

;; 语法高亮
(global-font-lock-mode t)

;; 默认显示 80列就换行 
(setq default-fill-column 80)

;; 设置英文
(set-face-attribute
'default nil :font "Consolas 12")

;; 中文字体
(dolist (charset '(kana han symbol cjk-misc bopomofo))
(set-fontset-font (frame-parameter nil 'font)
charset
(font-spec :family "新宋体" :size 12)))

;;取消自动备份	
(setq make-backup-files nil)

;; 显示列号
(setq column-number-mode t)
(setq line-number-mode t)

;; 回车缩进
(global-set-key "\C-m" 'newline-and-indent)
(global-set-key (kbd "C-<return>") 'newline)

;; 支持emacs和外部程序的粘贴
(setq x-select-enable-clipboard t)

;;把窗口进行编号，用M-0到9切换
(require 'window-numbering)
(window-numbering-mode 1)

;;切换透明度 F11
;;set transparent effect
 (global-set-key [(f11)] 'loop-alpha)
 (setq alpha-list '((100 100) (95 65) (85 55) (75 45) (65 35)))
 (defun loop-alpha ()
(interactive)
 (let ((h (car alpha-list)))                ;; head value will set to
 ((lambda (a ab)
(set-frame-parameter (selected-frame) 'alpha (list a ab))
 (add-to-list 'default-frame-alist (cons 'alpha (list a ab)))
)
(car h) (car (cdr h)))
(setq alpha-list (cdr (append alpha-list (list h))))
)
)

;;f3 撤销
(global-set-key [f3] 'undo)

;;f7 查看日历
(global-set-key [f7] 'calendar)

;;鼠标滚动
(defun up-slightly () (interactive) (scroll-up 3))
(defun down-slightly () (interactive) (scroll-down 3))

;;设置默认字符编码
(set-language-environment 'Chinese-GB)
(set-keyboard-coding-system 'utf-8)
(set-clipboard-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-selection-coding-system 'utf-8)
(modify-coding-system-alist 'process "*" 'utf-8)
(setq default-process-coding-system '(utf-8 . utf-8))
(setq-default pathname-coding-system 'utf-8)
(set-file-name-coding-system 'utf-8)
(setq ansi-color-for-comint-mode t)
;;处理shell-mode乱码,好像没作用

;;设置默认读入文件编码
(prefer-coding-system 'utf-8)
;;设置文件写入编码
(setq default-buffer-file-coding-system 'utf-8)

;;tabbar
(setq tabbar-ruler-global-tabbar t)    ; get tabbar
;;(setq tabbar-ruler-global-ruler t)     ; get global ruler
;;(setq tabbar-ruler-popup-menu t)       ; get popup menu.
;;(setq tabbar-ruler-popup-toolbar t)    ; get popup toolbar
;;(setq tabbar-ruler-popup-scrollbar t)  ; show scroll-bar on mouse-move
(require 'tabbar-ruler)
(global-set-key (kbd "C-c t") 'tabbar-ruler-move)

(provide 'init-ui)
