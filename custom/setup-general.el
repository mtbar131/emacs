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

;; don't create backup files
(setq create-lockfiles nil)

;; no blinking cursor
(blink-cursor-mode 0)


;; line numbers
(global-linum-mode t)

;; short answers to yes/no questions
(fset 'yes-or-no-p 'y-or-n-p)

;; highlight current line
(global-hl-line-mode 1)

(use-package rainbow-delimiters
  :config
  (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))

(provide 'setup-general)
