;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Handy key bindings

(global-set-key [f9] 'comment-region)
(global-set-key [f10] 'uncomment-region)
(global-set-key (kbd "C-x g f") 'grep-find)
(global-set-key (kbd "C-x a r") 'align-regexp)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Page down/up move the point, not the screen.
;; In practice, this means that they can move the
;; point to the beginning or end of the buffer.

(global-set-key [next]
		(lambda () (interactive)
		  (condition-case nil (scroll-up)
		    (end-of-buffer (goto-char (point-max))))))

(global-set-key [prior]
		(lambda () (interactive)
		  (condition-case nil (scroll-down)
		    (beginning-of-buffer (goto-char (point-min))))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Cool home key

(defun my-home-key ()
  (interactive)
  (let ((f (current-column)))
    (beginning-of-line)
    (skip-chars-forward " \t")
    (if (= (current-column) f)
	   (beginning-of-line))))

(global-set-key [home] 'my-home-key)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Nuke line

(defun nuke-line()
  "Kill an entire line, and delete the trailing newline character"
  (interactive)
  (defvar previous-column nil "Save the column position")
  (setq previous-column (current-column))
  (end-of-line)
  (kill-line 0)
  (delete-char 1)
  (move-to-column previous-column))

(global-set-key [f8] 'nuke-line)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun my-collapse-whitespace ()
  "Reduce all whitespace surrounding point to a single space."
  ;; @@ This seems to be quite buggy at the moment
  (interactive)
  (kill-region (progn (re-search-backward "[^ \t\r\n]")
                      (forward-char)
                      (point))
               (progn (re-search-forward "[^ \t\r\n]")
                      (backward-char)
                      (point)))
  (insert-char ?\  1))

(global-set-key "\C-cw" 'my-collapse-whitespace)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun my-join-line ()
  (interactive)
  (setq prev-column (current-column))
  (end-of-line)
  (kill-region (point)
               (progn (re-search-forward "[^ \t\r\n]")
                      (backward-char)
                      (point)))
  (move-to-column prev-column))

(global-set-key "\C-cj" 'my-join-line)
