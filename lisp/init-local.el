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
;; Use customized variable
;; (setq org-agenda-files '(org-directory))
;; customize-group org-export
;; (setq org-export-backends '(ascii beamer html icalendar latex odt))
;; customize-variable org-modules
;; (setq org-modules '(org-bbdb org-bibtex org-docview org-gnus org-habit org-id org-info org-irc org-mhe org-rmail org-w3m org-checklist))

(setq org-startup-indented t)
(setq org-clock-history-length 25)

(setq org-default-notes-file (concat org-directory "/notes.org"))
(setq org-capture-book-file (concat org-directory "/GTD/learning.org"))
(setq org-capture-interview-file (concat org-directory "/GTD/work.org"))
(setq org-capture-issue-file (concat org-directory "/notes.org"))
(setq org-capture-journal-file (concat org-directory "/journal/" (format-time-string "%Y") ".org"))
(setq org-capture-work-journal-file (concat org-directory "/journal/w" (format-time-string "%Y") ".org"))

(setq org-id-link-to-org-use-id 'create-if-interactive-and-no-custom-id)
(setq org-id-locations-file "~/Dropbox/org/org-id-locations")

(setq org-tag-alist '((:startgroup . nil)
                      ("@office" . ?w)
                      ("@home" . ?h)
                      ("@gym" . ?t)
                      ("@outside" . ?o)
                      (:endgroup . nil)
                      ("personal" . ?P)
                      ("laptop" . ?l)
                      ("desktop" . ?d)
                      ("phone" . ?p)
                      ("family" . ?f)
                      ("shopping" . ?s)
                      ("meeting" . ?m)
                      ("call" . ?c)
                      ("errand" . ?e)
                      ("urgent" . ?u)))

(setq org-capture-templates
      `(("t" "todo" entry (file+headline "" "Tasks")  ; "" => org-default-notes-file
         "* TODO %?\n:LOGBOOK:\n- Added on %U\n:END:\n%i\n%a\n" :clock-resume t)
        ("r" "respond" entry (file+headline "" "Mails")
         "* NEXT Respond to %^{From} on %^{Subject}\nSCHEDULED: %t\n:LOGBOOK:\n- Added on %U\n:END:\n%a\n" :clock-in t :clock-resume t)
        ("m" "meeting" entry (file+headline "" "Meetings")
         "* MEETING %? :meeting:\n%U" :clock-in t :clock-keep t)
        ("p" "phone call" entry (file+headline "" "Phone Calls")
         "* PHONE with %? :phone:\n%U" :clock-in t :clock-resume t)
        ("n" "note" entry (file+headline "" "Notes")
         "* %? :NOTE:\n%i\n%a\n" :clock-resume t)
        ("s" "subtask" entry (clock)
         "* TODO %?\n:LOGBOOK:\n- Added on %U\n:END:\n%i\n%a\n" :clock-resume t)
        ("b" "Book" entry (file+headline org-capture-book-file "Books")
         "* TODO %^{Author} - %^{Title}\n:PROPERTIES:\n:PAGES: %^{Pages}\n:GENRE: %^{Genre}\n:END:\n:LOGBOOK:\n- Added: %U\n:END:\n-Recommended by %^{Recommended by}\n%i\n" :clock-resume t)
        ("I" "Interview" entry (file+headline org-capture-interview-file "Interviews")
         "* TODO %?\n:LOGBOOK:\n- Added on %U\n:END:\n:INFO:\n:Location: %^{Location}\n:Interviewer: %^{Interviewer}\n:Interviewee: %^{Interviewee}\n:Position: %^{Position}\n:END:\n%i\n%a\n" :clock-resume t)
        ("i" "Issue" entry (file+headline org-capture-issue-file "Issues")
         "* TODO %^{ISSUE_ID}: %?\n:PROPERTIES:\n:CUSTOM_ID: %\\1\n:URL: %^{URL}/%\\1\n:END:\n:LOGBOOK:\n- Added on %U\n:END:\n%i\n" :clock-resume t)
        ("j" "Journal" entry (file+datetree+prompt org-capture-journal-file)
         "* %? [%^{duration|0} MIN]\n:LOGBOOK:\n- Added on [%<%Y-%m-%d %H:%M %a>]\n:END:\n%i\n%a\n" :clock-resume t)
        ("w" "Work Journal" entry (file+datetree org-capture-work-journal-file)
         "* %? [%^{duration|0} MIN]\n:LOGBOOK:\n- Added on [%<%Y-%m-%d %H:%M %a>]\n:END:\n%i\n%a\n" :clock-in t :clock-resume t)
        ))

(add-to-list 'auto-mode-alist '("\\.page\\'" . org-mode))

(diminish 'abbrev-mode)

(provide 'init-local)
