(setq auto-mode-alist
      (append '(("SConstruct\\'" . python-mode)
                ("SConscript\\'" . python-mode))
              auto-mode-alist))

(require-package 'pip-requirements)

(when (maybe-require-package 'anaconda-mode)
  (after-load 'python
    (add-hook 'python-mode-hook 'anaconda-mode)
    (add-hook 'python-mode-hook 'anaconda-eldoc-mode))
  (when (maybe-require-package 'company-anaconda)
    (after-load 'company
      (add-hook 'python-mode-hook
                (lambda () (sanityinc/local-push-company-backend 'company-anaconda))))))

(defun my-python-mode-hook ()
  (after-load 'company
    (company-mode t))
  (after-load 'helm
    (helm-mode t))
  (after-load 'helm-gtags
    (helm-gtags-mode t))
  (after-load 'ycmd
    (ycmd-mode t)))

(add-hook 'python-mode-hook 'my-python-mode-hook)

(provide 'init-python)
