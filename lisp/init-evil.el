(require-package 'evil)

(after-load 'evil
  (setq evil-default-state 'normal)
  (evil-mode 1)
  (define-key evil-insert-state-map "\C-a" 'beginning-of-line)
  (define-key evil-insert-state-map "\C-e" 'end-of-line)
  (define-key evil-insert-state-map "\C-n" 'next-line)
  (define-key evil-insert-state-map "\C-p" 'previous-line)
  (define-key evil-insert-state-map "\C-v" 'scroll-up-command)
  (define-key evil-insert-state-map "\M-v" 'scroll-down-command)
  (define-key evil-insert-state-map "\C-d" 'delete-forward-char)
  (define-key evil-insert-state-map "\M-d" 'forward-kill-word)
  (define-key evil-insert-state-map "\C-k" 'kill-line)
  (define-key evil-insert-state-map "\C-w" 'kill-region)
  (define-key evil-insert-state-map "\C-y" 'yank)

  (nvmap
     :prefix "<SPC>"
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
     "me" 'mc/edit-lines))

(require 'evil)

(provide 'init-evil)
