(setq ycmd-server-command '("python" "/Users/jeoygin/projects/git/ycm/ycmd/ycmd"))

(custom-set-variables
  '(eclim-eclipse-dirs '("/Applications/Eclipse.app/Contents/Eclipse"))
  '(eclim-executable "/Applications/Eclipse.app/Contents/Eclipse/eclim"))

(setq tramp-ssh-controlmaster-options
    "-o ControlMaster=auto -o ControlPath='tramp.%%C' -o ControlPersist=no")

(setq ad-redefinition-action 'accept)

(setq chinese-default-input-method 'pinyin)
(setq chinese-pinyin-load-greatdict t)

(setq org-directory "~/projects/personal/notes/")
(setq org-default-notes-file (concat org-directory "/notes.org"))
(setq org-capture-book-file (concat org-directory "/GTD/learning.org"))
(setq org-capture-interview-file (concat org-directory "/GTD/work.org"))
(setq org-capture-journal-file (concat org-directory "/journal/" (format-time-string "%Y") ".org"))
(setq org-capture-work-journal-file (concat org-directory "/journal/w" (format-time-string "%Y") ".org"))

(setq org-capture-templates
      `(("t" "todo" entry (file+headline "" "Tasks")  ; "" => org-default-notes-file
         "* TODO %?\n  :LOGBOOK:\n  - Added on %U\n  :END:\n  %i\n  %a\n" :clock-resume t)
        ("n" "note" entry (file+headline "" "Notes")
         "* %? :NOTE:\n  %i\n  %a\n" :clock-resume t)
        ("s" "subtask" entry (clock)
         "* TODO %?\n  :LOGBOOK:\n  - Added on %U\n  :END:\n  %i\n  %a\n" :clock-resume t)
        ("b" "Book" entry (file+headline org-capture-book-file "Books")
         "* TODO %^{Author} - %^{Title}\n  :PROPERTIES:\n  :PAGES: %^{Pages}\n  :GENRE: %^{Genre}\n  :END:\n  :LOGBOOK:\n  - Added: %U\n  :END:\n  -Recommended by %^{Recommended by}\n  %i\n" :clock-resume t)
        ("i" "Interview" entry (file+headline org-capture-interview-file "Interviews")
         "* TODO %?\n    :LOGBOOK:\n    - Added on %U\n    :END:\n    :INFO:\n    :Location: %^{Location}\n    :Interviewer: %^{Interviewer}\n    :Interviewee: %^{Interviewee}\n    :Position: %^{Position}\n    :END:\n  %i\n  %a\n" :clock-resume t)
        ("j" "Journal" entry (file+datetree+prompt org-capture-journal-file)
         "* %? [%^{duration|0} MIN]\n  :LOGBOOK:\n  - Added on [%<%Y-%m-%d %H:%M %a>]\n  :END:\n  %i\n  %a\n" :clock-resume t)
        ("w" "Work Journal" entry (file+datetree org-capture-work-journal-file)
         "* %? [%^{duration|0} MIN]\n  :LOGBOOK:\n  - Added on [%<%Y-%m-%d %H:%M %a>]\n  :END:\n  %i\n  %a\n" :clock-resume t)
        ))

(diminish 'abbrev-mode)

(provide 'init-local)
