;; -*- modle is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(react
     helm
     csv
     yaml
     javascript
     sql
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     ;; auto-completion
     ;; better-defaults
     themes-megapack
     emacs-lisp
     auto-completion
     html
     clojure
     git
     markdown
     restclient
     ;; org
     ;; (shell :variables
     ;;        shell-default-height 30
     ;;        shell-default-position 'bottom)
     ;; syntax-checking
     version-control
     org
     lsp
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages
   '(
     inf-clojure
     dash ; Emacs modern list api
     dash-functional ; Emacs modern list api functional
     paredit
     switch-window
     dash-at-point
     isend-mode
     lua-mode
     jsx-mode
     ace-jump-mode
     key-chord
     beacon ;; blinky cursor
     ripgrep
     neotree
     helm-rg
     )
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages
   '(
     helm-gitignore
     )
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'
   dotspacemacs-delete-orphan-packages t
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non-nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t

   ;; Maximum allowed time in seconds to contact an ELPA repository.
   ;; (default 5)
   dotspacemacs-elpa-timeout 5

   ;; Set `gc-cons-threshold' and `gc-cons-percentage' when startup finishes.
   ;; This is an advanced option and should not be changed unless you suspect
   ;; performance issues due to garbage collection operations.
   ;; (default '(100000000 0.1))
   dotspacemacs-gc-cons '(100000000 0.1)

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; latest version of packages from MELPA. (default nil)
   dotspacemacs-use-spacelpa nil

   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default nil)
   dotspacemacs-verify-spacelpa-archives nil

   ;; If non-nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil

   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'. (default 'emacs-version)
   dotspacemacs-elpa-subdirectory 'emacs-version

   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer.
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed.
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'.
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))

   ;; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(sanityinc-tomorrow-bright
                         sanityinc-tomorrow-eighties
                         sanityinc-tomorrow-night)
   ;; If non nil the cursor color matches the state color.
   dotspacemacs-colorize-cursor-according-to-state nil
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 18
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar nil
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native t
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers t
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil advises quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   dotspacemacs-search-tools '("rg" "pt" "ag" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup 'trailing
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  )

