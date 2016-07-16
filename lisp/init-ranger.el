(when (maybe-require-package 'ranger)
  (after-load 'ranger
    (setq ranger-preview-file t)))

(provide 'init-ranger)
