(setq ycmd-server-command '("python" "/Users/jeoygin/projects/ycmd/ycmd/"))

(setq tramp-ssh-controlmaster-options
    "-o ControlMaster=auto -o ControlPath='tramp.%%C' -o ControlPersist=no")

(setq ad-redefinition-action 'accept)

(diminish 'abbrev-mode)

(provide 'init-local)
