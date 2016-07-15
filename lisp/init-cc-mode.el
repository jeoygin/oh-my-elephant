(nutxell/init-features '(helm company flycheck gtags ycmd))

(require-package 'company-c-headers)

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

(add-hook 'c-mode-common-hook 'c-mode-common-hook-setup)

(provide 'init-cc-mode)
