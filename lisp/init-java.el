(init-features '(helm company gtags))

(when (maybe-require-package 'eclim)
  (when (maybe-require-package 'company-emacs-eclim)
    (company-emacs-eclim-setup)
    (setq company-eamcs-eclim-ignore-case t))
  (after-load 'eclim
    (setq eclimd-autostart t)))

(defun my-java-mode-hook ()
  (helm-mode t)
  (helm-gtags-mode t)
  (after-load 'eclim
    (eclim-mode t))
  (after-load 'company
    (company-mode t)))

;; (add-hook 'java-mode-hook 'my-java-mode-hook)

(provide 'init-java)
