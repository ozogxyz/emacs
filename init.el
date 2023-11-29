;; Garbage collection
(setq gc-cons-threshold 50000000)
(setq large-file-warning-threshold 100000000)

;; Move custom to its own file
;; (setq custom-file "~/.emacs.d/custom.el")
;; (load-file custom-file)

;; Theme
;; (load-theme 'ef-cherie)
;; (load-theme 'modus-vivendi t)

;; Starting directory
;; (setq default-directory "~/elixir")

;; GUI
;; (setq inhibit-startup-message t)
(setq pixel-scroll-precision-mode t)

;; Meta from Option to Cmd
;; (setq mac-option-modifier 'super)
;; (setq mac-command-modifier 'meta)

;; Text-mode
;; (setq-default major-mode 'text-mode)
;; (add-hook 'text-mode-hook 'auto-fill-mode)

;; Package management
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))


;; Vertico minibuffer
(use-package vertico)

;; ;; Erlang Mode
;; (setq load-path (cons "/opt/local/lib/erlang/lib/tools-3.6/emacs" load-path))
;; (setq erlang-root-dir "/opt/local/lib/erlang")
;; (setq exec-path (cons "/opt/local/erlang/bin" exec-path))
;; (require 'erlang-start)


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
;; (add-hook 'after-init-hook 'global-company-mode)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("917d7e7f0483dc90a5e2791db980ce9bc39e109a29198c6e9bdcd3d88a200c33" "ee77d69f78a1a17dcd141a58367fb5534dfdb07e94924a10a03c54190bb6a0ef" default))
 '(package-selected-packages
   '(helm yasnippet-snippets yasnippet company elixir-ts-mode magit vertico ef-themes)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
