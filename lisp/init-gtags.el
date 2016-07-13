(after-load 'helm
  (when (maybe-require-package 'helm-gtags)
    (after-load 'helm-gtags
      (define-key helm-gtags-mode-map (kbd "C-j") 'helm-gtags-select)
      (define-key helm-gtags-mode-map (kbd "M-.") 'helm-gtags-dwim)
      (define-key helm-gtags-mode-map (kbd "M-,") 'helm-gtags-pop-stack)
      (define-key helm-gtags-mode-map (kbd "C-c <") 'helm-gtags-previous-history)
      (define-key helm-gtags-mode-map (kbd "C-c >") 'helm-gtags-next-history)

      (define-key helm-gtags-mode-map (kbd "C-c g a") 'helm-gtags-tags-in-this-function)
      (define-key helm-gtags-mode-map (kbd "C-c g s") 'helm-gtags-find-symbol)
      (define-key helm-gtags-mode-map (kbd "C-c g r") 'helm-gtags-find-rtag)
      (define-key helm-gtags-mode-map (kbd "C-c g f") 'helm-gtags-find-files)
      (define-key helm-gtags-mode-map (kbd "C-c g h") 'helm-gtags-show-stack))))

(when (maybe-require-package 'ggtags)
  (after-load 'company
    (add-hook 'helm-gtags-mode-hook
              (lambda () (sanityinc/local-push-company-backend 'company-gtags)))))

(provide 'init-gtags)
