;;; Preferred Indentation configuration

;;; These are default indentation settings that must
;;; be preferred. But at VMware we have different requirements
;;; hence, we use that at VMware.

;; use space to indent by default
;; (setq-default indent-tabs-mode nil)

;; set appearance of a tab that is represented by 4 spaces
;; (setq-default tab-width 4)

;;; Preferred Indentation configuration ends


;; remove trailing whitespace
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Microsoft styling
;; (c-add-style "microsoft"
;; 	     '("bsd"
;; 	       (c-basic-offset . 4)
;; 	       (fill-column . 80)
;; 	       (indent-tabs-mode . nil)
;; 	       ;; (c-comment-only-line-offset . 0)
;; 	       (c-hanging-braces-alist . ((substatement-open before after)))
;; 	       ))

;; (setq c-default-style "microsoft")


;; (add-hook 'python-mode-hook '(lambda ()
;;                                (indent-tabs-mode . nil)
;;                                (setq python-indent 3)))


(use-package projectile
  :ensure t
  ;; :pin melpa-stable
  :config
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (projectile-mode +1))


(setq lsp-keymap-prefix (kbd "C-c l"))
(use-package lsp-mode
  :ensure t
  :config
  ;; (setq lsp-keymap-prefix (kbd "C-c l"))
  ;; (setq lsp-go-build-flags ["-tags=functional"])
  :commands (lsp lsp-deferred)
  :hook (go-mode . lsp-deferred))


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
  :bind
  (
   ("M-0"       . treemacs-select-window)
   ("C-x t C-t" . treemacs-find-file)
   ([f8]        . treemacs)))


(use-package treemacs-projectile
  :after treemacs projectile
  :ensure t)

(use-package magit)

(use-package forge
  :after magit)

(add-hook 'prog-mode-hook
	  (lambda()
	    (flyspell-mode 1)
	    (flyspell-prog-mode)))

(provide 'setup-programming)
