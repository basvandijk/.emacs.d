;;; Loads .el files in given dir, except files starting with
;;; underscore, '_'.
(defun load-els (dir)
  (dolist (path (directory-files dir t "^[^_].*\.el$"))
    (progn
      (load path)
      (message "Loaded: %s" path))))

;;; Set dir with config files and load them.
(setq config-directory "~/.emacs.d/config")
(load-els config-directory)
