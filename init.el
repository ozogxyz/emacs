;; Custom file
(setq custom-file (concat user-emacs-directory "custom.el"))
(load custom-file 'noerror 'nomessage)

;; Load theme only in graphics mode
;; (add-to-list 'custom-theme-load-path
;;   (concat user-emacs-directory "themes"))
;; ;; (when (display-graphic-p)
;;   (load-theme 'gruber-darker))
;; (set-face-foreground 'default "#FFFFFF")

;; Bell
(setq ring-bell-function 'ignore)

;; Clipboard
(setq select-enable-clipboard t)
(setq select-enable-primary t)

;; Some defaults
(fset 'yes-or-no-p 'y-or-n-p)
(ido-mode t)
(setq default-directory "D:/PROG")
(setq create-lockfiles nil
      inhibit-startup-message t
      inhibit-startup-screen t
      make-backup-files nil
      auto-save-default nil)

;; Only load Magit manually
(autoload 'magit-status "magit" nil t)

;; Only load which-key manually
(autoload 'which-key-mode "which-key" nil t)

;; Load multiple-cursors automatically
(use-package multiple-cursors
  :ensure t
  :bind (("C->" . mc/mark-next-like-this)
         ("C-<" . mc/mark-previous-like-this)
         ("C-c C-<" . mc/mark-all-like-this)))

;; Some key bindigs
(global-set-key (kbd "M-[") (quote next-buffer))
(global-set-key (kbd "M-]") (quote previous-buffer))
(global-set-key (kbd "C-,") (quote duplicate-line))
(put 'upcase-region 'disabled nil)
(global-set-key (kbd "C-c w") 'whitespace-mode)
(global-set-key (kbd "C-x g") 'magit-status)
