(when (maybe-require-package 'ivy)
  (after-load 'ivy
    (setq-default ivy-use-virtual-buffers t
                  ivy-count-format ""
                  projectile-completion-system 'ivy
                  ivy-initial-inputs-alist
                  '((counsel-M-x . "^")
                    (man . "^")
                    (woman . "^")))
    ;; IDO-style directory navigation
    (define-key ivy-minibuffer-map (kbd "C-j") #'ivy-immediate-done)
    (define-key ivy-minibuffer-map (kbd "RET") #'ivy-alt-done)
    (define-key ivy-mode-map (kbd "C-c C-r") 'ivy-resume)
    (require-package 'ivy-hydra)
    (when (maybe-require-package 'diminish)
      (diminish 'ivy-mode)))

  (defun sanityinc/enable-ivy-flx-matching ()
    "Make `ivy' matching work more like IDO."
    (interactive)
    (require-package 'flx)
    (setq-default ivy-re-builders-alist
                  '((t . ivy--regex-fuzzy))))

  (add-hook 'after-init-hook
            (lambda ()
              (when (bound-and-true-p ido-ubiquitous-mode)
                (ido-ubiquitous-mode -1))
              (when (bound-and-true-p ido-mode)
                (ido-mode -1))
              (ivy-mode 1))))


(when (maybe-require-package 'ivy-historian)
  (add-hook 'after-init-hook (lambda () (ivy-historian-mode t))))


(when (maybe-require-package 'counsel)
  (setq-default counsel-mode-override-describe-bindings t)
  (when (maybe-require-package 'diminish)
    (after-load 'counsel
      (diminish 'counsel-mode)))
  (require-package 'counsel-projectile)
  (add-hook 'after-init-hook 'counsel-mode))

(defun swiper-region-or-symbol ()
  "Run `swiper' with the selected region or the symbol
around point as the initial input."
  (interactive)
  (let ((input (if (region-active-p)
                   (buffer-substring-no-properties
                     (region-beginning) (region-end))
                 (thing-at-point 'symbol t))))
    (swiper input)))

(when (maybe-require-package 'swiper)
  (after-load 'ivy
    (define-key ivy-mode-map (kbd "C-s") 'swiper-region-or-symbol)))

(provide 'init-ivy)
