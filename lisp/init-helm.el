(setq
 helm-scroll-amount 4 ; scroll 4 lines other window using M-<next>/M-<prior>
 helm-ff-search-library-in-sexp t ; search for library in `require' and `declare-function' sexp.
 helm-split-window-in-side-p t ;; open helm buffer inside current window, not occupy whole other window
 helm-candidate-number-limit 500 ; limit the number of displayed canidates
 helm-ff-file-name-history-use-recentf t
 helm-move-to-line-cycle-in-source t ; move to end or beginning of source when reaching top or bottom of source.
 helm-buffers-fuzzy-matching t          ; fuzzy matching buffer names when non-nil
                                        ; useful in helm-mini that lists buffers
 )

(setq
 helm-gtags-ignore-case t
 helm-gtags-auto-update t
 helm-gtags-use-input-at-cursor t
 helm-gtags-pulse-at-cursor t
 helm-gtags-prefix-key "\C-cg"
 helm-gtags-suggested-key-mapping t
 )

(when (maybe-require-package 'helm)
  (require 'helm-config)
  (after-load 'helm
    (global-set-key (kbd "M-y") 'helm-show-kill-ring)
    (global-set-key (kbd "C-c h") 'helm-command-prefix)))

(when (maybe-require-package 'helm-swoop)
  (after-load 'helm
    (global-set-key (kbd "C-c h o") 'helm-swoop)))

(when (maybe-require-package 'helm-ag)
  (after-load 'helm
    (global-set-key (kbd "C-c h g") 'helm-ag)))

(when (maybe-require-package 'helm-gtags)
  (after-load 'helm
    (global-set-key (kbd "C-c h g") 'helm-ag)))

(provide 'init-helm)
