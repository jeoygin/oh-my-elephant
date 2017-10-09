(require-package 'unfill)

(when (fboundp 'electric-pair-mode)
  (electric-pair-mode))
(when (eval-when-compile (version< "24.4" emacs-version))
  (electric-indent-mode 1))

(maybe-require-package 'list-unicode-display)

;;----------------------------------------------------------------------------
;; Some basic preferences
;;----------------------------------------------------------------------------
(setq-default
 blink-cursor-interval 0.4
 bookmark-default-file (expand-file-name ".bookmarks.el" user-emacs-directory)
 buffers-menu-max-size 30
 case-fold-search t
 column-number-mode t
 delete-selection-mode t
 ediff-split-window-function 'split-window-horizontally
 ediff-window-setup-function 'ediff-setup-windows-plain
 indent-tabs-mode nil
 make-backup-files nil
 mouse-yank-at-point t
 save-interprogram-paste-before-kill t
 scroll-preserve-screen-position 'always
 set-mark-command-repeat-pop t
 tooltip-delay 1.5
 truncate-lines nil
 truncate-partial-width-windows nil)

(global-auto-revert-mode)
(setq global-auto-revert-non-file-buffers t
      auto-revert-verbose nil)

(transient-mark-mode t)


 ;;; A simple visible bell which works in all terminal types

(defun sanityinc/flash-mode-line ()
  (invert-face 'mode-line)
  (run-with-timer 0.05 nil 'invert-face 'mode-line))

(setq-default
 ring-bell-function 'sanityinc/flash-mode-line)



(when (maybe-require-package 'beacon)
  (setq-default beacon-lighter "")
  (beacon-mode))



;;; Newline behaviour

(global-set-key (kbd "RET") 'newline-and-indent)
(defun sanityinc/newline-at-end-of-line ()
  "Move to end of line, enter a newline, and reindent."
  (interactive)
  (move-end-of-line 1)
  (newline-and-indent))

(global-set-key (kbd "S-<return>") 'sanityinc/newline-at-end-of-line)



(after-load 'subword
  (diminish 'subword-mode))



(unless (fboundp 'display-line-numbers-mode)
  (require-package 'nlinum))


(when (require-package 'rainbow-delimiters)
  (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))



(when (fboundp 'global-prettify-symbols-mode)
  (global-prettify-symbols-mode))


(require-package 'undo-tree)
(global-undo-tree-mode)
(diminish 'undo-tree-mode)


(when (maybe-require-package 'symbol-overlay)
  (dolist (hook '(prog-mode-hook html-mode-hook css-mode-hook))
    (add-hook hook 'symbol-overlay-mode))
  (after-load 'symbol-overlay
    (diminish 'symbol-overlay-mode)
    (define-key symbol-overlay-mode-map (kbd "M-n") 'symbol-overlay-jump-next)
    (define-key symbol-overlay-mode-map (kbd "M-p") 'symbol-overlay-jump-prev)))

;;----------------------------------------------------------------------------
;; Zap *up* to char is a handy pair for zap-to-char
;;----------------------------------------------------------------------------
(autoload 'zap-up-to-char "misc" "Kill up to, but not including ARGth occurrence of CHAR.")
(global-set-key (kbd "M-Z") 'zap-up-to-char)



(require-package 'browse-kill-ring)
(setq browse-kill-ring-separator "\f")
(global-set-key (kbd "M-Y") 'browse-kill-ring)
(after-load 'browse-kill-ring
  (define-key browse-kill-ring-mode-map (kbd "C-g") 'browse-kill-ring-quit)
  (define-key browse-kill-ring-mode-map (kbd "M-n") 'browse-kill-ring-forward)
  (define-key browse-kill-ring-mode-map (kbd "M-p") 'browse-kill-ring-previous))
(after-load 'page-break-lines
  (push 'browse-kill-ring-mode page-break-lines-modes))


;;----------------------------------------------------------------------------
;; Don't disable narrowing commands
;;----------------------------------------------------------------------------
(put 'narrow-to-region 'disabled nil)
(put 'narrow-to-page 'disabled nil)
(put 'narrow-to-defun 'disabled nil)

;;----------------------------------------------------------------------------
;; Show matching parens
;;----------------------------------------------------------------------------
(show-paren-mode 1)

;;----------------------------------------------------------------------------
;; Expand region
;;----------------------------------------------------------------------------
(require-package 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)


;;----------------------------------------------------------------------------
;; Don't disable case-change functions
;;----------------------------------------------------------------------------
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)


;;----------------------------------------------------------------------------
;; Rectangle selections, and overwrite text when the selection is active
;;----------------------------------------------------------------------------
(cua-selection-mode t)                  ; for rectangles, CUA is nice


;;----------------------------------------------------------------------------
;; Handy key bindings
;;----------------------------------------------------------------------------
(global-set-key (kbd "C-.") 'set-mark-command)
(global-set-key (kbd "C-x C-.") 'pop-global-mark)

(when (maybe-require-package 'avy)
  (global-set-key (kbd "C-c cp") 'avy-copy-line)
  (global-set-key (kbd "C-c jc") 'avy-goto-char)
  (global-set-key (kbd "C-c jw") 'avy-goto-word-or-subword-1)
  (global-set-key (kbd "C-c J") 'avy-goto-word-or-subword-1)
  (global-set-key (kbd "C-c jl") 'avy-goto-line)
  (global-set-key (kbd "C-;") 'avy-goto-char-timer))

(when (maybe-require-package 'multiple-cursors)
  ;; multiple-cursors
  (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
  (global-set-key (kbd "C-c m p") 'mc/mark-previous-like-this)
  (global-set-key (kbd "C->") 'mc/mark-next-like-this)
  (global-set-key (kbd "C-c m n") 'mc/mark-next-like-this)
  (global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
  (global-set-key (kbd "C-c m h") 'mc/mark-all-like-this)
  ;; From active region to multiple cursors:
  (global-set-key (kbd "C-c m r") 'set-rectangular-region-anchor)
  (global-set-key (kbd "C-c m c") 'mc/edit-lines)
  (global-set-key (kbd "C-c C-e") 'mc/edit-lines)
  (global-set-key (kbd "C-c m e") 'mc/edit-ends-of-lines)
  (global-set-key (kbd "C-c m a") 'mc/edit-beginnings-of-lines))

;; Train myself to use M-f and M-b instead
(global-unset-key [M-left])
(global-unset-key [M-right])



(defun kill-back-to-indentation ()
  "Kill from point back to the first non-whitespace character on the line."
  (interactive)
  (let ((prev-pos (point)))
    (back-to-indentation)
    (kill-region (point) prev-pos)))

(global-set-key (kbd "C-M-<backspace>") 'kill-back-to-indentation)


;;----------------------------------------------------------------------------
;; Page break lines
;;----------------------------------------------------------------------------
(require-package 'page-break-lines)
(global-page-break-lines-mode)
(diminish 'page-break-lines-mode)

;;----------------------------------------------------------------------------
;; Shift lines up and down with M-up and M-down. When paredit is enabled,
;; it will use those keybindings. For this reason, you might prefer to
;; use M-S-up and M-S-down, which will work even in lisp modes.
;;----------------------------------------------------------------------------
(require-package 'move-dup)
(global-set-key [M-up] 'md/move-lines-up)
(global-set-key [M-down] 'md/move-lines-down)
(global-set-key [M-S-up] 'md/move-lines-up)
(global-set-key [M-S-down] 'md/move-lines-down)

(global-set-key (kbd "C-c m d") 'md/duplicate-down)
(global-set-key (kbd "C-c m u") 'md/duplicate-up)

;;----------------------------------------------------------------------------
;; Fix backward-up-list to understand quotes, see http://bit.ly/h7mdIL
;;----------------------------------------------------------------------------
(defun backward-up-sexp (arg)
  "Jump up to the start of the ARG'th enclosing sexp."
  (interactive "p")
  (let ((ppss (syntax-ppss)))
    (cond ((elt ppss 3)
           (goto-char (elt ppss 8))
           (backward-up-sexp (1- arg)))
          ((backward-up-list arg)))))

(global-set-key [remap backward-up-list] 'backward-up-sexp) ; C-M-u, C-M-up


;;----------------------------------------------------------------------------
;; Cut/copy the current line if no region is active
;;----------------------------------------------------------------------------
(require-package 'whole-line-or-region)
(whole-line-or-region-mode t)
(diminish 'whole-line-or-region-mode)
(make-variable-buffer-local 'whole-line-or-region-mode)

(defun suspend-mode-during-cua-rect-selection (mode-name)
  "Add an advice to suspend `MODE-NAME' while selecting a CUA rectangle."
  (let ((flagvar (intern (format "%s-was-active-before-cua-rectangle" mode-name)))
        (advice-name (intern (format "suspend-%s" mode-name))))
    (eval-after-load 'cua-rect
      `(progn
         (defvar ,flagvar nil)
         (make-variable-buffer-local ',flagvar)
         (defadvice cua--activate-rectangle (after ,advice-name activate)
           (setq ,flagvar (and (boundp ',mode-name) ,mode-name))
           (when ,flagvar
             (,mode-name 0)))
         (defadvice cua--deactivate-rectangle (after ,advice-name activate)
           (when ,flagvar
             (,mode-name 1)))))))

(suspend-mode-during-cua-rect-selection 'whole-line-or-region-mode)




(defun sanityinc/open-line-with-reindent (n)
  "A version of `open-line' which reindents the start and end positions.
If there is a fill prefix and/or a `left-margin', insert them
on the new line if the line would have been blank.
With arg N, insert N newlines."
  (interactive "*p")
  (let* ((do-fill-prefix (and fill-prefix (bolp)))
         (do-left-margin (and (bolp) (> (current-left-margin) 0)))
         (loc (point-marker))
         ;; Don't expand an abbrev before point.
         (abbrev-mode nil))
    (delete-horizontal-space t)
    (newline n)
    (indent-according-to-mode)
    (when (eolp)
      (delete-horizontal-space t))
    (goto-char loc)
    (while (> n 0)
      (cond ((bolp)
             (if do-left-margin (indent-to (current-left-margin)))
             (if do-fill-prefix (insert-and-inherit fill-prefix))))
      (forward-line 1)
      (setq n (1- n)))
    (goto-char loc)
    (end-of-line)
    (indent-according-to-mode)))

(defun nuxell/smart-open-line (n)
  "Insert N empty lines after the current line.
 Position the cursor at its beginning, according to the current mode."
  (interactive "p")
  (move-end-of-line nil)
  (newline n))

(defun nuxell/smart-open-line-above (n)
  "Insert N empty lines above the current line.
 Position the cursor at it's beginning, according to the current mode."
  (interactive "p")
  (move-beginning-of-line nil)
  (newline n)
  (if n
    (forward-line -n)
    (forward-line 1))
  (indent-according-to-mode))

(defun nuxell/insert-line-above (n)
  "Insert N newline(s) above the line containing the cursor."
  (interactive "p")
  (save-excursion
    (move-beginning-of-line 1)
    (newline n)))

(defun nuxell/insert-line (n)
  "Insert N newline(s) after the line containing the cursor."
  (interactive "p")
  (save-excursion
    (move-end-of-line 1)
    (newline n)))

(global-set-key (kbd "M-RET") 'sanityinc/open-line-with-reindent)
(global-set-key (kbd "M-j") 'nuxell/smart-open-line)
(global-set-key (kbd "M-o") 'nuxell/smart-open-line-above)
(global-set-key (kbd "C-M-o") 'nuxell/insert-line-above)
(global-set-key (kbd "C-M-j") 'nuxell/insert-line)

;;----------------------------------------------------------------------------
;; Random line sorting
;;----------------------------------------------------------------------------
(defun sort-lines-random (beg end)
  "Sort lines in region randomly."
  (interactive "r")
  (save-excursion
    (save-restriction
      (narrow-to-region beg end)
      (goto-char (point-min))
      (let ;; To make `end-of-line' and etc. to ignore fields.
          ((inhibit-field-text-motion t))
        (sort-subr nil 'forward-line 'end-of-line nil nil
                   (lambda (s1 s2) (eq (random 2) 0)))))))




(require-package 'highlight-escape-sequences)
(hes-mode)


(require-package 'which-key)
(which-key-setup-side-window-bottom)
(setq which-key-special-keys nil
      which-key-use-C-h-for-paging t
      which-key-prevent-C-h-from-cycling t
      which-key-echo-keystrokes 0.02
      which-key-max-description-length 32
      which-key-sort-order 'which-key-key-order-alpha
      which-key-allow-evil-operators t)
(which-key-mode 1)
(diminish 'which-key-mode)

(when (maybe-require-package 'zop-to-char)
  (global-set-key [remap zap-to-char] 'zop-to-char)  
  (global-set-key [remap zap-up-to-char] 'zop-up-to-char))

(provide 'init-editing-utils)
