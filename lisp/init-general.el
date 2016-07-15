(when (maybe-require-package 'general)
  (require 'general)
  (general-evil-setup t))

(provide 'init-general)
