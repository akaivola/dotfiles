;; Place your bindings here.

(evil-leader/set-leader ",")

(evil-leader/set-key
  "fs" 'paredit-forward-slurp-sexp
  "bs" 'paredit-backward-slurp-sexp
  "fb" 'paredit-forward-barf-sexp
  "bb" 'paredit-backward-barf-sexp)

(evil-leader/set-key
  "er" 'slime-eval-region)

(evil-leader/set-key
  "ag" 'anything-git-files
  "gg" 'helm-git-grep
  "gp" 'helm-git-grep-at-point
  "go" 'helm-occur-from-isearch)

;; EasyMotion.vim analogue
(evil-leader/set-key
  "," 'ace-jump-mode)

(evil-leader/set-key-for-mode 'coffee-mode
  "<" 'coffee-indent-shift-left
  ">" 'coffee-indent-shift-right
  "r" 'coffee-send-region)
