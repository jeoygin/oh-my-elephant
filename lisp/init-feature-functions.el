(defmacro create-init-feature-defun (feature)
  (list 'defun (intern (concat "nuxell/init-" feature)) '()
    (list 'interactive)
    (list 'message (concat "Call nuxell/init-" feature))
    (list 'require (list 'quote (intern (concat "init-" feature))))))

(dolist (file (directory-files (file-name-directory load-file-name) nil "^init-.+\\.el$"))
  (let ((feature-name (replace-regexp-in-string "^init-\\(.+\\)\\.el$" "\\1" file)))
    (eval (macroexpand `(create-init-feature-defun ,feature-name)))))

(defun require-features (feature-list)
  (interactive)
  (when (listp features)
    (dolist (f (append feature-list '()))
      (require f))))

(defun init-features (feature-list)
  (interactive)
  (if (listp features)
    (dolist (f (append feature-list '()))
      (funcall (intern (concat "nuxell/init-" (symbol-name f)))))
    nil))

(provide 'init-feature-functions)
