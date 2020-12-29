(setq org-directory "/mnt/d/Amit/notes/org")
(setq org-capture-templates nil)

;; ---------------------- Basic org templates ----------------------
(setq amit-org-personal-todo-file (concat org-directory "/todo.org"))

;; org-capture-templates should be a list of template specifications:
;; Each specification (<key> <short description> <type> <target> <template> <properties>)

(setq org-capture-templates
      '(("t"
	 "Personal todo"
	 entry
	 (file amit-org-personal-todo-file)
	 "* TODO %^{Description} %^g\n :LOGBOOK:  -  Added: %U\n  :END:\n  %?")))


(provide 'setup-org)
