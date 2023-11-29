;; Increase the GC threshold for faster startup
;; The default is 800 kilobytes.  Measured in bytes.
(setq gc-cons-threshold (* 50 1000 1000))


(load-theme 'modus-vivendi t)

;; Packages
(setq-default package-enable-at-startup nil)
(package-initialize)

;; Initial frame size
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)	   
;; (setq initial-frame-alist
      ;; '((top . 1) (right . 1) (width . 80) (height . 60)))
;; (set-face-attribute 'default nil :height 130)

;; Always start maximized
(add-to-list 'default-frame-alist '(fullscreen . maximized))
