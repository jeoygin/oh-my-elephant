(maybe-require-package 'elfeed)

(when (maybe-require-package 'elfeed-org)
  (after-load 'elfeed
    (elfeed-org)
    (setq rmh-elfeed-org-files (list "~/.emacs.d/elfeed.org"))))

(provide 'init-elfeed)
