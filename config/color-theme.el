;; (add-to-list 'load-path "~/.emacs.d/vendor/zenburn-emacs")
;; (require 'color-theme-zenburn)
;; (color-theme-zenburn)

(require 'color-theme)
(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)))
