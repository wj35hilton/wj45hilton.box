;; packaging
(add-to-list 'load-path "/home/whilton/emacs/package")
(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)
(unless (package-installed-p 'scala-mode2)
  (package-refresh-contents) (package-install 'scala-mode2))

;; turn on syntax hilighting
(global-font-lock-mode 1)

;; windmove
(windmove-default-keybindings)

;; Highlight regions for cutting or copying
(setq transient-mark-mode t) 

;; turn off the tool bar
(tool-bar-mode -1)

;; turn off the menu bar
(menu-bar-mode -1)

;; save buffers on exit
(desktop-save-mode 1)


;; save-mode customization
(setq history-length 250)
(add-to-list 'desktop-globals-to-save 'file-name-history)

;; no tabs -- ever!
(setq-default indent-tabs-mode nil)

;; Org-mode settings
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(setq org-log-done t)

;; some key-bindings
(global-set-key "\C-cc" 'comment-region)
(global-set-key "\C-cu" 'uncomment-region)
(global-set-key "\C-cn" 'next-error)
(global-set-key "\C-cp" 'previous-error)
(global-set-key "\C-x\C-b" 'electric-buffer-list)

;; disable ctrl-c ctrl-x
(defun dont-kill-emacs ()
  (interactive)
  (error (substitute-command-keys "To exit emacs: \\[kill-emacs]")))
(global-set-key "\C-x\C-c" 'dont-kill-emacs)

;; Import color theme (and set)
(add-to-list 'load-path "~/emacs/color-theme-6.6.0")
(require 'color-theme)
(color-theme-initialize)
(load "~/emacs/zenburn")
(color-theme-zenburn)

;; ido
(require 'ido)
(ido-mode t)

;; uniquify
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward)

;; mutt
(server-start)
(add-to-list 'auto-mode-alist '("/mutt" . mail-mode))



;; XXXX
;;(add-to-list 'load-path "/usr/share/emacs/site-lisp/XXXX")
;;(add-to-list 'load-path "/usr/share/emacs/site-lisp/haskell-mode")
;;(require 'XXXX2-mode)
;;(load-file (let ((coding-system-for-read 'utf-8))
;;   (shell-command-to-string "XXXX-mode locate")))



;; tnt
;;(add-to-list 'load-path "~/emacs/tnt-2.6")
;;(load "tnt")

;; w3m 
;;(add-to-list 'load-path "/home/whilton/emacs/emacs-w3m")
;;(autoload 'w3m-browse-url "w3m" "Ask a WWW browser to show a URL." t)
;;(setq browse-url-browser-function 'w3m-browse-url)
;;(setq w3m-use-cookies t)


;; slime
;; take 1
;;(add-to-list 'load-path "/home/whilton/install/slime")
;;(add-to-list 'load-path "/home/whilton/work/slime")
;;(require 'slime)
;;(add-hook 'lisp-mode-hook (lambda () (slime-mode t)))
;;(add-hook 'inferior-lisp-mode-hook (lambda () (inferior-slime-mode t)))
;; Optionally, specify the lisp program you are using. Default is "lisp"
;;(setq inferior-lisp-program "/usr/bin/sbcl") 

;; take 2
(setq inferior-lisp-program "/usr/bin/sbcl")
(add-to-list 'load-path "/home/whilton/emacs/slime")
(require 'slime)
(slime-setup)
(slime-setup '(slime-repl))


;; too long lines
;;(add-hook 'c-mode-hook
;;  (lambda ()
;;    (font-lock-add-keywords nil
;;      '(("^[^\n]\\{80\\}\\(.*\\)$" 1 font-lock-warning-face t)))))

;; Java mode hook.
;; (defun java-mode-jimb-hook ()
;;   ;; TAB stops at multiples of 4.
;;   (setq tab-stop-list '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80 84 88 92 96 100 104 108 112 116 120))
;;   (setq indent-tabs-mode jimb-indent-tabs-mode)
;;   (setq default-tab-width 4)
;;   (setq-default tab-width 4)
;;   (define-key java-mode-map "\t" 'tab-to-tab-stop)
;;   (define-key java-mode-map [backspace] 'delete-backward-char)
;;   ;; Prevent triggering indentation when typing.
;;   (define-key java-mode-map "/" 'c-mode-jimb-slash)
;;   (define-key java-mode-map "*" 'c-mode-jimb-star)
;;   (define-key java-mode-map "," 'c-mode-jimb-comma)
;;   (define-key java-mode-map ":" 'c-mode-jimb-colon)
;;   (define-key java-mode-map ";" 'c-mode-jimb-semicolon)
;;   (define-key java-mode-map "(" 'c-mode-jimb-paren-left)
;;   (define-key java-mode-map ")" 'c-mode-jimb-paren-right)
;;   (define-key java-mode-map "{" 'c-mode-jimb-brace-left)
;;   (define-key java-mode-map "}" 'c-mode-jimb-brace-right)
;;   (define-key java-mode-map "<" 'c-mode-jimb-angle-left)
;;   (define-key java-mode-map ">" 'c-mode-jimb-angle-right)
;; )

;; flymake fail
;;(add-to-list 'load-path "/home/whilton/emacs/flymake-mvn")
;;(require 'flymake-mvn)
;;(add-hook 'java-mode-hook 'flymake-java-mvn-mode-hook)

;;(require 'eclim)
;;(global-eclim-mode)
;;n(require 'eclimd)
;;(require 'flymake)
;;(setq flymake-log-level 3)

(add-hook 'java-mode-hook 
  (lambda ()
    (setq c-basic-offset 2)))

;; malabar-mode for java
;;(add-to-list 'load-path "/home/whilton/emacs/malabar-1.4.0/lisp")
;;(setq semantic-default-submodes '(global-semantic-idle-scheduler-mode
;;                                  global-semanticdb-minor-mode
;;                                  global-semantic-idle-summary-mode
;;                                  global-semantic-mru-bookmark-mode))
;;(semantic-mode 1)
;;(require 'malabar-mode)
;;(setq malabar-groovy-lib-dir "/home/whilton/emacs/malabar-1.4.0/lib")
;;(add-to-list 'auto-mode-alist '("\\.java\\'" . malabar-mode))

;; groovy 
;;; use groovy-mode when file ends in .groovy or has #!/bin/groovy at start
(add-to-list 'load-path "/home/whilton/emacs/Emacs-Groovy-Mode")
(autoload 'groovy-mode "groovy-mode" "Groovy editing mode." t)
(add-to-list 'auto-mode-alist '("\.groovy$" . groovy-mode))
(add-to-list 'interpreter-mode-alist '("groovy" . groovy-mode))

;;; long lines in groovy 
(add-hook 'groovy-mode-hook
  (lambda ()
    (font-lock-add-keywords nil
      '(("^[^\n]\\{100\\}\\(.*\\)$" 1 font-lock-warning-face t)))))

;;; make Groovy mode electric by default.
(add-hook 'groovy-mode-hook
          '(lambda ()
             (require 'groovy-electric)
             (groovy-electric-mode)))



;; scala
;; (let ((path "/home/whilton/emacs/scala/emacs"))
;;   (setq load-path (cons path load-path))
;;   (load "scala-mode-auto.el"))

;; (defun scala-turnoff-indent-tabs-mode ()
;;   (setq indent-tabs-mode nil))

;; ;; scala mode hooks
;; (add-hook 'scala-mode-hook 'scala-turnoff-indent-tabs-mode)

;; (add-hook 'scala-mode-hook
;;   (lambda ()
;;     (font-lock-add-keywords nil
;;       '(("^[^\n]\\{100\\}\\(.*\\)$" 1 font-lock-warning-face t)))))

;; Load the ensime lisp code...
(add-to-list 'load-path "/home/whilton/emacs/ensime_2.9.2-0.9.8.8/elisp/")
(require 'ensime)

;; This step causes the ensime-mode to be started whenever
;; scala-mode is started for a buffer. You may have to customize this step
;; if you're not using the standard scala mode.
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)

;; MINI HOWTO: 
;; Open .scala file. M-x ensime (once per project)






;; javascript
(add-to-list 'load-path "/home/whilton/emacs/javascript")
(add-to-list 'auto-mode-alist '("\\.js\\'" . javascript-mode))
(autoload 'javascript-mode "javascript" nil t)



;; erlang
(setq load-path (cons  "/usr/local/lib/erlang/lib/tools-2.6.6.1/emacs"
      load-path))
(setq erlang-root-dir "/usr/local/lib/erlang")
(setq exec-path (cons "/usr/local/lib/erlang/bin" exec-path))
(require 'erlang-start)


;; nxhtml
(load "/home/whilton/emacs/nxhtml/autostart.el")
;;(add-to-list 'auto-mode-alist '("\\.js\\'" . javascript-mode))


;; YASNIPPIT
;;(add-to-list 'load-path "/usr/local/share/emacs/site-lisp/yasnippet-0.5.7")
;;(require 'yasnippet)
;;(yas/initialize)
;;(yas/load-directory "/usr/local/share/emacs/site-lisp/yasnippet-0.5.7")

;;(require 'grails-mode)
;;(setq grails-mode t)
;;(setq project-mode t)
;;(add-to-list 'auto-mode-alist '("\.gsp$" . nxml-mode)) ; Use whatever mode you want for views.
;;(project-load-all) ; Loads all saved projects. Recommended, but not required.


;; some functions

(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell (replace-regexp-in-string
                          "[ \t\n]*$"
                          ""
                          (shell-command-to-string "$SHELL --login -i -c 'echo $PATH'"))))
    (setenv "PATH" path-from-shell)
    (setq eshell-path-env path-from-shell) ; for eshell users
    (setq exec-path (split-string path-from-shell path-separator))))

(if window-system (set-exec-path-from-shell-PATH))

;; -- setup up wide screen follow mode
(defun all-over-the-screen ()
  (interactive)
  (delete-other-windows)
  (split-window-horizontally)
  (split-window-horizontally)
  (balance-windows)
  (follow-mode t))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(eclim-eclipse-dirs '("~/install/eclipse/eclipse"))
 '(column-number-mode t)
 '(menu-bar-mode nil))

;;(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
;; '(default ((t (:inherit nil :stipple nil :background "darkslategrey" :foreground "AntiqueWhite" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 300 :width normal :foundry "unknown" :family "DejaVu Sans Mono")))))

;; font
;;(set-default-font "Inconsolata-11")
(set-face-attribute 'default nil :family "Inconsolata" :height 92)

;; allow for export=>beamer by placing

;; #+LaTeX_CLASS: beamer in org files
(unless (boundp 'org-export-latex-classes)
  (setq org-export-latex-classes nil))


(add-to-list 'org-export-latex-classes
  ;; beamer class, for presentations
  '("beamer"
     "\\documentclass[11pt]{beamer}\n
      \\mode<{{{beamermode}}}>\n
      \\usetheme{{{{beamertheme}}}}\n
      \\usecolortheme{{{{beamercolortheme}}}}\n
      \\beamertemplateballitem\n
      \\setbeameroption{show notes}
      \\usepackage[utf8]{inputenc}\n
      \\usepackage[T1]{fontenc}\n
      \\usepackage{hyperref}\n
      \\usepackage{color}
      \\usepackage{listings}
      \\lstset{numbers=none,language=[ISO]C++,tabsize=4,
  frame=single,
  basicstyle=\\small,
  showspaces=false,showstringspaces=false,
  showtabs=false,
  keywordstyle=\\color{blue}\\bfseries,
  commentstyle=\\color{red},
  }\n
      \\usepackage{verbatim}\n
      \\institute{{{{beamerinstitute}}}}\n          
       \\subject{{{{beamersubject}}}}\n"

     ("\\section{%s}" . "\\section*{%s}")
     
     ("\\begin{frame}[fragile]\\frametitle{%s}"
       "\\end{frame}"
       "\\begin{frame}[fragile]\\frametitle{%s}"
       "\\end{frame}")))

  ;; letter class, for formal letters

 (add-to-list 'org-export-latex-classes

 '("letter"
     "\\documentclass[11pt]{letter}\n
      \\usepackage[utf8]{inputenc}\n
      \\usepackage[T1]{fontenc}\n
      \\usepackage{color}"
     
     ("\\section{%s}" . "\\section*{%s}")
     ("\\subsection{%s}" . "\\subsection*{%s}")
     ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
     ("\\paragraph{%s}" . "\\paragraph*{%s}")
     ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
(put 'narrow-to-region 'disabled nil)

;;(load-file (let ((coding-system-for-read 'utf-8))
;;                (shell-command-to-string "agda-mode locate")))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(agda2-highlight-datatype-face ((t (:foreground "cyan"))))
 '(agda2-highlight-primitive-type-face ((t (:foreground "deep sky blue")))))
