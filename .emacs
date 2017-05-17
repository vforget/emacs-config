;; Emacs
(transient-mark-mode 1)
(setq inhibit-splash-screen t)
(set-face-attribute 'default nil :font "-outline-Hack-normal-normal-normal-mono-12-*-*-*-c-*-iso8859-1")
;;(set-background-color "darkslategrey")
;;(set-foreground-color "wheat")
(tool-bar-mode -1)
(menu-bar-mode -1)

;; Solarized theme
;;(add-to-list 'custom-theme-load-path "~/.emacs.d/emacs-color-theme-solarized-master")
;;(load-theme 'solarized t)

;; ido
(require 'ido)
(ido-mode t)

;; Org-mode
(require 'org)
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(define-key global-map "\C-cc" 'org-capture)
(define-key global-map "\C-cb" 'org-iswitchb)

(setq org-log-done t)
(setq org-agenda-files (list "~/Dropbox/org/work.org"
                             "~/Dropbox/org/personal.org"))
(setq org-todo-keywords
       '((sequence "TODO(t)" "NEXT(n)" "WAITING(w)" "INACTIVE(i)" "MEETING(m)" "|" "DONE(d)" "CANCELLED(c)")))
(setq org-default-notes-file "~/Dropbox/org/notes.org")
(define-key global-map "\C-cc" 'org-capture)

;;(setq org-capture-templates
;;       '(("t" "todo" entry (file org-default-notes-file)
;;	  "* TODO %?\n%u\n%a\n" :clock-in t :clock-resume t)
;;	 ("m" "Meeting" entry (file org-default-notes-file)
;;	  "* MEETING with %? :MEETING:\n%t" :clock-in t :clock-resume t)
;;	 ("d" "Diary" entry (file+datetree "~/Dropbox/org/diary.org")
;;	  "* %?\n%U\n" :clock-in t :clock-resume t)
;;	 ("i" "Idea" entry (file org-default-notes-file)
;;	  "* %? :IDEA: \n%t" :clock-in t :clock-resume t)
;;	 ("n" "Next Task" entry (file+headline org-default-notes-file "Tasks")
;;	  "** NEXT %? \nDEADLINE: %t") ))

(setq org-capture-templates
      '(
	("t" "Todo" entry (file+headline "~/Dropbox/org/work.org" "00CAPTURE")
	 "** TODO %?")
	("m" "Meeting" entry (file+headline "~/Dropbox/org/work.org" "01MEETING")
	 "** MEETING with %? :MEETING:")
	("i" "Idea" entry (file+headline "~/Dropbox/org/work.org" "00CAPTURE")
	 "** %? :IDEA:")
	("n" "Next Task" entry (file+headline "~/Dropbox/org/work.org" "02TASKS")
	 "** NEXT %?\nDEADLINE: %t")
	)
      )

(defun start-todo ()
  (interactive)
  (set-face-attribute 'default nil :font "-outline-Hack-normal-normal-normal-mono-12-*-*-*-c-*-iso8859-1")
  (find-file "~/Dropbox/org/work.org")
  (split-window-vertically)
  (org-agenda-list)
  )

;; MELPA
(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line

;; auto-complete
(add-to-list 'load-path "~/.emacs.d/elpa/auto-complete-20150618.1949")
(require 'auto-complete)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete-20150618.1949/dict")
(require 'auto-complete-config)
(ac-config-default)
(global-auto-complete-mode t)


;; fill-column-indicator
(add-to-list 'load-path "~/.emacs.d/elpa/fill-column-indicator-20140509.1101")
(require 'fill-column-indicator)
(define-globalized-minor-mode
  global-fci-mode fci-mode (lambda () (fci-mode 1)))
(global-fci-mode t)


;; python-mode
(setq py-install-directory "~/.emacs.d/elpa/python-mode-20150709.514/")
(add-to-list 'load-path py-install-directory)
(require 'python-mode)

; use IPython
(setq-default py-shell-name "python")
(setq-default py-which-bufname "Python")
(setq py-force-py-shell-name-p t)

; switch to the interpreter after executing code
(setq py-shell-switch-buffers-on-execute-p t)
(setq py-switch-buffers-on-execute-p t)
; don't split windows
(setq py-split-windows-on-execute-p nil)
; try to automagically figure out indentation
(setq py-smart-indentation t)


;; ESS
(add-to-list 'load-path "~/.emacs.d/ess-16.10/lisp")
(load "ess-site")
(setq comint-prompt-read-only t)
(setq comint-scroll-to-bottom-on-input t)
(setq comint-scroll-to-bottom-on-output t)
(setq comint-move-point-for-output t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (monokai-theme python-mode markdown-preview-mode markdown-mode+ fill-column-indicator color-theme-modern auto-complete))))
(load-theme 'monokai t)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-level-1 ((t (:inherit default :foreground "#FD971F" :height 1.0))))
 '(org-level-2 ((t (:inherit default :foreground "#A6E22E" :height 1.0))))
 '(org-level-3 ((t (:inherit default :foreground "#66D9EF" :height 1.0))))
 '(org-level-4 ((t (:inherit default :foreground "#E6DB74" :height 1.0)))))
