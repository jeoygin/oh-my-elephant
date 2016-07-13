(defun ycmd-setup-completion-at-point-function ()
  "Setup `completion-at-point-functions' for `ycmd-mode'."
  (add-hook 'completion-at-point-functions
            #'ycmd-complete-at-point nil :local))

(setq ycmd-config-path (expand-file-name "global_conf.py" (file-name-directory user-init-file)))
  (when (file-exists-p ycmd-config-path)
    (setq-default ycmd-global-config ycmd-config-path))

(when (maybe-require-package 'ycmd)
  (after-load 'ycmd
    (add-hook 'ycmd-mode-hook #'ycmd-setup-completion-at-point-function)))

(when (maybe-require-package 'company-ycmd)
  (after-load 'ycmd
    (after-load 'company
      (add-hook 'ycmd-mode-hook
                (lambda () (sanityinc/local-push-company-backend 'company-ycmd))))))

(when (maybe-require-package 'flycheck-ycmd)
  (after-load 'ycmd
    (after-load 'flycheck
      ;; Make sure the flycheck cache sees the parse results
      ;; (add-hook 'ycmd-file-parse-result-hook 'flycheck-ycmd--cache-parse-results)
      ;; Add the ycmd checker to the list of available checkers
      ;; (add-to-list 'flycheck-checkers 'ycmd)

      (add-hook 'python-mode-hook
                (lambda () (add-to-list 'flycheck-disabled-checkers 'ycmd))))))

(provide 'init-ycmd)
