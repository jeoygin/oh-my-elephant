(when (maybe-require-package 'keyfreq)
  (defun turnon-keyfreq-mode ()
    (interactive)
    (keyfreq-mode 1)
    (keyfreq-autosave-mode 1))

  (defun turnoff-keyfreq-mode ()
    (interactive)
    (keyfreq-mode -1)
    (keyfreq-autosave-mode -1))

  (require 'keyfreq)

  (unless (file-exists-p (file-truename keyfreq-file))
    (with-temp-buffer
      (insert "()")
      (write-file (file-truename keyfreq-file))))

  (turnon-keyfreq-mode))

(provide 'init-keyfreq)
