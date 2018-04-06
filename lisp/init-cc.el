(init-features '(helm company flycheck gtags ycmd))

(require-package 'company-c-headers)

(when (maybe-require-package 'cc-mode)
  (add-to-list 'auto-mode-alist `("\\.h$" . c++-mode)))

(defun my-common-cc-mode-setup ()
  (setq c-basic-offset 4)
  (sanityinc/local-push-company-backend '(company-c-headers
                                          company-dabbrev-code
                                          company-keywords
                                          company-gtags
                                          company-files
                                          company-dabbrev)))

(defun c-mode-common-hook-setup ()
  (my-common-cc-mode-setup)
  (company-mode t)
  (flycheck-mode t)
  (helm-mode t)
  (helm-gtags-mode t)
  (ycmd-mode t))

;; Common hook across all languages. It's run immediately before the language specific hook.
(add-hook 'c-mode-common-hook
  (lambda ()
    (when (derived-mode-p 'c-mode 'c++-mode)
      (c-mode-common-hook-setup))))

(provide 'init-cc)
