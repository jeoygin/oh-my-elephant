(when (maybe-require-package 'youdao-dictionary)
  (setq youdao-dictionary-search-history-file (expand-file-name ".youdao" user-emacs-directory))
  (setq youdao-dictionary-use-chinese-word-segmentation t)
  (global-set-key (kbd "C-c d y") 'youdao-dictionary-search-at-point+)
  (after-load 'evil
    (nvmap :prefix "<SPC>"
           "dy" 'youdao-dictionary-search-at-point+)))

(when *is-a-mac*
  (when (maybe-require-package 'osx-dictionary)
    (setq osx-dictionary-use-chinese-text-segmentation t)
    (global-set-key (kbd "C-c d o") 'osx-dictionary-search-pointer)
    (after-load 'evil
      (nvmap :prefix "<SPC>"
             "do" 'osx-dictionary-search-pointer))))

(when (eq 'pinyin chinese-default-input-method)
  (when (maybe-require-package 'pyim)
    (require 'pyim)

    (when (maybe-require-package 'pyim-basedict)
      (pyim-basedict-enable))

    (when chinese-pinyin-load-greatdict
      (when (maybe-require-package 'pyim-greatdict)
        (pyim-greatdict-enable)))

    (setq default-input-method "pyim")))

(provide 'init-chinese)
