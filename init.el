;; Add melpa
(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (when no-ssl
    (warn "\
Your version of Emacs does not support SSL connections,
which is unsafe because it allows man-in-the-middle attacks.
There are two things you can do about this warning:
1. Install an Emacs version that does support SSL and be safe.
2. Remove this warning from your init file so you won't see it again."))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;; (add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives (cons "gnu" (concat proto "://elpa.gnu.org/packages/")))))

(package-initialize)

(when (not package-archive-contents)
    (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

;; Set path variable in include unix tools (like find,grep) provided by git
;; (setenv "PATH" (concat "C:\\Program Files\\Git\\usr\\bin;" (getenv "PATH")))
;; (setq exec-path (append '("C:\\Program Files\\Git\\usr\\bin") exec-path))


(require 'use-package)
(setq use-package-always-ensure t)

(add-to-list 'load-path "~/.emacs.d/custom")

(require 'setup-general)

(require 'setup-programming)

(require 'setup-editing)
(require 'setup-org)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("8adeb0bf3e77356c0aa34dd447f8e52ba56f8f9d4ce58d7c020f00e4bfff32f6" "05d1b0f079a493d98d02444fafc8d85ba5815b1e1d731a80291f063fd72ee0a9" "ba881f92a04cf56df49740324caea02d25442a327f1c33d1a1946f0b9a846f53" "a22f40b63f9bc0a69ebc8ba4fbc6b452a4e3f84b80590ba0a92b4ff599e53ad0" "585942bb24cab2d4b2f74977ac3ba6ddbd888e3776b9d2f993c5704aa8bb4739" "9abe2b502db3ed511fea7ab84b62096ba15a3a71cdb106fd989afa179ff8ab8d" default)))
 '(inhibit-startup-screen t)
 '(package-selected-packages
   (quote
    (flycheck jetbrains-darcula-theme srcery-theme modus-vivendi-theme gruvbox-theme monokai-theme protobuf-mode lsp-treemacs lsp-ivy treemacs go-mode fill-column-indicator magit use-package))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(lsp-face-highlight-read ((t (:background "#17A589"))))
 '(lsp-face-highlight-textual ((t (:background "#2E86C1"))))
 '(lsp-face-highlight-write ((t (:background "#884EA0"))))
 '(lsp-ui-doc-background ((t (:background "#2E4053"))))
 )

;; VC mode is making file operations very very slow
;; disable it entirely and use git command line
;; (setq vc-handled-backends nil)
