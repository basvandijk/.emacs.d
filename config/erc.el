(require 'erc)

(setq erc-auto-query 'window)

(add-hook 'erc-after-connect
	  (lambda (server nick)
	    (add-hook 'erc-server-NOTICE-hook 'erc-auto-query)))

(setq erc-autojoin-channels-alist '(("freenode.net" "#haskell")))

(setq erc-pals '("roelvandijk"))

(setq erc-keywords '("\\busb\\b" "\\bregions\\b"))

(add-hook
  'erc-text-matched-hook
  (lambda (match-type nickuserhost message)
    (cond
     ((eq match-type 'current-nick)
      (start-process-shell-command "whatever" nil "mplayer /usr/share/sounds/ubuntu/stereo/message-new-instant.ogg"))
     ((eq match-type 'keyword)
      (start-process-shell-command "whatever" nil "mplayer /usr/share/sounds/ubuntu/stereo/message.ogg")))))

(setq erc-hide-list '("JOIN" "PART" "QUIT"))

(defun irc ()
  "Connect to IRC."
  (interactive)
  (erc :server   "irc.freenode.net"
       :port      6667
       :nick      "basvandijk"
       :password  "borntoglide"
       :full-name "Bas van Dijk"))
