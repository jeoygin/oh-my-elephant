;; -*- lexical-binding: t -*-
(setq debug-on-error nil)

;;; This file bootstraps the configuration, which is divided into
;;; a number of other files.

(let ((minver "24.3"))
  (when (version< emacs-version minver)
    (error "Your Emacs is too old -- this config requires v%s or higher" minver)))
(when (version< emacs-version "24.5")
  (message "Your Emacs is old, and some functionality in this config will be disabled. Please upgrade if possible."))

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(require 'init-benchmarking) ;; Measure startup time

(defconst *spell-check-support-enabled* nil) ;; Enable with t if you prefer
(defconst *is-a-mac* (eq system-type 'darwin))
(defconst *is-a-linux* (eq system-type 'gnu/linux))
(defconst *is-a-mswindows* (eq system-type 'windows-nt))
(defconst *window-system-is-mac* (memq (window-system) '(mac ns)))

;;----------------------------------------------------------------------------
;; Adjust garbage collection thresholds during startup, and thereafter
;;----------------------------------------------------------------------------
(let ((normal-gc-cons-threshold (* 20 1024 1024))
      (init-gc-cons-threshold (* 128 1024 1024)))
  (setq gc-cons-threshold init-gc-cons-threshold)
  (add-hook 'after-init-hook
            (lambda () (setq gc-cons-threshold normal-gc-cons-threshold))))

;;----------------------------------------------------------------------------
;; Bootstrap config
;;----------------------------------------------------------------------------
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(require 'init-utils)
(require 'init-site-lisp) ;; Must come before elpa, as it may provide package.el
;; Calls (package-initialize)
(require 'init-elpa)      ;; Machinery for installing required packages
(require 'init-exec-path) ;; Set up $PATH
(require 'init-general)
(require 'init-feature-functions) ;; Define nuxell/init-<feature> functions
(require 'init-nuxell)
(require 'init-idle-require)

;;----------------------------------------------------------------------------
;; Allow users to provide an optional "init-preload-local.el"
;;----------------------------------------------------------------------------
(require 'init-preload-local nil t)

;;----------------------------------------------------------------------------
;; Load configs for specific features and modes
;;----------------------------------------------------------------------------

(require-package 'wgrep)
(require-package 'diminish)
(require-package 'scratch)
(require-package 'command-log-mode)

(require 'init-frame-hooks)
(require 'init-xterm)
(require 'init-themes)
(require 'init-osx-keys)
(require 'init-gui-frames)
(require 'init-dired)
(require 'init-ranger)
(require 'init-isearch)
(require 'init-grep)
(require 'init-uniquify)
(require 'init-ibuffer)
(require 'init-recentf)
(require 'init-smex)
(require 'init-ivy)

(idle-require 'init-helm)
(idle-require 'init-keyfreq)

(require 'init-hippie-expand)
(require 'init-company)
(require 'init-flycheck)
(require 'init-sessions)
(require 'init-linum-mode)
(require 'init-mode-line)
(require 'init-yasnippet)

(require 'init-windows)
(require 'init-fonts)
(require 'init-mmm)

(idle-require 'init-evil)
(idle-require 'init-clipboard)
(idle-require 'init-editing-utils)
(idle-require 'init-whitespace)
(idle-require 'init-chinese)

(idle-require 'init-gtags)
(idle-require 'init-ycmd)

(idle-require 'init-vc)
(idle-require 'init-darcs)
(idle-require 'init-git)
(idle-require 'init-github)
 
(require 'init-projectile)

(idle-require 'init-confluence)
(idle-require 'init-reveal)
(idle-require 'init-compile)
;;(idle-require 'init-crontab)
(idle-require 'init-textile)
(idle-require 'init-markdown)
(idle-require 'init-csv)
(idle-require 'init-cc)
(idle-require 'init-java)
(idle-require 'init-erlang)
(idle-require 'init-javascript)
(idle-require 'init-php)
(idle-require 'init-org)
(idle-require 'init-nxml)
(idle-require 'init-html)
(idle-require 'init-css)
(idle-require 'init-haml)
(idle-require 'init-http)
(idle-require 'init-python)
(unless (version<= emacs-version "24.3")
  (idle-require 'init-haskell))
(idle-require 'init-elm)
(require 'init-purescript)
(idle-require 'init-ruby)
(idle-require 'init-rails)
(idle-require 'init-sql)
(idle-require 'init-rust)
(idle-require 'init-toml)
(idle-require 'init-yaml)
(idle-require 'init-docker)
(idle-require 'init-terraform)
(maybe-require-package 'nginx-mode)

(idle-require 'init-paredit)
(idle-require 'init-lisp)
(idle-require 'init-slime)
(unless (version<= emacs-version "24.2")
  (idle-require 'init-clojure)
  (idle-require 'init-clojure-cider))
(idle-require 'init-common-lisp)

(when *spell-check-support-enabled*
  (idle-require 'init-spelling))

(idle-require 'init-misc)

(idle-require 'init-folding)
(idle-require 'init-dash)
(idle-require 'init-ledger)
(idle-require 'init-email)
(idle-require 'init-elfeed)

;; Extra packages which don't require any configuration

(require-package 'gnuplot)
(require-package 'lua-mode)
(require-package 'htmlize)
(require-package 'dsvn)
(when *is-a-mac*
  (require-package 'osx-location))
(unless (eq system-type 'windows-nt)
  (maybe-require-package 'daemons))
(maybe-require-package 'dotenv-mode)

(when (maybe-require-package 'uptimes)
  (setq-default uptimes-keep-count 200)
  (add-hook 'after-init-hook (lambda () (require 'uptimes))))

(idle-require-mode 1) ;; starts loading

;;----------------------------------------------------------------------------
;; Allow access from emacsclient
;;----------------------------------------------------------------------------
(require 'server)
(unless (server-running-p)
  (server-start))

;;----------------------------------------------------------------------------
;; Variables configured via the interactive 'customize' interface
;;----------------------------------------------------------------------------
(when (file-exists-p custom-file)
  (load custom-file))


;;----------------------------------------------------------------------------
;; Locales (setting them earlier in this file doesn't work in X)
;;----------------------------------------------------------------------------
(require 'init-locales)


;;----------------------------------------------------------------------------
;; Allow users to provide an optional "init-local" containing personal settings
;;----------------------------------------------------------------------------
(require 'init-local nil t)



(provide 'init)

;; Local Variables:
;; coding: utf-8
;; no-byte-compile: t
;; End:
