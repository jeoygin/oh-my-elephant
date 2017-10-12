(when (maybe-require-package 'smart-mode-line)
  (require 'smart-mode-line)
  (setq sml/no-confirm-load-theme t)
  (setq sml/theme 'respectful)
  (setq sml/mode-width 0)
  (setq sml/name-width 20)
  (add-hook 'after-init-hook 'sml/setup))

(provide 'init-mode-line)
