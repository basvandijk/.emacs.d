;; Don't show splashscreen
(setq inhibit-startup-message t)

;; Have no initial text in scratch buffer
(setq initial-scratch-message nil)

;; Set default directory to $HOME.
;; (setq default-directory "~/")

;; When in X:
(when window-system

  ;; Highlight current line:
  (global-hl-line-mode)

  ;; Show line numbers:
  (require 'linum)
  (global-linum-mode))

;; Turnoff menubar when in terminal
;;(when (not (window-system))
  (menu-bar-mode -1)
;;)

;; Use Chrome as web-browser:
(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "google-chrome")

;; TODO: Move to: ~/.Xresources:
(set-default-font "DejaVu Sans Mono-10")

(prefer-coding-system 'utf-8)

(setq tab-width 4)
(setq sgml-basic-offset 4)

;; Everybody should have this:
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Disable the toolbar since I never use it:
(tool-bar-mode -1)

;; I dislike the default progressive mouse speed:
(setq mouse-wheel-progressive-speed nil)

;; Syntax highlighting:
(global-font-lock-mode 1)

;; Show matching parens:
(show-paren-mode t)

;; Save all files with a final newline:
(setq require-final-newline t)

;; If file changes on disk, also change the buffer:
(global-auto-revert-mode 1)

;; Turn on line/column number modes:
(column-number-mode t)

;; Zet mark highlighting aan (markering annuleren = ^G):
(transient-mark-mode t)

;; Scroll 1 line at a time:
(setq scroll-step 1)

;; make all "yes or no" prompts show "y or n" instead:
(fset 'yes-or-no-p 'y-or-n-p)
