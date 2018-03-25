
;; company
(use-package company
  :init
  (global-company-mode 1)
  (setq company-backends (delete 'company-semantic company-backends))
  (delete 'company-semantic company-backends))

;; (define-key c-mode-map  [(tab)] 'company-complete)
;; (define-key c++-mode-map  [(tab)] 'company-complete)

(require 'cc-mode)
(require 'semantic)
(global-semanticdb-minor-mode 1)
(global-semantic-idle-scheduler-mode 1)

(semantic-mode 1)

(provide 'setup-company)
