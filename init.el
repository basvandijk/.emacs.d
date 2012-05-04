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

;;; This was installed by package-install.el.
;;; This provides support for the package system and
;;; interfacing with ELPA, the package archive.
;;; Move this code earlier if you want to reference
;;; packages in your .emacs.
(when
    (load
     (expand-file-name "~/.emacs.d/elpa/package.el"))
  (package-initialize))
