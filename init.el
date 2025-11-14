;; Load custom file
(setq custom-file (concat user-emacs-directory "custom.el"))
(load custom-file 'noerror 'nomessage)

;; ----- Package setup -----
(require 'package)
(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
        ("gnu" . "https://elpa.gnu.org/packages/")))
(package-initialize)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)

;; ----- Windows Git fix -----
(setenv "HOME" (getenv "USERPROFILE"))
(setenv "PATH" (concat "D:/MINGIT/cmd;" (getenv "PATH")))
(setq exec-path (cons "D:/MINGIT/cmd" exec-path))

;; ----- Theme -----
(add-to-list 'custom-theme-load-path
             (concat user-emacs-directory "themes"))
(when (display-graphic-p)
  (load-theme 'gruber-darker t))
(set-face-foreground 'default "#FFFFFF")

;; ----- Defaults -----
(setq default-directory "D:/PROG"
      create-lockfiles nil
      inhibit-startup-message t
      inhibit-startup-screen t
      make-backup-files nil
      auto-save-default nil
      show-paren-delay 0
      ring-bell-function 'ignore
      select-enable-clipboard t
      select-enable-primary t)
(fset 'yes-or-no-p 'y-or-n-p)
(ido-mode t)
(show-paren-mode 1)

;; ----- Packages -----
(use-package multiple-cursors
  :bind (("C-S-c C-S-c" . mc/edit-lines)
         ("C->"         . mc/mark-next-like-this)
         ("C-<"         . mc/mark-previous-like-this)
         ("C-c C-<"     . mc/mark-all-like-this)
         ("C-\""        . mc/skip-to-next-like-this)
         ("C-:"         . mc/skip-to-previous-like-this)))

(use-package company
  :ensure t
  :init
  (global-company-mode 1)
  :config
  (setq company-minimum-prefix-length 1
        company-tooltip-align-annotations t))

;; ----- Keybindings -----
(global-set-key (kbd "C-x C-;") 'comment-or-uncomment-region)
(global-set-key (kbd "M-[") 'next-buffer)
(global-set-key (kbd "M-]") 'previous-buffer)
(global-set-key (kbd "C-'") 'duplicate-line)
(global-set-key (kbd "C-c w") 'whitespace-mode)
(global-set-key (kbd "C-x g") 'magit-status)
(put 'upcase-region 'disabled nil)
