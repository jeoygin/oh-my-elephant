(when (maybe-require-package 'flycheck)
  (add-hook 'after-init-hook 'global-flycheck-mode)

  (after-load 'flycheck
    (diminish 'flycheck-mode " ⓢ"))

  ;; Override default flycheck triggers
  (setq flycheck-check-syntax-automatically '(save idle-change mode-enabled)
        flycheck-idle-change-delay 3.0)

  (setq flycheck-display-errors-function #'flycheck-display-error-messages-unless-error-list))


(provide 'init-flycheck)
