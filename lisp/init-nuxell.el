(defun nuxell/join (l separator)
  (apply 'concat
         (car l)
         (mapcar #'(lambda (str) (concat separator str))
                 (cdr l))))

(defun nuxell/camelcase-to-underscore (text)
  (toggle-case-fold-search)
  (setq result (replace-regexp-in-string "\\(.\\)\\([A-Z]\\)" "\\1_\\2" text))
  (toggle-case-fold-search)
  (eval result))

(defun nuxell/extract-file-name (file-name)
  (file-name-nondirectory (file-name-sans-extension file-name)))

(defun nuxell/extract-dir-components (file-name separator)
  (split-string (file-name-directory file-name) separator))

(defun nuxell/extract-dir-name-suffix (file-name n separator)
  (if (< n 2) "_"
    (nuxell/join
     (last (nuxell/extract-dir-components file-name "/") n)
     separator)))

(defun nuxell/replace-nonletter (replace str)
  (replace-regexp-in-string "[^0-9a-zA-Z]" replace str))

(defun nuxell/last-sub-dir-name (file-name n)
  (mapcar
   (lambda (x) (upcase (nuxell/replace-nonletter "_" (nuxell/extract-dir-name-suffix file-name x "_"))))
   (number-sequence 1 n)))

(provide 'init-nuxell)
