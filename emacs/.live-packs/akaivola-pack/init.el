;; User pack init file
;;
;; Use this file to initiate the pack configuration.
;; See README for more information.

;; Load bindings config
(live-load-config-file "bindings.el")

;; cider config
(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)
(setq cider-repl-history-file "/tmp/cider.history")
(add-hook 'cider-repl-mode-hook 'paredit-mode)
(add-hook 'cider-repl-mode-hook 'subword-mode)

;; Line numbering
(global-linum-mode t)

;; Hylang
(live-add-pack-lib "hy-mode")
(require 'hy-mode)
(add-hook 'hy-mode-hook 'paredit-mode)

;; Arduino mode
(live-add-pack-lib "arduino-mode")
(require 'arduino-mode)
(setq auto-mode-alist (cons '("\\.\\(pde\\|ino\\)$" . arduino-mode) auto-mode-alist))
(autoload 'arduino-mode "arduino-mode" "Arduino editing mode." t)

;; Emacs-for-python
(live-add-pack-lib "emacs-for-python")
(require 'epy-setup)      ;; It will setup other loads, it is required!
(require 'epy-python)     ;; If you want the python facilities [optional]
(require 'epy-completion) ;; If you want the autocompletion settings [optional]
(require 'epy-editing)    ;; For configurations related to editing [optional]
(require 'epy-bindings)   ;; For my suggested keybindings [optional]
(epy-setup-checker "pyflakes %f")
(epy-setup-ipython)
