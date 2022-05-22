;; keep a list of recently opened files
(require 'recentf)
(recentf-mode 1)

;; --------------------------------------------------------------------------------
;; make ibuffer default and show better
(defalias 'list-buffers 'ibuffer)
(setq ibuffer-saved-filter-groups
	(quote (("default"
		 ("dired" (mode . dired-mode))
		 ("org" (name . "^.*org$"))
		 ("magit" (mode . magit-mode))
		 ("web" (or (mode . web-mode) (mode . js2-mode)))
		 ("shell" (or (mode . eshell-mode) (mode . shell-mode)))
		 ("programming" (or
				 (mode . verilog-mode)
                                 (mode . c-mode)
				 (mode . ess-r-mode)
				 (mode . python-mode)
				 (mode . c++-mode)))
		 ("emacs" (or
			   (name . "^\\*scratch\\*$")
			   (name . "^\\*Messages\\*$")))
		 ))))
  (add-hook 'ibuffer-mode-hook
	    (lambda ()
	      (ibuffer-auto-mode 1)
	      (ibuffer-switch-to-saved-filter-groups "default")))
;; --------------------------------------------------------------------------------
(use-package magit
     :ensure t
     :bind
     ("C-x g" . magit-status)
     )

(use-package git-gutter
     :ensure t
     :config
     (global-git-gutter-mode +1)
     )

;; --------------------------------------------------------------------------------


(use-package posframe
    :ensure t
    )

(use-package expand-region
  :ensure t
  :bind("C-=" . er/expand-region)
  )

;; --------------------------------------------------------------------------------
(provide 'init-test)