(setq ycmd-server-command '("python" "/Users/jeoygin/projects/ycmd/ycmd/"))

(setq tramp-ssh-controlmaster-options
    "-o ControlMaster=auto -o ControlPath='tramp.%%C' -o ControlPersist=no")

(setq ad-redefinition-action 'accept)

(setq chinese-default-input-method 'pinyin)
(setq chinese-pinyin-load-greatdict t)

(setq org-directory "~/Projects/personal/notes/")
(setq org-default-notes-file (concat org-directory "/notes.org"))

(diminish 'abbrev-mode)

(provide 'init-local)
