(require 'init-frame-hooks)

(defun fix-up-xterm-control-arrows ()
  (let ((map (if (boundp 'input-decode-map)
                 input-decode-map
               function-key-map)))
    (define-key map "\e[1;5A" [C-up])
    (define-key map "\e[1;5B" [C-down])
    (define-key map "\e[1;5C" [C-right])
    (define-key map "\e[1;5D" [C-left])
    (define-key map "\e[5A"   [C-up])
    (define-key map "\e[5B"   [C-down])
    (define-key map "\e[5C"   [C-right])
    (define-key map "\e[5D"   [C-left])
    (define-key map "\e[1;9A" [M-up])
    (define-key map "\e[1;9B" [M-down])
    (define-key map "\e[1;9C" [M-right])
    (define-key map "\e[1;9D" [M-left])
    (define-key map "\e[1;10A" [M-S-up])
    (define-key map "\e[1;10B" [M-S-down])
    (define-key map "\e[1;10C" [M-S-right])
    (define-key map "\e[1;10D" [M-S-left])))

(global-set-key [mouse-4] (lambda () (interactive) (scroll-down 1)))
(global-set-key [mouse-5] (lambda () (interactive) (scroll-up 1)))

(autoload 'mwheel-install "mwheel")

(defun sanityinc/console-frame-setup ()
  (when (< emacs-major-version 23)
    (fix-up-xterm-control-arrows))
  (unless window-system
    (fix-up-xterm-control-arrows))
  (xterm-mouse-mode 1) ; Mouse in a terminal (Use shift to paste with middle button)
  (mwheel-install))

(add-hook 'after-make-console-frame-hooks 'sanityinc/console-frame-setup)

(provide 'init-xterm)
