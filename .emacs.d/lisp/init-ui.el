(tool-bar-mode -1)
(scroll-bar-mode -1)

(setq inhibit-splash-screen t)

(setq-default cursor-type 'bar)

(setq  initial-frame-alist (quote ((fullscreen . maximized))))

(global-hl-line-mode t)

;;������Ϣ
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

;; ָ����ɫ����Ϊ��ɫ
(set-cursor-color "red")
;; �����ɫ����Ϊ��ɫ
(set-mouse-color "red")

;;Ŀ¼��
(add-to-list 'load-path "/some/path/neotree")
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)
;;Ŀ¼���µ�ͼ��
(require 'all-the-icons)

(show-paren-mode t)
(setq show-paren-style 'parentheses)
;; ��ʾʱ�䣬��ʽ����
(display-time-mode 1)
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)
(transient-mark-mode t) 

(set-default-font "-outline-Consolas-normal-r-normal-normal-16-120-96-96-c-*-iso8859-1")

;; �﷨����
(global-font-lock-mode t)

;; Ĭ����ʾ 80�оͻ��� 
(setq default-fill-column 80)

;; ����Ӣ��
(set-face-attribute
'default nil :font "Consolas 12")

;; ��������
(dolist (charset '(kana han symbol cjk-misc bopomofo))
(set-fontset-font (frame-parameter nil 'font)
charset
(font-spec :family "������" :size 12)))

;;ȡ���Զ�����	
(setq make-backup-files nil)

;; ��ʾ�к�
(setq column-number-mode t)
(setq line-number-mode t)

;; �س�����
(global-set-key "\C-m" 'newline-and-indent)
(global-set-key (kbd "C-<return>") 'newline)

;; ֧��emacs���ⲿ�����ճ��
(setq x-select-enable-clipboard t)

;;�Ѵ��ڽ��б�ţ���M-0��9�л�
(require 'window-numbering)
(window-numbering-mode 1)

;;�л�͸���� F11
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

;;f3 ����
(global-set-key [f3] 'undo)

;;f7 �鿴����
(global-set-key [f7] 'calendar)

;;������
(defun up-slightly () (interactive) (scroll-up 3))
(defun down-slightly () (interactive) (scroll-down 3))

;;����Ĭ���ַ�����
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
;;����shell-mode����,����û����

;;����Ĭ�϶����ļ�����
(prefer-coding-system 'utf-8)
;;�����ļ�д�����
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
