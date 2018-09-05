
;;; Preferred Indentation configuration

;;; These are default indentation settings that must
;;; be preferred. But at VMware we have different requirements
;;; hence, we use that at VMware.

;; use space to indent by default
;; (setq-default indent-tabs-mode nil)

;; set appearance of a tab that is represented by 4 spaces
;; (setq-default tab-width 4)

;;; Preferred Indentation configuration ends


;;; VMware specific indetation

;; no tabs
(setq indent-tabs-mode nil)
(setq-default indent-tabs-mode nil)

;; 3 space indent
(setq c-basic-offset 3)

;; remove trailing whitespace
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; vmware styling?
(c-add-style "vmware"
             '("bsd"
               (c-basic-offset . 3)
               (fill-column . 80)
               (indent-tabs-mode . nil)
               (c-comment-only-line-offset . 0)
               (c-hanging-braces-alist . ((substatement-open before after)))
               (c-offsets-alist . ((topmost-intro        . 0)
                                   (topmost-intro-cont   . 0)
                                   (substatement         . +)
                                   (substatement-open    . 0)
                                   (statement-case-open  . +)
                                   (statement-cont       . +)
                                   (access-label         . -)
                                   (inclass              . +)
                                   (inline-open          . 0)
                                   (innamespace          . 0)
                                   ))))
;; was "gnu"e
(setq c-default-style "vmware")


(add-hook 'python-mode-hook '(lambda ()
                               (indent-tabs-mode . nil)
                               (setq python-indent 3)))

;; (add-hook 'python-mode-hook
;;           (lambda ()
;;             (setq indent-tabs-mode nil)
;;             (setq-default indent-tabs-mode . nil)
;;             (setq tab-width 2)
;;             (setq-default py-indent-tabs-mode t)))

;;; VMware specific indentation settings end


;; shows visual bar at 80 columns
(require 'fill-column-indicator)
(setq fci-rule-column 80)
(add-hook 'after-change-major-mode-hook 'fci-mode)
;; (add-hook 'prog-mode-hook (lambda() (flyspell-prog-mode)))

(provide 'setup-programming)
