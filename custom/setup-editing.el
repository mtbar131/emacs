(delete-selection-mode)

(global-set-key (kbd "RET") 'newline-and-indent)

;; show whitespace in diff-mode
(add-hook 'diff-mode-hook (lambda ()
                            (setq-local whitespace-style
                                        '(face
                                          tabs
                                          tab-mark
                                          spaces
                                          space-mark
                                          trailing
                                          indentation::space
                                          indentation::tab
                                          newline
                                          newline-mark))
                            (whitespace-mode 1)))

;; Package: volatile-highlights
;; GROUP: Editing -> Volatile Highlights
(use-package volatile-highlights
  :init
  (volatile-highlights-mode t))

;; Package: undo-tree
;; GROUP: Editing -> Undo -> Undo Tree
(use-package undo-tree
  :init
  (global-undo-tree-mode 1))

;; Package: clean-aindent-mode - auto indent after RET
(use-package clean-aindent-mode
  :init
  (add-hook 'prog-mode-hook 'clean-aindent-mode))

;; Package: ws-butler - remove whitespace at end of line
(use-package ws-butler
  :init
  (add-hook 'prog-mode-hook 'ws-butler-mode)
  (add-hook 'text-mode 'ws-butler-mode)
  (add-hook 'fundamental-mode 'ws-butler-mode))

(use-package rainbow-delimiters
  :init
  (add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
  )

;; PACKAGE: anzu
;; GROUP: Editing -> Matching -> Isearch -> Anzu
;; (use-package anzu
;;   :init
;;   (global-anzu-mode)
;;   (global-set-key (kbd "M-%") 'anzu-query-replace)
;;   (global-set-key (kbd "C-M-%") 'anzu-query-replace-regexp))

;; PACKAGE: iedit
;; (use-package iedit
;;   :bind (("C-;" . iedit-mode))
;;   :init
;;   (setq iedit-toggle-key-default nil))


;; (use-package ido-completing-read+
;;   ;; "Allow ido usage in as many contexts as possible"
;;   :ensure t
;;   :config
;;   ;; This enables ido in all contexts where it could be useful, not just
;;   ;; for selecting buffer and file names
;;   (ido-mode t)
;;   (ido-everywhere t)
;;   ;; This allows partial matches, e.g. "uzh" will match "Ustad Zakir Hussain"
;;   (setq ido-enable-flex-matching t)
;;   (setq ido-use-filename-at-point nil)
;;   ;; Includes buffer names of recently opened files, even if they're not open now.
;;   (setq ido-use-virtual-buffers t))

;; (use-package ido-vertical-mode
;;   ;; "Show ido vertically"
;;   :ensure t
;;   :config
;;   (ido-vertical-mode t))

(use-package ivy
  ;; "A generic completion mechanism"
  :ensure t
  :config
  (ivy-mode t)
  (setq ivy-use-virtual-buffers t

        ;; Display index and count both.
        ivy-count-format "(%d/%d) "

        ;; By default, all ivy prompts start with `^'. Disable that.
        ivy-initial-inputs-alist nil)

  :bind (("C-x b" . ivy-switch-buffer)
         ("C-x B" . ivy-switch-buffer-other-window)))

(use-package swiper
  ;; "A better search"
  :ensure t
  :bind (("C-s" . swiper-isearch)
         ("C-M-s" . isearch-forward-regexp)
         ("C-M-r" . isearch-backward-regexp)))

(use-package counsel
  ;; "Ivy enhanced Emacs commands"
  :ensure t
  :bind (("M-x" . counsel-M-x)
         ("C-x C-f" . counsel-find-file)
         ("C-'" . counsel-imenu)
         ("C-c s" . counsel-rg)
         :map counsel-find-file-map
         ("RET" . ivy-alt-done)))

;; When opening a very large file switch to read-only mode
;; by default for fast editing
(defun my-find-file-check-make-large-file-read-only-hook ()
  "If a file is over a given size, make the buffer read only."
  (when (> (buffer-size) (* 1024 1024))
    (setq buffer-read-only t)
    (buffer-disable-undo)
    (global-linum-mode -1)
    (fundamental-mode)))

(add-hook 'find-file-hook 'my-find-file-check-make-large-file-read-only-hook)

(add-hook 'markdown-mode-hook
	  (lambda ()
	    (setq fill-column 120)
	    (auto-fill-mode t)))

(provide 'setup-editing)
