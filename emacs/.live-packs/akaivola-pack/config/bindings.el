;; Place your bindings here.

;; For example:
;;(define-key global-map (kbd "C-+") 'text-scale-increase)
;;(define-key global-map (kbd "C--") 'text-scale-decrease)

(evil-leader/set-leader ",")

(evil-leader/set-key

  "fs" 'paredit-forward-slurp-sexp
  "bs" 'paredit-backward-slurp-sexp
  "fb" 'paredit-forward-barf-sexp
  "bb" 'paredit-backward-barf-sexp)
