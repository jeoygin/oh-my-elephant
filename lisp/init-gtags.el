(defun helm-gtags-dwim-other-window ()
  "helm-gtags-dwim in the other window"
  (interactive)
  (let ((helm-gtags--use-otherwin t)
        (split-height-threshold nil)
        (split-width-threshold 140))
    (helm-gtags-dwim)))

(after-load 'helm
  (when (maybe-require-package 'helm-gtags)
    (after-load 'helm-gtags
      (diminish 'helm-gtags-mode " HmG")
      (define-key helm-gtags-mode-map (kbd "C-j") 'helm-gtags-select)
      (define-key helm-gtags-mode-map (kbd "M-.") 'helm-gtags-dwim)
      (define-key helm-gtags-mode-map (kbd "C-x 4 .") 'helm-gtags-find-tag-other-windo)
      (define-key helm-gtags-mode-map (kbd "M-,") 'helm-gtags-pop-stack)
      (define-key helm-gtags-mode-map (kbd "M-*") 'helm-gtags-pop-stack)

      (define-key helm-gtags-mode-map (kbd "C-c g c") 'helm-gtags-create-tags)
      (define-key helm-gtags-mode-map (kbd "C-c g d") 'helm-gtags-find-tag)
      (define-key helm-gtags-mode-map (kbd "C-c g D") 'helm-gtags-find-tag-other-window)
      (define-key helm-gtags-mode-map (kbd "C-c g f") 'helm-gtags-select-path)
      (define-key helm-gtags-mode-map (kbd "C-c g g") 'helm-gtags-dwim)
      (define-key helm-gtags-mode-map (kbd "C-c g G") 'helm-gtags-dwim-other-window)
      (define-key helm-gtags-mode-map (kbd "C-c g i") 'helm-gtags-tags-in-this-function)
      (define-key helm-gtags-mode-map (kbd "C-c g r") 'helm-gtags-find-rtag)
      (define-key helm-gtags-mode-map (kbd "C-c g l") 'helm-gtags-parse-file)
      (define-key helm-gtags-mode-map (kbd "C-c g n") 'helm-gtags-next-history)
      (define-key helm-gtags-mode-map (kbd "C-c g p") 'helm-gtags-previous-history)
      (define-key helm-gtags-mode-map (kbd "C-c g r") 'helm-gtags-find-rtag)
      (define-key helm-gtags-mode-map (kbd "C-c g R") 'helm-gtags-resume)
      (define-key helm-gtags-mode-map (kbd "C-c g s") 'helm-gtags-select)
      (define-key helm-gtags-mode-map (kbd "C-c g S") 'helm-gtags-show-stack)
      (define-key helm-gtags-mode-map (kbd "C-c g u") 'helm-gtags-update-tags))))

(when (maybe-require-package 'ggtags)
  (after-load 'company
    (add-hook 'helm-gtags-mode-hook
              (lambda () (sanityinc/local-push-company-backend 'company-gtags)))))

(provide 'init-gtags)
