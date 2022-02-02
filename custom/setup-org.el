(setq org-directory "~/Amit/org")
(setq org-capture-templates nil)
(setq amit-org-work-todo-file (concat org-directory "/work-todo.org"))
(setq org-agenda-files (list amit-org-work-todo-file))

;; ---------------------- Basic org templates ----------------------
;; (setq amit-org-personal-todo-file (concat org-directory "/personal-todo.org"))


;; org-capture-templates should be a list of template specifications:
;; Each specification (<key> <short description> <type> <target> <template> <properties>)

;; amit-org-template-types specifies the different types of templates that I frequently
;; use with org capture This is a hashmap which also stores other relevant information
;; that is used when setting these as org capture templates.
;; -----------------------------------------------------------------
(setq amit-org-template-types
      #s(hash-table size 10 data
		    ("PR_Review" (
				   ("name" . "Pull Requests to Review")
				   ("key" . "r")
				   )

		    "Deliverable" (
				     ("name" . "Deliverables and Tasks")
				     ("key" . "d")
				     )

		    "Bugs_ICMs" (
				   ("name" . "Bugs and ICMs")
				   ("key" . "b")
				   )

		    "Misc" (
			      ("name" . "Misc Items")
			      ("key" . "m")
			      )

		    "One_on_One" (
				    ("name" . "One on One")
				    ("key" . "o")
				    )
		    )))
;; -----------------------------------------------------------------


;; amit-org-capture-templates is a list of all custom org capture templates that I use.
;; -----------------------------------------------------------------
(setq amit-org-capture-templates '())

(maphash (lambda (key val)
	   (push (list (cdr (assoc "key" val)) (cdr (assoc "name" val)) 'entry '(file amit-org-work-todo-file) (format "* TODO %%^{Description} :%s:\n %%^{PRIORITY}p\n :Details:\n Added: %%U\n :END:\n %%?" key))
		  amit-org-capture-templates)
	   ;; (message "tag: %s, data: %s" key (assoc "name" val))
	   ) amit-org-template-types)

(setq org-capture-templates amit-org-capture-templates)
;; -----------------------------------------------------------------


;; custom commands/views for org agenda.
;; -----------------------------------------------------------------
(setq amit-org-agenda-commands '())
(maphash (lambda (key val)
	   ;; Don't want One_on_One tasks to show up in work tasks agenda view
	   (if (not (string= key "One_on_One"))
	       (push (list 'tags-todo key) amit-org-agenda-commands))) amit-org-template-types)

(setq org-agenda-custom-commands
      `(("w" "All work tasks"
         ,amit-org-agenda-commands
	 )))

;; show only 10 entries at max in each category
(setq org-agenda-max-entries 10)
;; -----------------------------------------------------------------

;; misc org config
;; -----------------------------------------------------------------
(setq org-highest-priority ?0)
(setq org-default-priority ?5)
(setq org-lowest-priority ?9)
(setq org-cycle-separator-lines -1)

(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)
;; -----------------------------------------------------------------


(provide 'setup-org)

;; old code that's not used anymore
;; -----------------------------------------------------------------
;; (setq org-agenda-custom-commands
;;       '(("w" "All work tasks"
;;          (
;;           (tags-todo "Deliverable")
;; 	  (tags-todo "Bugs_ICM")
;; 	  (tags-todo "Misc")
;; 	  (tags-todo "PR_Review")
;; 	  (tags-todo "One_on_One")
;; 	  )
;; 	 )))

;; (setq org-capture-templates
;;       '(
;; 	("r"
;; 	 "Review Pull Request"
;; 	 entry
;; 	 (file amit-org-work-todo-file)
;; 	 "* TODO %^{Description} :PR_Review:%^g\n %^{PRIORITY}p\n :Details:\n Added: %U\n :END:\n %?")

;; 	("d"
;; 	 "Deliverable"
;; 	 entry
;; 	 (file amit-org-work-todo-file)
;; 	 "* TODO %^{Description} :Deliverable:%^g\n %^{PRIORITY}p\n :Details:\n Added: %U\n :END:\n %?")

;; 	("b"
;; 	 "Bugs ICMs"
;; 	 entry
;; 	 (file amit-org-work-todo-file)
;; 	 "* TODO %^{Description} :Bugs_ICM:%^g\n %^{PRIORITY}p\n :Details:\n Added: %U\n :END:\n %?")

;; 	("m"
;; 	 "Misc."
;; 	 entry
;; 	 (file amit-org-work-todo-file)
;; 	 "* TODO %^{Description} :Misc:%^g\n %^{PRIORITY}p\n :Details:\n Added: %U\n :END:\n %?")

;; 	("o"
;; 	 "One on One"
;; 	 entry
;; 	 (file amit-org-work-todo-file)
;; 	 "* TODO %^{Description} :One_on_One:%^g\n %^{PRIORITY}p\n :Details:\n Date: %U\n :END:\n %?")

;; 	))
