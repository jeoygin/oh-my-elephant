(require-package 'evil)

(after-load 'evil
  (setq evil-default-state 'insert)
  (add-to-list 'evil-emacs-state-modes 'dired-mode)
  (evil-mode 1)
  (define-key evil-insert-state-map "\C-a" 'beginning-of-line)
  (define-key evil-insert-state-map "\C-e" 'end-of-line)
  (define-key evil-insert-state-map "\C-n" 'next-line)
  (define-key evil-insert-state-map "\C-p" 'previous-line)
  (define-key evil-insert-state-map "\C-v" 'scroll-up-command)
  (define-key evil-insert-state-map "\M-v" 'scroll-down-command)
  (define-key evil-insert-state-map "\C-d" 'delete-forward-char)
  (define-key evil-insert-state-map "\C-t" 'transpose-chars)
  (define-key evil-insert-state-map "\M-d" 'kill-word)
  (define-key evil-insert-state-map "\C-k" 'kill-line)
  (define-key evil-insert-state-map "\C-w" 'kill-region)
  (define-key evil-insert-state-map "\C-y" 'yank))

(after-load 'evil
  (nvmap :prefix "<SPC>"
         "<SPC>" 'switch-to-previous-buffer
         "0" 'select-window-0
         "1" 'select-window-1
         "2" 'select-window-2
         "3" 'select-window-3
         "4" 'select-window-4
         "5" 'select-window-5
         "6" 'select-window-6
         "7" 'select-window-7
         "8" 'select-window-8
         "9" 'select-window-9

         "yy" 'copy-to-x-clipboard
         "P" 'paste-from-x-clipboard
         "D" 'duplicate-current-line
         "Y" 'avy-copy-line

         "/c" 'company-complete
         "/h" 'hippie-expand

         "fb" 'browse-current-file
         "fc" 'copy-file
         "ff" 'counsel-find-file
         "fF" 'helm-find-files
         "fj" 'dired-jump
         "fo" 'open-current-file
         "fr" 'ivy-recentf
         "fR" 'rename-this-file-and-buffer
         "fs" 'save-buffer

         "gi" 'magit-init
         "gl" 'magit-log
         "gs" 'magit-status

         "hs" 'helm-ag
         "ho" 'helm-swoop

         "is" 'counsel-ag

         "jc" 'avy-goto-char
         "jw" 'avy-goto-word-or-subword-1
         "J" 'avy-goto-word-or-subword-1

         "me" 'mc/edit-lines

         "pb" 'counsel-projectile-switch-to-buffer
         "pd" 'counsel-projectile-find-dir
         "pf" 'counsel-projectile-find-file
         "pp" 'projectile-switch-project
         "pq" 'projectile-switch-open-project
         "ps" 'projectile-ag

         "sh" 'helm-ag
         "sH" 'highlight-symbol
         "si" 'counsel-ag
         "sp" 'projectile-ag
         "ss" 'swiper-region-or-symbol
         "sS" 'helm-swoop))

(require 'evil)

(provide 'init-evil)