(defun dotspacemacs/user-config ()
  "Configuration function.
 This function is called at the very end of Spacemacs initialization after
layers configuration."
  ;; unset LEIN_JAVA_CMD because somehow, somewhere it is assumed we have drip installed. We do not and I can't find where the thing is set.
  (setenv "LEIN_JAVA_CMD" nil)

  ;; Exit insert mode by pressing jj
  (setq key-chord-two-keys-delay 0.5)
  (key-chord-define evil-insert-state-map "jj" 'evil-normal-state)
  (key-chord-mode 1)

  (define-key evil-insert-state-map (kbd "§") 'evil-escape)

  ; vars
  (setq clojure-enable-fancify-symbols t)
  (setq whitespace-action '(auto-cleanup))

  ;; Fuck the tab
  (setq default-tab-width 2)
  (setq tab-width 2)
  (setq js-indent-level 2)
  (setq-default indent-tabs-mode nil)
  (setq-default tab-width tab-width)
  (setq-default evil-shift-width tab-width)
  (defvaralias 'c-basic-offset 'tab-width)
  (defvaralias 'cperl-indent-level 'tab-width)

  ; evil-mode
  ;; Move point up and down and horizontally just as in Vim
  (define-key evil-normal-state-map (kbd "<remap> <evil-next-line>") 'evil-next-visual-line)
  (define-key evil-normal-state-map (kbd "<remap> <evil-previous-line>") 'evil-previous-visual-line)
  (define-key evil-motion-state-map (kbd "<remap> <evil-next-line>") 'evil-next-visual-line)
  (define-key evil-motion-state-map (kbd "<remap> <evil-previous-line>") 'evil-previous-visual-line)
  ; Make horizontal movement cross lines
  (setq-default evil-cross-lines t)

  ; Disable evil mode for the modes
  (add-to-list 'evil-emacs-state-modes 'shell-mode)

  (spacemacs/declare-prefix ",f" "Paredit forward")
  (spacemacs/declare-prefix ",b" "Paredit backward")
  (spacemacs/declare-prefix ",w" "Paredit wrap")
  (spacemacs/declare-prefix ",t" "Paredit transpose")
  (spacemacs/declare-prefix ",s" "Paredit splice")

  (spacemacs/set-leader-keys
    ",j" 'ace-jump-char-mode)

  (spacemacs/set-leader-keys
    ",fs" 'paredit-forward-slurp-sexp
    ",bs" 'paredit-backward-slurp-sexp
    ",fb" 'paredit-forward-barf-sexp
    ",bb" 'paredit-backward-barf-sexp
    ",wr" 'paredit-wrap-round
    ",ts" 'transpose-sexps
    ",sp" 'paredit-splice-sexp)

  (spacemacs/set-leader-keys
    "c" 'projectile-commander)

  (spacemacs/set-leader-keys
    "d"  'dash-at-point
    "gg" 'helm-git-grep
    "gp" 'helm-git-grep-at-point
    "go" 'helm-occur-from-isearch)

  (defun save-and-eval-buffer ()
    "Saves buffer and evaluates it"
    (interactive)
    (save-buffer)
    (cider-eval-buffer))

  (spacemacs/set-leader-keys-for-major-mode 'clojure-mode
    "kt" 'clojure-toggle-keyword-string
    "eb" 'save-and-eval-buffer)

  (evil-leader/set-key
    "sw" 'switch-window)

  (evil-leader/set-key
    "n" 'neotree-find)

  (evil-leader/set-key
    "kr" 'helm-show-kill-ring)

  (setq nrepl-popup-stacktraces nil)
  (setq cider-repl-history-file "/tmp/cider.history")
  (setq cider-prompt-for-project-on-connect nil)
  (setq cider-auto-select-error-buffer nil)
  (setq nrepl-auto-select-error-buffer nil)

  (setq clojure-enable-fancify-symbols nil)
  (setq global-prettify-symbols-mode nil)

  (define-key global-map "\M-v" 'yank)


  (add-hook 'prog-mode-hook
            'enable-paredit-mode
            t)

  (add-hook 'emacs-lisp-mode-hook
            'rainbow-delimiters-mode
            t)

  ;; Clojure
  (add-hook 'clojure-mode-hook
            'rainbow-delimiters-mode
            t)

  (add-hook 'clojure-mode-hook
            (lambda ()
              (define-clojure-indent
                ;(defroutes 'defun)
                (GET 2)
                (POST 2)
                (PUT 2)
                (DELETE 2)
                (HEAD 2)
                (ANY 2)
                (context 2)
                (it 2)
                (describe 2)
                (-> 120)
                (->> 94)
                (cond-> 2)
                (some-> 5)
                (some->> 6)
                (defschema 2)
                ;(match 7)
                ))
            t)

  (add-hook 'clojurescript-mode-hook
            (lambda ()
              (setq dash-at-point-docset "clojurescript")))

  ;; Sqli mode
  (add-hook 'sql-interactive-mode-hook
            (lambda ()
              (toggle-truncate-lines t)))

  (add-hook 'neotree-mode-hook
            (lambda ()
              (dolist (custom-key-binding (list '("TAB" 'neotree-enter)
                                                '("SPC" 'neotree-enter)
                                                '("q"   'neotree-hide)
                                                '("RET" 'neotree-enter)
                                                '("c"   'neotree-create-node)
                                                '("d"   'neotree-delete-node)
                                                '("r"   'neotree-change-root)))
                (define-key evil-normal-state-local-map
                  (kbd (car custom-key-binding))
                  (cadr custom-key-binding)))))

  (add-hook 'paredit-mode-hook
            (lambda ()

              ;; prevent paredit from adding a space before opening paren in certain modes
              (defun cs/mode-space-delimiter-p (endp delimiter)
                "Don't insert a space before delimiters in certain modes"
                (or
                 (bound-and-true-p js2-mode)
                 (bound-and-true-p js-mode)
                 (bound-and-true-p javascript-mode)))
              (add-to-list 'paredit-space-for-delimiter-predicates #'cs/mode-space-delimiter-p)

              (define-key paredit-mode-map (kbd "S-C-k") 'paredit-copy-as-kill)
              (define-key paredit-mode-map (kbd "C-k")   'paredit-kill)
              (define-key paredit-mode-map (kbd "M-r")   'paredit-raise-sexp)))

  (add-hook 'js-mode
            (lambda ()
              (spacemacs/set-leader-keys
                ",fs" 'sp-slurp-hybrid-sexp
                ",bs" 'sp
                ",fb" 'paredit-forward-barf-sexp
                ",bb" 'paredit-backward-barf-sexp
                ",wr" 'paredit-wrap-round
                ",ts" 'sp-transpose-hybrid-sexp
                ",sp" 'sp-splice-sexp)

              (dolist (js-mode-bindings (list '("c-k" js2r-kill)))
                (define-key js-mode-map
                  (kbd (car js-mode-bindings))
                  (cadr js-mode-bindings)))))

  ;; cider config
  (add-hook 'cider-repl-mode-hook 'subword-mode)
  (add-hook 'cider-repl-mode-hook 'rainbow-delimiters-mode)
  ;; unverified
  (add-hook 'cider-repl-mode-hook
            (lambda ()
              (spacemacs/set-leader-keys
                ",sC" 'cider-repl-clear-buffer)))

  ;; org-mode
  (require 'ob-python)
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((python . t)
     (clojure . t)
     (js . t)))
)

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ahs-case-fold-search nil)
 '(ahs-default-range (quote ahs-range-whole-buffer))
 '(ahs-idle-interval 0.25)
 '(ahs-idle-timer 0 t)
 '(ahs-inhibit-face-list nil)
 '(cider-auto-select-error-buffer nil)
 '(cider-dynamic-indentation nil)
 '(cider-known-endpoints nil)
 '(cider-repl-use-pretty-printing t)
 '(cider-show-error-buffer nil)
 '(clojure-align-binding-forms
   (quote
    ("let" "when-let" "when-some" "if-let" "if-some" "binding" "loop" "doseq" "for" "with-open" "with-local-vars" "with-redefs" "go-loop")))
 '(clojure-align-forms-automatically t)
 '(clojure-defun-indents (quote (defschema)))
 '(clojure-docstring-fill-column 80)
 '(clojure-indent-style :always-align)
 '(clojure-use-backtracking-indent t)
 '(css-indent-offset 2)
 '(js-indent-level 2 t)
 '(js2-missing-semi-one-line-override t)
 '(js2-mode-assume-strict t)
 '(js2-strict-missing-semi-warning nil)
 '(nrepl-connected-hook
   (quote
    (cljr--init-middleware cider-display-connected-message paredit-mode)))
 '(package-selected-packages
   (quote
    (projectile-ripgrep helm-rg lv transient json-snatcher json-reformat parent-mode fringe-helper git-gutter+ git-gutter flx treepy graphql anzu web-completion-data edn peg eval-sexp-fu sesman pkg-info popup csv-mode seq cider-spy inf-clojure discover-clj-refactor helm-cider beacon ac-js2 edit-indirect ssass-mode vue-html-mode vue-mode white-sand-theme rebecca-theme org-mime exotica-theme ghub let-alist queue pythonic dash-functional goto-chg epl org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-download htmlize gnuplot winum solarized-theme restclient-helm ob-restclient madhat2r-theme fuzzy company-restclient know-your-http-well diminish paredit f s powerline org markdown-mode projectile autothemer hydra inflections cider spinner clojure-mode bind-key packed auto-complete avy anaconda-mode tern company iedit smartparens bind-map highlight evil helm helm-core yasnippet multiple-cursors skewer-mode js2-mode simple-httpd magit magit-popup git-commit with-editor async dash haml-mode yaml-mode key-chord zonokai-theme zenburn-theme zen-and-art-theme yapfify ws-butler window-numbering which-key web-mode web-beautify volatile-highlights vi-tilde-fringe uuidgen use-package underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme tronesque-theme toxi-theme toc-org tao-theme tangotango-theme tango-plus-theme tango-2-theme tagedit switch-window sunny-day-theme sublime-themes subatomic256-theme subatomic-theme sql-indent spacemacs-theme spaceline spacegray-theme soothe-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme smeargle slim-mode seti-theme scss-mode sass-mode reverse-theme restclient restart-emacs request rainbow-delimiters railscasts-theme quelpa pyvenv pytest pyenv-mode py-isort purple-haze-theme pug-mode professional-theme popwin planet-theme pip-requirements phoenix-dark-pink-theme phoenix-dark-mono-theme persp-mode pcre2el pastels-on-dark-theme paradox orgit organic-green-theme org-plus-contrib org-bullets open-junk-file omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme ob-http noctilux-theme niflheim-theme neotree naquadah-theme mustang-theme move-text monokai-theme monochrome-theme molokai-theme moe-theme mmm-mode minimal-theme material-theme markdown-toc majapahit-theme magit-gitflow macrostep lush-theme lua-mode lorem-ipsum livid-mode live-py-mode linum-relative link-hint light-soap-theme less-css-mode jsx-mode json-mode js2-refactor js-doc jbeans-theme jazz-theme isend-mode ir-black-theme inkpot-theme info+ indent-guide ido-vertical-mode hy-mode hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation hide-comnt heroku-theme hemisu-theme help-fns+ helm-themes helm-swoop helm-pydoc helm-pt helm-projectile helm-mode-manager helm-make helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag hc-zenburn-theme gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme google-translate golden-ratio gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe git-gutter-fringe+ gh-md gandalf-theme flx-ido flatui-theme flatland-theme firebelly-theme fill-column-indicator farmhouse-theme fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu espresso-theme emmet-mode elisp-slime-nav dumb-jump dracula-theme django-theme diff-hl define-word dash-at-point darktooth-theme darkokai-theme darkmine-theme darkburn-theme dakrone-theme cython-mode cyberpunk-theme company-web company-tern company-statistics company-anaconda column-enforce-mode color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized coffee-mode clues-theme clojure-snippets clj-refactor clean-aindent-mode cider-eval-sexp-fu cherry-blossom-theme busybee-theme bubbleberry-theme birds-of-paradise-plus-theme badwolf-theme auto-yasnippet auto-highlight-symbol auto-compile apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes aggressive-indent afternoon-theme adaptive-wrap ace-window ace-link ace-jump-mode ace-jump-helm-line ac-ispell)))
 '(ring-bell-function (quote ignore))
 '(standard-indent 2))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ahs-case-fold-search nil)
 '(ahs-default-range 'ahs-range-whole-buffer)
 '(ahs-idle-interval 0.25)
 '(ahs-idle-timer 0 t)
 '(ahs-inhibit-face-list nil)
 '(cider-auto-jump-to-error nil)
 '(cider-auto-select-error-buffer nil)
 '(cider-completion-annotations-alist
   '(("class" "c")
     ("field" "fi")
     ("function" "f")
     ("import" "i")
     ("keyword" "k")
     ("local" "l")
     ("macro" "m")
     ("method" "me")
     ("namespace" "n")
     ("protocol" "p")
     ("protocol-function" "pf")
     ("record" "r")
     ("special-form" "s")
     ("static-field" "sf")
     ("static-method" "sm")
     ("type" "t")
     ("var" "v")))
 '(cider-dynamic-indentation nil)
 '(cider-edit-jack-in-command t)
 '(cider-known-endpoints nil)
 '(cider-print-fn 'zprint)
 '(cider-repl-use-pretty-printing t)
 '(cider-show-error-buffer nil)
 '(clojure-align-binding-forms
   '("let" "when-let" "when-some" "if-let" "if-some" "binding" "loop" "doseq" "for" "with-open" "with-local-vars" "with-redefs" "go-loop"))
 '(clojure-align-forms-automatically t)
 '(clojure-defun-indents '(defschema))
 '(clojure-docstring-fill-column 80)
 '(clojure-indent-style :always-align)
 '(clojure-use-backtracking-indent t)
 '(css-indent-offset 2)
 '(evil-want-Y-yank-to-eol nil)
 '(helm-pt-command "/usr/local/bin/pt")
 '(hl-todo-keyword-faces
   '(("TODO" . "#dc752f")
     ("NEXT" . "#dc752f")
     ("THEM" . "#2d9574")
     ("PROG" . "#4f97d7")
     ("OKAY" . "#4f97d7")
     ("DONT" . "#f2241f")
     ("FAIL" . "#f2241f")
     ("DONE" . "#86dc2f")
     ("NOTE" . "#b1951d")
     ("KLUDGE" . "#b1951d")
     ("HACK" . "#b1951d")
     ("TEMP" . "#b1951d")
     ("FIXME" . "#dc752f")
     ("XXX+" . "#dc752f")
     ("\\?\\?\\?+" . "#dc752f")))
 '(js-indent-level 2 t)
 '(js2-missing-semi-one-line-override t)
 '(js2-mode-assume-strict t)
 '(js2-strict-missing-semi-warning nil)
 '(lsp-clients-javascript-typescript-server "typescript-lanague-server")
 '(lsp-clients-typescript-javascript-server-args '(""))
 '(lsp-log-io t)
 '(nrepl-connected-hook
   '(cljr--init-middleware cider-display-connected-message paredit-mode))
 '(package-check-signature nil)
 '(package-selected-packages
   '(gnu-elpa-keyring-update flycheck-package dired-subtree eslint-fix ripgrep projectile-ripgrep helm-rg lv transient json-snatcher json-reformat parent-mode fringe-helper git-gutter+ git-gutter flx treepy graphql anzu web-completion-data edn peg eval-sexp-fu sesman pkg-info popup csv-mode seq cider-spy inf-clojure discover-clj-refactor helm-cider beacon ac-js2 edit-indirect ssass-mode vue-html-mode vue-mode white-sand-theme rebecca-theme org-mime exotica-theme ghub let-alist queue pythonic dash-functional goto-chg undo-tree epl ac-anaconda org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-download htmlize gnuplot winum solarized-theme restclient-helm ob-restclient madhat2r-theme fuzzy company-restclient know-your-http-well diminish paredit f s powerline org markdown-mode projectile autothemer hydra inflections cider spinner clojure-mode bind-key packed auto-complete avy anaconda-mode tern company iedit smartparens bind-map highlight evil helm helm-core yasnippet multiple-cursors skewer-mode js2-mode simple-httpd magit magit-popup git-commit with-editor async dash haml-mode yaml-mode key-chord zonokai-theme zenburn-theme zen-and-art-theme yapfify ws-butler window-numbering which-key web-mode web-beautify volatile-highlights vi-tilde-fringe uuidgen use-package underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme tronesque-theme toxi-theme toc-org tao-theme tangotango-theme tango-plus-theme tango-2-theme tagedit switch-window sunny-day-theme sublime-themes subatomic256-theme subatomic-theme sql-indent spacemacs-theme spaceline spacegray-theme soothe-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme smeargle slim-mode seti-theme scss-mode sass-mode reverse-theme restclient restart-emacs request rainbow-delimiters railscasts-theme quelpa pyvenv pytest pyenv-mode py-isort purple-haze-theme pug-mode professional-theme popwin planet-theme pip-requirements phoenix-dark-pink-theme phoenix-dark-mono-theme persp-mode pcre2el pastels-on-dark-theme paradox orgit organic-green-theme org-plus-contrib org-bullets open-junk-file omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme ob-http noctilux-theme niflheim-theme neotree naquadah-theme mustang-theme move-text monokai-theme monochrome-theme molokai-theme moe-theme mmm-mode minimal-theme material-theme markdown-toc majapahit-theme magit-gitflow macrostep lush-theme lua-mode lorem-ipsum livid-mode live-py-mode linum-relative link-hint light-soap-theme less-css-mode jsx-mode json-mode js2-refactor js-doc jbeans-theme jazz-theme isend-mode ir-black-theme inkpot-theme info+ indent-guide ido-vertical-mode hy-mode hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation hide-comnt heroku-theme hemisu-theme help-fns+ helm-themes helm-swoop helm-pydoc helm-pt helm-projectile helm-mode-manager helm-make helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag hc-zenburn-theme gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme google-translate golden-ratio gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe git-gutter-fringe+ gh-md gandalf-theme flx-ido flatui-theme flatland-theme firebelly-theme fill-column-indicator farmhouse-theme fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu espresso-theme emmet-mode elisp-slime-nav dumb-jump dracula-theme django-theme diff-hl define-word dash-at-point darktooth-theme darkokai-theme darkmine-theme darkburn-theme dakrone-theme cython-mode cyberpunk-theme company-web company-tern company-statistics company-anaconda column-enforce-mode color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized coffee-mode clues-theme clojure-snippets clj-refactor clean-aindent-mode cider-eval-sexp-fu cherry-blossom-theme busybee-theme bubbleberry-theme birds-of-paradise-plus-theme badwolf-theme auto-yasnippet auto-highlight-symbol auto-compile apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes aggressive-indent afternoon-theme adaptive-wrap ace-window ace-link ace-jump-mode ace-jump-helm-line ac-ispell))
 '(pdf-view-midnight-colors '("#b2b2b2" . "#292b2e"))
 '(ring-bell-function 'ignore)
 '(standard-indent 2))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
)
