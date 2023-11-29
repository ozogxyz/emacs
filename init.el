;; Garbage collection
;; (setq gc-cons-threshold 50000000)
;; (setq large-file-warning-threshold 100000000)

;; Move custom to its own file
(setq custom-file "~/.emacs.d/custom.el")
(load-file custom-file)

;; Theme
;; (load-theme 'ef-cherie)
;; (load-theme 'modus-vivendi t)

;; Font
;; (set-face-attribute 'default t :font "Menlo Normal 14")

;; Starting directory
;; (setq default-directory "~/elixir")

;; GUI
(setq inhibit-startup-message t)
(setq pixel-scroll-precision-mode t)

;; Meta from Option to Cmd
;; (setq mac-option-modifier 'super)
;; (setq mac-command-modifier 'meta)

;; Text-mode
(setq-default major-mode 'text-mode)
(add-hook 'text-mode-hook 'auto-fill-mode)

;; Package management
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))


;; Vertico minibuffer
(use-package vertico)


;; Git
(use-package magit
  :bind (("C-M-g" . magit-status)))

;; Misc
(fset 'yes-or-no-p 'y-or-n-p)
(global-auto-revert-mode t)
(global-set-key (kbd "C-x k") 'kill-this-buffer)


;; Shell
(defun shell-below ()
  (interactive)
  (split-window-below)
  (shell))
(global-set-key (kbd "s-<return>") 'shell-below)


;; Company
(add-hook 'after-init-hook 'global-company-mode)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes)
 '(package-selected-packages))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
