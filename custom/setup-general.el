(menu-bar-mode -1) ;; remove menu bar
(tool-bar-mode -1) ;; remove tool bar

(setq gc-cons-threshold 100000000) ;; garbage collection threshold
(setq inhibit-startup-message t) ;; no startup screen

;; show unncessary whitespace that can mess up your diff
(add-hook 'prog-mode-hook
          (lambda () (interactive)
            (setq show-trailing-whitespace 1)))

;; Compilation
(global-set-key (kbd "<f5>") (lambda ()
                               (interactive)
                               (setq-local compilation-read-command nil)
                               (call-interactively 'compile)))



;; activate whitespace-mode to view all whitespace characters
(global-set-key (kbd "C-c w") 'whitespace-mode)

;; load theme
(load-theme 'wombat)
;; (load-theme 'poet-dark)
;; (load-theme 'solarized-wombat-dark)



;; no blinking cursor
(blink-cursor-mode 0)

;; line numbers
(global-display-line-numbers-mode)

;; disable scroll bar
(scroll-bar-mode -1)

;; short answers to yes/no questions
(fset 'yes-or-no-p 'y-or-n-p)

;; highlight current line
(global-hl-line-mode 1)

(use-package rainbow-delimiters
  :config
  (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))

;; Change how emacs makes backup
;; having lots of *~ files in every directory is annoying
(setq backup-directory-alist `(("." . "~/.saves")))
(setq backup-by-copying-when-linked t)
(setq delete-old-versions t
  kept-new-versions 6
  kept-old-versions 2
  version-control t)

;; Automatically update buffers when file changes in filesystem
;; (global-auto-revert-mode t)

;; Make switching between windows easier
(use-package ace-window
  :init
  (global-set-key (kbd "C-x o") 'ace-window))

(use-package recentf
  :config
  (global-set-key "\C-x\ \C-r" 'recentf-open-files)
  (setq recentf-auto-cleanup 'never
        recentf-max-saved-items 1000
        recentf-save-file (concat user-emacs-directory ".recentf"))
  (recentf-mode t))

;; use ibuffer
(use-package ibuffer
  :bind ("C-x C-b" . ibuffer))

;; (add-to-list 'exec-path "D:\\Amit\\customizations\\hunspell\\bin")
;; (setq ispell-program-name (locate-file "hunspell"
;; 				       exec-path exec-suffixes 'file-executable-p))

;; (setq ispell-local-dictionary-alist
;;       '((nil
;; 	 "[[:alpha:]]"
;; 	 "[^[:alpha:]]"
;; 	 "[']"
;; 	 t
;; 	 ("-d" "en_US" "-p" "D:\\Amit\\customizations\\hunspell\\share\\hunspell\\personal.en")
;; 	 nil
;; 	 iso-8859-1)))

(require 'ispell)

(dolist (hook '(text-mode-hook))
  (add-hook hook (lambda () (flyspell-mode 1))))
(dolist (hook '(fundamental-mode-hook))
  (add-hook hook (lambda () (flyspell-mode 1))))
(dolist (hook '(markdown-mode-hook))
  (add-hook hook (lambda () (flyspell-mode 1))))

;; stop bell sounds on windows
(setq ring-bell-function 'ignore)

(setq-default fill-column 90)
;; (use-package fill-column-indicator
;;   :init
;;   (setq fci-rule-column 90)
;;   (add-hook 'after-change-major-mode-hook 'fci-mode))

;; (set-face-attribute 'default nil
;; 		    :family "Source Code Pro"
;; 		    :height 110
;; 		    :weight 'normal
;; 		    :width 'normal)

(provide 'setup-general)
