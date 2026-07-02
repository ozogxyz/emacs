;; Disable GC during startup for speed, then restore a sane value so we
;; don't get long freezes / memory bloat during the session.
(setq gc-cons-threshold most-positive-fixnum)
(add-hook 'after-init-hook
          (lambda () (setq gc-cons-threshold (* 64 1024 1024))))
(setq read-process-output-max (* 1024 1024))

;; Shape the first GUI frame up front (font, no bars) so it doesn't resize later.
(push '(font . "Consolas-15")        default-frame-alist)
(push '(menu-bar-lines . 0)          default-frame-alist)
(push '(tool-bar-lines . 0)          default-frame-alist)
(push '(vertical-scroll-bars)        default-frame-alist)
(setq frame-inhibit-implied-resize t)
(setq inhibit-x-resources t)
(setq inhibit-startup-screen t)
