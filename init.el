;; ----- Package setup -----
(require 'package)
(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
        ("gnu" . "https://elpa.gnu.org/packages/")))
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)
(setq use-package-compute-statistics t)

;; ----- Windows Git fix -----
(add-to-list 'exec-path "D:/mingit/cmd")
(setenv "PATH" (concat "D:/mingit/cmd;" (getenv "PATH")))

;; ----- Defaults -----
(setq default-directory "C:/Users/motorbreath/"
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
(fido-mode 1)
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
  :init
  (global-company-mode 1)
  :config
  (setq company-tooltip-align-annotations t
        company-minimum-prefix-length 1
        company-idle-delay 0.2))

(use-package magit
  :defer t)

(use-package which-key
  :defer t)

;; ----- Keybindings -----
(global-set-key (kbd "C-x C-;") 'comment-or-uncomment-region)
(global-set-key (kbd "M-[") 'next-buffer)
(global-set-key (kbd "M-]") 'previous-buffer)
(global-set-key (kbd "C-'") 'duplicate-line)
(global-set-key (kbd "C-c w") 'whitespace-mode)
(global-set-key (kbd "C-x g") 'magit-status)
(put 'upcase-region 'disabled nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(menu-bar-mode nil)
 '(package-selected-packages nil)
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Consolas" :foundry "outline" :slant normal :weight regular :height 108 :width normal)))))
