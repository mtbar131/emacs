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
   '("9b54ba84f245a59af31f90bc78ed1240fca2f5a93f667ed54bbf6c6d71f664ac"
     "cf922a7a5c514fad79c483048257c5d8f242b21987af0db813d3f0b138dfaf53"
     "a7b20039f50e839626f8d6aa96df62afebb56a5bbd1192f557cb2efb5fcfb662"
     "e2c926ced58e48afc87f4415af9b7f7b58e62ec792659fcb626e8cba674d2065"
     "b0e446b48d03c5053af28908168262c3e5335dcad3317215d9fdeb8bac5bacf9"
     "d47f868fd34613bd1fc11721fe055f26fd163426a299d45ce69bef1f109e1e71"
     "4a5aa2ccb3fa837f322276c060ea8a3d10181fecbd1b74cb97df8e191b214313"
     "97db542a8a1731ef44b60bc97406c1eb7ed4528b0d7296997cbb53969df852d6"
     "6c531d6c3dbc344045af7829a3a20a09929e6c41d7a7278963f7d3215139f6a7"
     "6c98bc9f39e8f8fd6da5b9c74a624cbb3782b4be8abae8fd84cbc43053d7c175"
     "5784d048e5a985627520beb8a101561b502a191b52fa401139f4dd20acb07607"
     "8621edcbfcf57e760b44950bb1787a444e03992cb5a32d0d9aec212ea1cd5234"
     "8146edab0de2007a99a2361041015331af706e7907de9d6a330a3493a541e5a6"
     "846b3dc12d774794861d81d7d2dcdb9645f82423565bfb4dad01204fa322dbd5"
     "1704976a1797342a1b4ea7a75bdbb3be1569f4619134341bd5a4c1cfb16abad4"
     "e19ac4ef0f028f503b1ccafa7c337021834ce0d1a2bca03fcebc1ef635776bea"
     "0466adb5554ea3055d0353d363832446cd8be7b799c39839f387abb631ea0995"
     "1d5e33500bc9548f800f9e248b57d1b2a9ecde79cb40c0b1398dec51ee820daf"
     "234dbb732ef054b109a9e5ee5b499632c63cc24f7c2383a849815dacc1727cb6"
     "da186cce19b5aed3f6a2316845583dbee76aea9255ea0da857d1c058ff003546"
     "a9a67b318b7417adbedaab02f05fa679973e9718d9d26075c6235b1f0db703c8"
     "7a7b1d475b42c1a0b61f3b1d1225dd249ffa1abb1b7f726aec59ac7ca3bf4dae"
     "37768a79b479684b0756dec7c0fc7652082910c37d8863c35b702db3f16000f8"
     "9242c8adc09d80f831dce0a701891cf528d04f6fd5896561a92eaa7f6f917d08"
     "51ec7bfa54adf5fff5d466248ea6431097f5a18224788d0bd7eb1257a4f7b773"
     "aff12479ae941ea8e790abb1359c9bb21ab10acd15486e07e64e0e10d7fdab38"
     "00445e6f15d31e9afaa23ed0d765850e9cd5e929be5e8e63b114a3346236c44c"
     "7f1d414afda803f3244c6fb4c2c64bea44dac040ed3731ec9d75275b9e831fe5"
     "28a104f642d09d3e5c62ce3464ea2c143b9130167282ea97ddcc3607b381823f"
     "35c096aa0975d104688a9e59e28860f5af6bb4459fd692ed47557727848e6dfe"
     "8adeb0bf3e77356c0aa34dd447f8e52ba56f8f9d4ce58d7c020f00e4bfff32f6"
     "05d1b0f079a493d98d02444fafc8d85ba5815b1e1d731a80291f063fd72ee0a9"
     "ba881f92a04cf56df49740324caea02d25442a327f1c33d1a1946f0b9a846f53"
     "a22f40b63f9bc0a69ebc8ba4fbc6b452a4e3f84b80590ba0a92b4ff599e53ad0"
     "585942bb24cab2d4b2f74977ac3ba6ddbd888e3776b9d2f993c5704aa8bb4739"
     "9abe2b502db3ed511fea7ab84b62096ba15a3a71cdb106fd989afa179ff8ab8d" default))
 '(inhibit-startup-screen t)
 '(org-agenda-files
   '("/home/amit/Amit/org/tasks.org"
     "/home/amit/Amit/org/work-todo.org") t)
 '(package-selected-packages
   '(clean-aindent-mode company counsel forge lsp-ivy projectile-ripgrep rainbow-delimiters
			treemacs-projectile undo-tree volatile-highlights ws-butler))
 '(warning-suppress-types '((use-package))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ediff-current-diff-A ((t (:background "#553333"))))
 '(ediff-current-diff-Ancestor ((t (:background "#553333"))))
 '(ediff-current-diff-B ((t (:background "#553333"))))
 '(ediff-current-diff-C ((t (:background "#553333"))))
 '(ediff-fine-diff-A ((t (:background "#aa2222"))))
 '(ediff-fine-diff-Ancestor ((t (:background "#aa2222"))))
 '(ediff-fine-diff-B ((t (:background "#aa2222"))))
 '(ediff-fine-diff-C ((t (:background "#aa2222"))))
 '(lsp-face-highlight-read ((t (:background "#17A589"))))
 '(lsp-face-highlight-textual ((t (:background "#2E86C1"))))
 '(lsp-face-highlight-write ((t (:background "#884EA0"))))
 '(lsp-ui-doc-background ((t (:background "#2E4053")))))

;; VC mode is making file operations very very slow
;; disable it entirely and use git command line
;; (setq vc-handled-backends nil)
