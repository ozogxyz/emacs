;;; init.el --- Personal Emacs configuration (WSL2 / Debian)  -*- lexical-binding: t; -*-

;; ----- Package setup -----
(require 'package)
(add-to-list 'package-archives '("melpa"  . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("gnu"    . "https://elpa.gnu.org/packages/"))
;; Refresh the package list only on a fresh machine (no cached archives yet),
;; so normal startups never hit the network.
(unless (file-directory-p (expand-file-name "archives" package-user-dir))
  (package-refresh-contents))

;; use-package ships with Emacs 29+; just load it.
(require 'use-package)
(setq use-package-always-ensure t)   ; auto-install declared packages

(setq tramp-use-ssh-controlmaster-options nil)  ; reuse ~/.ssh/config ControlMaster socket
(setq tramp-verbose 1)                           ; quiet the "Opening connection..." narration

;; ----- Packages -----
(use-package multiple-cursors
  :commands (mc/edit-lines mc/mark-next-like-this mc/mark-previous-like-this
             mc/mark-all-like-this mc/skip-to-next-like-this mc/skip-to-previous-like-this)
  :bind (("C-S-c C-S-c" . mc/edit-lines)
         ("C->"         . mc/mark-next-like-this)
         ("C-<"         . mc/mark-previous-like-this)
         ("C-c C-<"     . mc/mark-all-like-this)
         ("C-\""        . mc/skip-to-next-like-this)
         ("C-:"         . mc/skip-to-previous-like-this)))

(use-package company
  :hook (after-init . global-company-mode)
  :config
  (setq company-tooltip-align-annotations t
        company-minimum-prefix-length 1
        company-idle-delay 0.2))

;; ----- Git -----
;; Magit with the author-recommended global keys (Magit manual, "Getting
;; Started"): C-x g for status, plus the two dispatch transients.
(use-package magit
  :bind (("C-x g"   . magit-status)
         ("C-x M-g" . magit-dispatch)
         ("C-c g"   . magit-file-dispatch)))

(use-package rust-mode
  :mode "\\.rs\\'")

;; ----- Simple C (Tsoding's simpc-mode) -----
;; Minimal C major mode (not on MELPA); simpc-mode.el lives in lisp/.
(use-package simpc-mode
  :ensure nil
  :load-path "lisp"
  :mode "\\.[hc]\\(pp\\)?\\'")

;; which-key ships with Emacs 30.
(which-key-mode 1)

;; ----- Keybindings -----
(global-set-key (kbd "C-x C-;") 'comment-or-uncomment-region)
;; (global-set-key (kbd "M-[") 'next-buffer)
;; (global-set-key (kbd "M-]") 'previous-buffer)
(global-set-key (kbd "C-'") 'duplicate-line)
(global-set-key (kbd "C-c w") 'whitespace-mode)

;; ----- Editing defaults -----
(setq inhibit-compacting-font-caches t)  ; avoid GC pauses with large fonts on Windows
(setq create-lockfiles nil)
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq show-paren-delay 0)
(setq ring-bell-function 'ignore)
(setq select-enable-clipboard t)
;; C-y pulls the tmux paste buffer in terminal frames; GUI keeps native clipboard.
(when (getenv "TMUX")
  (setq interprogram-paste-function
        (lambda ()
          (unless (display-graphic-p)
            (let ((s (shell-command-to-string "tmux show-buffer 2>/dev/null")))
              (unless (string-empty-p s) s))))))
(setq use-short-answers t)               ; y/n instead of yes/no (Emacs 28+)
(prefer-coding-system 'utf-8)

;; ----- Dired -----
(setq dired-dwim-target t)
(setq dired-recursive-copies 'top)
(setq dired-recursive-deletes 'top)
(setq ls-lisp-dirs-first t)
(setq ls-lisp-ignore-case t)

;; ----- Modes -----
(ido-mode 1)
(setq ido-auto-merge-work-directories-length -1)  ; no tramp hang from stale remote dirs
(show-paren-mode 1)
(setq show-paren-style 'parenthesis)
(xterm-mouse-mode 1)             ; emacs owns the mouse inside tmux (mouse on); stops copy-mode hijack

;; Remember minibuffer history, recent files, and cursor positions.
(savehist-mode 1)
(recentf-mode 1)
(setq recentf-max-saved-items 100)
(save-place-mode 1)

(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

;; ----- Customize (auto-managed; keep one instance) -----
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("94f0b3a895b463acd1b75b178bc047c3caadcf1b4408eea373221a99b2990893"
     "07ccd9353199ffb1d7922186f7b779fbb7e00e6ae50c5606997660f7590b63f7"
     "01a9797244146bbae39b18ef37e6f2ca5bebded90d9fe3a2f342a9e863aaa4fd"
     default))
 '(global-display-line-numbers-mode t)
 '(package-selected-packages
   '(company eglot-jl julia-mode julia-repl magit markdown-mode
	     multiple-cursors naysayer-theme rust-mode
	     vscode-dark-plus-theme zenburn-theme))
 '(scroll-bar-mode nil)
 '(size-indication-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Consolas" :height 158 :slant normal :weight regular :width normal)))))
