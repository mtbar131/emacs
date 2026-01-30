;; remove trailing whitespace
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;;  my preferred C styling
(c-add-style "amit-c-style"
	     '("bsd"
	       (c-offsets-alist . ((innamespace . [0])))
	       (c-basic-offset . 4)
	       (fill-column . 120)
	       (indent-tabs-mode . nil)
	       ;; (c-comment-only-line-offset . 0)
	       ;; (c-hanging-braces-alist . ((substatement-open before after)))
	       ))

(setq c-default-style "amit-c-style")


;; (add-hook 'python-mode-hook '(lambda ()
;;                                (indent-tabs-mode . nil)
;;                                (setq python-indent 3)))


(use-package projectile
  :ensure t
  ;; :pin melpa-stable
  :config
  ;; set indexing method to alien for speed up on Windows. For all other platforms it is
  ;; alien by default anyway
  (setq projectile-indexing-method 'alien)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (projectile-mode +1))


(setq lsp-keymap-prefix (kbd "C-c l"))
(use-package lsp-mode
  :ensure t
  :config
  ;; (setq lsp-keymap-prefix (kbd "C-c l"))
  (setq lsp-enable-snippet nil)
  (setq lsp-gopls-codelens nil)
  (setq lsp-enable-on-type-formatting nil)
  (setq lsp-enable-links nil)
  (setq lsp-clangd-binary-path "C:\\Program Files\\clang+llvm-21.1.0-x86_64-pc-windows-msvc\\bin\\clangd.exe")
  (lsp-register-custom-settings
   '(("gopls.staticcheck" t t)))
  (setq lsp-enable-file-watchers nil)
  ;; (setq lsp-log-io t)
  (setq lsp-go-build-flags ["-tags=functional,linux,windows"])
  (setq flymake-mode nil)
  (setq lsp-clients-clangd-args '(
                                "--compile-commands-dir=C:\\Users\\ambarve\\xstore-lsp"
                                "--background-index"
				"--clang-tidy"
				"--enable-config"
				"--pch-storage=memory"
				"--pretty"
				"--completion-style=detailed"
                                ))
  :commands (lsp lsp-deferred)
  :hook ((c-mode . lsp)
	 (c++-mode . lsp)
	 (go-mode . lsp)))


(use-package lsp-ivy
  :ensure t
  :after lsp-mode)

;; (use-package lsp-ui
;;   :config)

;; Go mode configuration
(setq gofmt-command "gofmt")
(setq gofmt-args '("-s" "-w"))
 (add-hook 'before-save-hook 'gofmt-before-save)


(use-package company
  :ensure t
  :bind (:map
         global-map
         ("C-TAB" . company-complete-common-or-cycle)
         ;; Use hippie expand as secondary auto complete. It is useful as it is
         ;; 'buffer-content' aware (it uses all buffers for that).
         ;; ("M-/" . hippie-expand)
         :map company-active-map
         ("C-n" . company-select-next)
         ("C-p" . company-select-previous))
  :config
  (setq company-idle-delay 0.05)
  (setq company-backends '(company-capf))
  (setq company-minimum-prefix-length 1)
  (add-hook 'prog-mode-hook 'company-mode-on))


(use-package treemacs
  :ensure t
  :defer t
  :config
  ;; (treeemacs-follow-mode t)
  ;; (treemacs-filewatch-mode nil)
  ;; (setq treemacs-display-in-side-window nil)
  :bind
  (
   ("M-0"       . treemacs-select-window)
   ("C-x t C-t" . treemacs-find-file)
   ([f8]        . treemacs)))


(use-package treemacs-projectile
  :after treemacs projectile
  :ensure t)


(when (eq system-type 'windows-nt)
  (message "NOT loading magit")
  )

;; do not use magit on windows - it is super slow
(unless (eq system-type 'windows-nt)
  (message "loading magit")
  (use-package magit
    :ensure t)
  ;; forge is required to access github PRs/Issues from within magit,
  ;; whenever you access forge functions from within magit it will look at the
  ;; `github.user` config value of that git repository and will try to access
  ;; the repo by using credentials provided in the `authinfo` file below.
  (use-package forge
    :after magit
    :config (setq auth-sources '("~/.authinfo"))))

;; (add-hook 'prog-mode-hook
;; 	  (lambda()
;; 	    (flyspell-mode 1)
;; 	    (flyspell-prog-mode)))

(add-hook 'nxml-mode-hook
	  (lambda()
	    (setq indent-tabs-mode nil)
	    ))

(add-hook 'powershell-mode-hook
	  (lambda()
		(setq indent-tabs-mode nil)
		))

;; (add-hook 'ediff-load-hook
;;           (lambda ()
;; 	    (setq ediff-show-ancestor 't)
;; 	    ))

(provide 'setup-programming)
