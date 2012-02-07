;; From: http://emacs-fu.blogspot.com/2008/12/quickly-switching-between-header-and.html

(add-hook 'c-mode-common-hook
  (lambda()
    (local-set-key  (kbd "C-c o") 'ff-find-other-file)))
