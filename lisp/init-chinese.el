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
  (when (maybe-require-package 'chinese-pyim)
    (require 'chinese-pyim)

    (when (maybe-require-package 'chinese-pyim-basedict)
      (chinese-pyim-basedict-enable))

    (when chinese-pinyin-load-greatdict
      (when (maybe-require-package 'chinese-pyim-greatdict)
        (chinese-pyim-greatdict-enable)))

    (setq default-input-method "chinese-pyim")))

(provide 'init-chinese)
