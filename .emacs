(add-to-list 'load-path "~/.emacs.d/plugins/popup")
(require 'popup)

(defalias 'perl-mode 'cperl-mode)

;; turn autoindenting on
(global-set-key "\r" 'newline-and-indent)

;; dash
(add-to-list 'load-path "~/.emacs.d/plugins/dash")

;; color
(add-to-list 'custom-theme-load-path "~/.emacs.d/plugins/emacs-color-theme-solarized")
(add-to-list 'load-path "~/.emacs.d/plugins/emacs-color-theme-solarized")
(load-theme 'solarized-dark t)
;(load-theme 'solarized-light t)


;; use 4 space indents via cperl mode
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#2d3743" "#ff4242" "#74af68" "#dbdb95" "#34cae2" "#008b8b" "#00ede1" "#e1e1e0"])
 '(compilation-message-face (quote default))
 '(cperl-close-paren-offset -4)
 '(cperl-continued-statement-offset 4)
 '(cperl-indent-level 4)
 '(cperl-indent-parens-as-block t)
 '(cperl-tab-always-indent t)
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#839496")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-safe-themes
   (quote
    ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(fci-rule-color "#073642")
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-symbol-colors
   (--map
    (solarized-color-blend it "#002b36" 0.25)
    (quote
     ("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2"))))
 '(highlight-symbol-foreground-color "#93a1a1")
 '(highlight-tail-colors
   (quote
    (("#073642" . 0)
     ("#546E00" . 20)
     ("#00736F" . 30)
     ("#00629D" . 50)
     ("#7B6000" . 60)
     ("#8B2C02" . 70)
     ("#93115C" . 85)
     ("#073642" . 100))))
 '(hl-bg-colors
   (quote
    ("#7B6000" "#8B2C02" "#990A1B" "#93115C" "#3F4D91" "#00629D" "#00736F" "#546E00")))
 '(hl-fg-colors
   (quote
    ("#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36")))
 '(magit-diff-use-overlays nil)
 '(nrepl-message-colors
   (quote
    ("#dc322f" "#cb4b16" "#b58900" "#546E00" "#B4C342" "#00629D" "#2aa198" "#d33682" "#6c71c4")))
 '(pos-tip-background-color "#073642")
 '(pos-tip-foreground-color "#93a1a1")
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#073642" 0.2))
 '(term-default-bg-color "#002b36")
 '(term-default-fg-color "#839496")
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#dc322f")
     (40 . "#e47200")
     (60 . "#e4ab00")
     (80 . "#b58900")
     (100 . "#e4e400")
     (120 . "#e4e400")
     (140 . "#e4e400")
     (160 . "#e4e400")
     (180 . "#859900")
     (200 . "#98e44c")
     (220 . "#72e472")
     (240 . "#4ce498")
     (260 . "#26e4be")
     (280 . "#2aa198")
     (300 . "#00e4e4")
     (320 . "#00e4e4")
     (340 . "#00e4e4")
     (360 . "#268bd2"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (quote
    (unspecified "#002b36" "#073642" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#839496" "#657b83")))
 '(xterm-color-names
   ["#073642" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#eee8d5"])
 '(xterm-color-names-bright
   ["#002b36" "#cb4b16" "#586e75" "#657b83" "#839496" "#6c71c4" "#93a1a1" "#fdf6e3"]))


(setq inhibit-startup-message t)
;; insert spaces instead of tabs
(setq-default indent-tabs-mode nil)

;; set line width to 78 columns
(setq fill-column 78)
(setq auto-fill-mode t)

;; use % to match various kinds of brackets
(global-set-key "%" 'match-paren)
(defun match-paren (arg)
  "Go to the matching paren if on a paren; otherwise insert %."
  (interactive "p")
  (let ((prev-char (char-to-string (preceding-char)))
	(next-char (char-to-string (following-char))))
    (cond ((string-match "[[{(<]" next-char) (forward-sexp 1))
	  ((string-match "[\]})>]" prev-char) (backward-sexp 1))
	  (t (self-insert-command (or arg 1))))))

;; Load an application template in a new unattached buffer
;(defun application-template-pl ()
;  "Inserts the standard Perl application template"; For help and info.
;  (interactive "*")                               ; Make this user accessible
;  (switch-to-buffer "application-template-pl")
;  (insert-file "~/.code_templates/perl_application.pl"))

;; set to a specific key combination
;(global-set-key "\C-ca" 'application-template-pl)

;; Load a module template in a new unattached buffer
;(defun module-template-pm ()
;  "Inserts the standard Perl module template" ; For help and info.
;  (interactive "*")                           ; Make this user accessible
;  (switch-to-buffer "module-template-pm")
;  (insert-file "~/.code_templates/perl_module.pm"))
;; set to a specific key combination
;(global-set-key "\C-cm" 'module-template-pm)

;; Expand the following abbreviations while typing in text files
(abbrev-mode 1)

;(define-abbrev-table 'global-abbrev-table '(
;    ("pdbg"   "use Data::Dumper qw( Dumper );\nwarn Dumper[];" nil 1)
;    ("phbp"   "#! /usr/bin/perl -w"                            nil 1)
;    ("pbmk"   "use Benchmark qw( cmpthese );\ncmpthese -10, {};" nil 1)
;    ("pusc"   "use Smart::Comments;\n\n### "                     nil 1)
;    ("putm"   "use Test::More 'no_plan';"                        nil 1)
;    ))

(add-hook 'text-mode-hook (lambda () abbrev-mode 1))

; yasnippet config
(add-to-list 'load-path
              "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet)
(yas-global-mode 1)
					     
; async
(add-to-list 'load-path "~/.emacs.d/plugins/async")
; helm
(add-to-list 'load-path "~/.emacs.d/plugins/helm")
(require 'helm-config)

(setq initial-scratch-message (concat initial-scratch-message
";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;\n;; This Emacs is Powered by `HELM' using\n;; emacs program \"emacs\".\n;; This is a minimal `helm' configuration to discover `helm' or debug it.\n;; You can retrieve this minimal configuration in \"/tmp/helm-cfg.el\" \n;; Some originals emacs commands have been replaced by own `helm' commands:\n\n;; - `find-file'(C-x C-f)           =>`helm-find-files'\n;; - `occur'(M-s o)                 =>`helm-occur'\n;; - `list-buffers'(C-x C-b)        =>`helm-buffers-list'\n;; - `completion-at-point'(M-tab)   =>`helm-lisp-completion-at-point'[1]\n;; - `dabbrev-expand'(M-/)          =>`helm-dabbrev'\n\n;; Some others native emacs commands are \"helmized\" by `helm-mode'.\n;; [1] Coming with emacs-24.4 `completion-at-point' is \"helmized\" by `helm-mode'\n;; which provide helm completion in many other places like `shell-mode'.\n;; You will find embeded help for most helm commands with `C-c ?'.\n;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;\n\n"))

(setq package-load-list '((helm-core t) (helm t) (async t)))
(package-initialize)
(add-to-list 'load-path (file-name-directory (file-truename "emacs-helm.sh")))
(setq default-frame-alist '((vertical-scroll-bars . nil)
                            (tool-bar-lines . 0)
                            (menu-bar-lines . 0)
                            (fullscreen . nil)))
(blink-cursor-mode -1)
(require 'helm-config)
(helm-mode 1)
(define-key global-map [remap find-file] 'helm-find-files)
(define-key global-map [remap occur] 'helm-occur)
(define-key global-map [remap list-buffers] 'helm-buffers-list)
(define-key global-map [remap dabbrev-expand] 'helm-dabbrev)
(global-set-key (kbd "M-x") 'helm-M-x)
;(unless (boundp 'completion-in-region-function)
;  (define-key lisp-interaction-mode-map [remap completion-at-point] 'helm-lisp-completion-at-point)
;  (define-key emacs-lisp-mode-map       [remap completion-at-point] 'helm-lisp-completion-at-point))
;(add-hook 'kill-emacs-hook #'(lambda () (and (file-exists-p "/tmp/helm-cfg.el") (delete-file "/tmp/helm-cfg.el"))))
(display-time)



(add-to-list 'load-path "~/.emacs.d/plugins/auto-complete")
(require 'auto-complete-config)
(ac-config-default)
(global-set-key (kbd "C-c C-a")
                'auto-complete-mode)


(show-paren-mode t)


;; multiple-cursors
(add-to-list 'load-path "~/.emacs.d/plugins/multiple-cursors")
(require 'multiple-cursors)
(global-set-key (kbd "C-S-a C-S-a") 'mc/edit-beginnings-of-lines)
(global-set-key (kbd "C-S-e C-S-e") 'mc/edit-ends-of-lines)

(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
(global-set-key (kbd "C-c C-/") 'mc/skip-to-next-like-this)

;; indent format
(defun indent-buffer ()
  "Indent the whole buffer."
  (interactive)
  (save-excursion
    (indent-region (point-min) (point-max) nil)))
(global-set-key [f7] 'indent-buffer)

(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on t)

(global-set-key [f8] 'rename-buffer)
(global-set-key [f9] 'shell)

;; tt
(add-to-list 'load-path "~/.emacs.d/plugins/tt")
(require 'tt-mode)

;; smex
(add-to-list 'load-path "~/.emacs.d/plugins/smex")
(require 'smex)
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

(global-set-key (kbd "C-c C-c C-f") 'flymake-mode)    ; fly-make

(setq package-enable-at-startup nil)

(if (daemonp)
    (add-hook 'after-make-frame-functions
              (lambda (frame)
                 (select-frame frame)
                (load-theme 'solarized-dark t)))
  (load-theme 'solarized-dark t))

(setq x-alt-keysym 'meta)

;(global-set-key (kbd "C-c TAB") 'ido-mode)
