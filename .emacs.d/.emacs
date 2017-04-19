;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

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
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;定义函数打开配置文件
(defun open-my-init-file()
  (interactive)
  (find-file "C:/Users/Administrator/.emacs"))
(global-set-key (kbd "<f2>") 'open-my-init-file)

;;设置光标
(setq-default cursor-type 'bar)

;;鼠标选中复制
(delete-selection-mode t)

;;yes和no用y，n表示
(fset 'yes-or-no-p 'y-or-n-p)
 
;;启用保存最近的文件
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;;启动时全屏显示
(setq initial-frame-alist (quote ((fullscreen . maximazed))))

;;显示当前行号
(global-hl-line-mode t)

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
		       auto-complete
		       company-php
		       monokai-theme
		       helm-themes
		       ample-theme
		       hungry-delete
		       swiper
		       counsel
		       smartparens
		       neotree
		       all-the-icons
		       php-mode
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

;;全局buffer中补全
;; (global-company-mode t)
(add-hook 'after-init-hook 'global-company-mode)

(ac-config-default)

;;加载主题包
(load-theme 'monokai t)

;;主题包 （三种颜色）
;;(load-theme 'ample t)
;;(load-theme 'ample-flat t)
;;(load-theme 'ample-light t)

;;zenburn 主题包
;; (defvar zenburn-override-colors-alist
;;   '(("zenburn-bg+05" . "#282828")
;;     ("zenburn-bg+1"  . "#2F2F2F")
;;     ("zenburn-bg+2"  . "#3F3F3F")
;;     ("zenburn-bg+3"  . "#4F4F4F")))
;; (load-theme 'zenburn t)

;;alect 主题包
;; (load-theme 'alect-light t)

;;几个快捷键
(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)

;;删除多余的空格
(require 'hungry-delete)
;;(global-hungry-delete-mode)
(global-hungry-delete-mode t)

;;swiper的配置
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(global-set-key "\C-s" 'swiper)
;; (global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<C-h> f") 'counsel-describe-function)
(global-set-key (kbd "<C-h> v") 'counsel-describe-variable)

;;括号匹配
(require 'smartparens-config)
;;(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)   ;;这句是只在emacs-lisp的模式下才括号匹配
(smartparens-global-mode t)  ;;在所有的buffer中全部括号匹配

;;目录树
(add-to-list 'load-path "/some/path/neotree")
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

;;目录树下的图标
(require 'all-the-icons)

;;php开发模式
(eval-after-load 'php-mode  '(require 'php-ext))
(add-hook 'php-mode-hook 'php-enable-default-coding-style)
(add-hook 'php-mode-hook (lambda () (subword-mode 1)))

;;php语法检测
(require 'flymake-php)
(add-hook 'php-mode-hook 'flymake-php-load)

;;跳转
(setq dumb-jump-default-project "~/code");; to change default project if one is not found (defaults to ~)
(setq dumb-jump-quiet t) ;;if Dumb Jump is too chatty.
;;To support more languages and/or definition types use add-to-list on dumb-jump-find-rules (see source code).
(add-hook 'dumb-jump-after-jump-hook 'some-function) ;;to execute code after you jump
(setq dumb-jump-selector 'ivy) ;;to use ivy instead of the default popup for multiple options.

;;全局搜索
(add-hook 'c-mode-common-hook
          (lambda ()
            (when (derived-mode-p 'php-mode)
              (ggtags-mode 1))))

;; ;;
  ;; (add-hook 'php-mode-hook
  ;;           '(lambda ()
  ;;              (auto-complete-mode t)
  ;;              (require 'ac-php)
  ;;              (setq ac-sources  '(ac-source-php ) )
  ;;              (yas-global-mode 1)
  ;;              (define-key php-mode-map  (kbd "C-]") 'ac-php-find-symbol-at-point)   ;goto define
  ;;              (define-key php-mode-map  (kbd "C-t") 'ac-php-location-stack-back   ) ;go back
  ;;              ))

;; (add-hook 'php-mode-hook
;;           '(lambda ()
;;              (require 'company-php)
;;              (company-mode t)
;;              (add-to-list 'company-backends 'company-ac-php-backend )))
 
 ;;php代码高亮
(load "php-mode")
(add-to-list 'auto-mode-alist '("\\.php\\'" . php-mode))
(add-to-list 'auto-mode-alist '("\\.phps\\'" . php-mode))

;;运行php
(define-key php-mode-map
[menu-bar php php-run]
'("Run PHP" . php-run))
(defun php-run ()
(interactive)
(message buffer-file-name)
(shell-command
(concat "D:/php/bin/php/php5.5.12/php.exe -f \""
(buffer-file-name)
"\"")))
;;这里是绑定函数到快捷键C+c r
(defun my-php-mode()
  (define-key php-mode-map [(control c) (r)] 'php-run)
					;(define-key php-mode-map [(control c) (d)] 'php-debug)
  (hs-minor-mode t)
  (linum-mode t)
)
(add-hook 'php-mode-hook 'my-php-mode)


(show-paren-mode t)
(setq show-paren-style 'parentheses)
;; 显示时间，格式如下
(display-time-mode 1)
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)
(transient-mark-mode t) 

(set-default-font "-outline-Consolas-normal-r-normal-normal-16-120-96-96-c-*-iso8859-1")

;; 设置英文
(set-face-attribute
'default nil :font "Consolas 12")

;; 中文字体
(dolist (charset '(kana han symbol cjk-misc bopomofo))
(set-fontset-font (frame-parameter nil 'font)
charset
(font-spec :family "新宋体" :size 12)))

;; 指针颜色设置为白色
(set-cursor-color "red")
;; 鼠标颜色设置为白色
(set-mouse-color "red")

;; 语法高亮
(global-font-lock-mode t)

;; 默认显示 80列就换行 
(setq default-fill-column 80)

;; 去掉工具栏
(tool-bar-mode -1)

;;去掉菜单栏
;;(menu-bar-mode -1)

;; 去掉滚动栏
(scroll-bar-mode -1)

;;显示行号
(global-linum-mode t)

;; 一打开就起用 text 模式。 
(setq default-major-mode 'text-mode)

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

;;允许emacs和外部其他程序的粘贴
(setq x-select-enable-clipboard t)

;;增大使用查找函数和变量的寻找范围
(setq apropos-do-all t)
;;是用aspell程序作为Emacs的拼写检查成学 
(setq-default ispell-program-name "aspell")

;;在文档最后自动插入空白一行，好像某些系统配置文件是需要这样的
(setq require-final-newline t)
(setq track-eol t)

;;去掉Emacs和gnus启动时的引导界面
(setq inhibit-startup-message t)
(setq gnus-inhibit-startup-message t)

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

;;与html相关的web-mode插件
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
;;(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

;;删除整行 M-w
 (defadvice kill-ring-save (before slickcopy activate compile)  
 (interactive  
(if mark-active (list (region-beginning) (region-end))  
(list (line-beginning-position)  
(line-beginning-position 2)))))  
(defadvice kill-region (before slickcut activate compile)  
(interactive  
(if mark-active (list (region-beginning)
		      (region-end))
  (list (line-beginning-position)
 (line-beginning-position 2))))) 


;;优化注释代码功能 M-:在行尾时对行尾进行注释，在行的其他位置注释该行，选中区域则注释该区域
(defun qiang-comment-dwim-line (&optional arg)
(interactive "*P")
(comment-normalize-vars)
(if (and (not (region-active-p)) (not (looking-at "[ \t]*$")))
(comment-or-uncomment-region (line-beginning-position) (line-end-position))
 (comment-dwim arg)))
(global-set-key "\M-;" 'qiang-comment-dwim-line)

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

(put 'scroll-left 'disabled nil) ;;允许屏幕左移
(put 'scroll-right 'disabled nil) ;;允许屏幕右移
(global-set-key (kbd "C-,") 'scroll-left);; "C-,"左移快键键
(global-set-key (kbd "C-.") 'scroll-right);; "C-." 屏幕右移快键键

;;代码折叠
(load-library "hideshow")
;; (add-hook 'java-mode-hook 'hs-minor-mode)
;; (add-hook 'perl-mode-hook 'hs-minor-mode)
(add-hook 'php-mode-hook 'hs-minor-mode)
(add-hook 'emacs-lisp-mode-hook 'hs-minor-mode)

;;鼠标滚动改为3行
;; (defun up-slightly () (interactive) (scroll-up 3))
;; (defun down-slightly () (interactive) (scroll-down 3))
;; (setq scroll-margin 3 scroll-conservatively 10000)
;; (global-set-key [mouse-4] 'down-slightly)
;; (global-set-key [mouse-5] 'up-slightly)
(defun up-slightly () (interactive) (scroll-up 3))
(defun down-slightly () (interactive) (scroll-down 3))
(global-set-key [mouse-4] 'down-slightly)
(global-set-key [mouse-5] 'up-slightly)

;;可直接打开和显示图片
(setq auto-image-file-mode t)

;;个人信息
(setq user-full-name "wkk")
(setq user-mail-address "wkkvow@hotmail.com")

;;f3 撤销
(global-set-key [f3] 'undo)

;;f7 查看日历
(global-set-key [f7] 'calendar)


;;tabbar
(setq tabbar-ruler-global-tabbar t)    ; get tabbar
;;(setq tabbar-ruler-global-ruler t)     ; get global ruler
;;(setq tabbar-ruler-popup-menu t)       ; get popup menu.
;;(setq tabbar-ruler-popup-toolbar t)    ; get popup toolbar
;;(setq tabbar-ruler-popup-scrollbar t)  ; show scroll-bar on mouse-move
(require 'tabbar-ruler)
(global-set-key (kbd "C-c t") 'tabbar-ruler-move)
