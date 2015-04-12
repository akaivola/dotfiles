;; User pack init file
;;
;; Use this file to initiate the pack configuration.
;; See README for more information.

;; Load bindings config
(live-load-config-file "bindings.el")

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

;; Fuck the backup files in same directory
(setq backup-directory-alist
  `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
  `((".*" ,temporary-file-directory t)))


;; Fuck the tab using people
(setq tab-width 2)
(setq-default indent-tabs-mode nil)
(setq-default tab-width tab-width)
(setq-default evil-shift-width tab-width)
(defvaralias 'c-basic-offset 'tab-width)
(defvaralias 'cperl-indent-level 'tab-width)

;; global visual line break
(setq global-visual-line-mode 1)

;; Move point up and down and horizontally just as in Vim
(define-key evil-normal-state-map (kbd "<remap> <evil-next-line>") 'evil-next-visual-line)
(define-key evil-normal-state-map (kbd "<remap> <evil-previous-line>") 'evil-previous-visual-line)
(define-key evil-motion-state-map (kbd "<remap> <evil-next-line>") 'evil-next-visual-line)
(define-key evil-motion-state-map (kbd "<remap> <evil-previous-line>") 'evil-previous-visual-line)
; Make horizontal movement cross lines
(setq-default evil-cross-lines t)

;; Clojure config
(add-hook 'clojure-mode-hook 'turn-on-eldoc-mode)
(setq nrepl-popup-stacktraces nil)
(require 'auto-complete-config)
(setq ac-delay 0.0)
(setq ac-quick-help-delay 0.5)
(ac-config-default)

(require 'ac-nrepl)
(add-hook 'cider-repl-mode-hook #'company-mode)
(add-hook 'cider-mode-hook #'company-mode)
(add-hook 'cider-repl-mode-hook #'disable-paredit-mode)
(add-hook 'cider-mode-hook #'disable-paredit-mode)

(eval-after-load "cider"
  '(define-key cider-mode-map (kbd "C-c C-d") 'ac-nrepl-popup-doc))

(show-paren-mode 1)

;; cider config
(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)
(setq cider-repl-history-file "/tmp/cider.history")
(add-hook 'cider-repl-mode-hook 'smartparens-mode)
(add-hook 'cider-repl-mode-hook 'subword-mode)
(add-hook 'cider-repl-mode-hook 'rainbow-delimiters-mode)

;; Line numbering
(global-linum-mode t)

;; auto-complete
(global-auto-complete-mode t)

;; Auto cleanup whitespace
(setq whitespace-action '(auto-cleanup))

;; Hylang
(live-add-pack-lib "hy-mode")
(require 'hy-mode)
(add-hook 'hy-mode-hook 'paredit-mode)

;; Arduino mode
(live-add-pack-lib "arduino-mode")
(require 'arduino-mode)
(setq auto-mode-alist (cons '("\\.\\(pde\\|ino\\)$" . arduino-mode) auto-mode-alist))
(autoload 'arduino-mode "arduino-mode" "Arduino editing mode." t)

;; SLIME
(live-add-pack-lib "slime")
(require 'slime-autoloads)
(add-hook 'js2-mode-hook
  (lambda ()
    (slime-js-minor-mode 1)))
(setq slime-contribs '(slime-js))

;; Emacs-for-python
(live-add-pack-lib "emacs-for-python")
(require 'epy-setup)      ;; It will setup other loads, it is required!
(require 'epy-python)     ;; If you want the python facilities [optional]
(require 'epy-completion) ;; If you want the autocompletion settings [optional]
(require 'epy-editing)    ;; For configurations related to editing [optional]
(require 'epy-bindings)   ;; For my suggested keybindings [optional]
(epy-setup-checker "pyflakes %f")
(epy-setup-ipython)

(setq skeleton-pair nil) ;; fucking Emacs-for-python sets skeleton-pair to non nil

;; Coffeescript
(custom-set-variables '(coffee-tab-width 2))

;; Evil Mode
(define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)
(define-key evil-visual-state-map (kbd "C-u") 'evil-scroll-up)
(define-key evil-insert-state-map (kbd "C-u")
  (lambda ()
    (interactive)
    (evil-delete (point-at-bol) (point))))
