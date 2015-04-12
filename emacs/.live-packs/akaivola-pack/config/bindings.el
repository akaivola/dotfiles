;; Place your bindings here.

(evil-leader/set-leader ",")

(evil-leader/set-key
  "fs" 'paredit-forward-slurp-sexp
  "bs" 'paredit-backward-slurp-sexp
  "fb" 'paredit-forward-barf-sexp
  "bb" 'paredit-backward-barf-sexp
  "wr" 'paredit-wrap-round
  "ts" 'transpose-sexps
  "kt" 'clojure-toggle-keyword-string)

(evil-leader/set-key
  "er" 'slime-eval-region)

(evil-leader/set-key
  "c"  'projectile-commander
  "gg" 'helm-git-grep
  "gp" 'helm-git-grep-at-point
  "go" 'helm-occur-from-isearch)

(evil-leader/set-key
  "jv" 'cider-jump-to-var
  "jb" 'cider-jump-back
  "gg" 'cider-grimoire)

;; EasyMotion.vim analogue
(evil-leader/set-key
  "," 'ace-jump-mode)

(evil-leader/set-key-for-mode 'coffee-mode
  "<" 'coffee-indent-shift-left
  ">" 'coffee-indent-shift-right
  "cr" 'coffee-compile-region)
