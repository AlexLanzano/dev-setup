;; Miscellaneous Settings
(setq make-backup-files nil)

;; Programming Settings
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4) ; Assuming you want your tabs to be four spaces wide
(electric-pair-mode 1)

;; Mouse Settings
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil)            ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't)                  ;; scroll window under mouse
(setq scroll-step 1)                                ;; keyboard scroll one line at a time
(setq mouse-yank-at-point t)
(xterm-mouse-mode 1)

;; Display Config
(setq inhibit-splash-screen t)
(setq initial-scratch-message "")

(set-face-attribute 'font-lock-builtin-face nil :foreground "#ff9999")
(set-face-attribute 'font-lock-comment-face nil :foreground "#ff0000")
(set-face-attribute 'font-lock-constant-face nil :foreground "#006fff")
(set-face-attribute 'font-lock-doc-face nil :foreground "#ff0000")
(set-face-attribute 'font-lock-function-name-face nil :foreground "#729fcf")
(set-face-attribute 'font-lock-keyword-face nil :foreground "#99ffff")
(set-face-attribute 'font-lock-string-face nil :foreground "#00ff00")
(set-face-attribute 'font-lock-type-face nil :foreground "#007a05")
(set-face-attribute 'font-lock-variable-name-face nil :foreground "#c4a000")
(set-face-attribute 'font-lock-warning-face nil :foreground "#ff0000")
(if (display-graphic-p)
	(set-face-attribute 'default nil :background "#2f3537")
	)
(set-face-attribute 'default nil :foreground "#ffffff")
(set-face-attribute 'mode-line nil :foreground "White" :background "#285577")
(set-face-bold-p 'bold nil)

(menu-bar-mode -1)
(tool-bar-mode -1)
(toggle-scroll-bar -1)

;; Custom Functions
(defun search-selection (beg end)
  (interactive "r")
  (kill-ring-save beg end)
  (isearch-mode t nil nil nil)
  (isearch-yank-pop)
)

(defun duplicate-line()
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
)

;; Key Bindings
(global-set-key (kbd "<C-left>") 'windmove-left)
(global-set-key (kbd "<C-right>") 'windmove-right)
(global-set-key (kbd "<C-up>") 'windmove-up)
(global-set-key (kbd "<C-down>") 'windmove-down)

(global-set-key	(kbd "M-i") 'previous-line)
(global-set-key	(kbd "M-j") 'backward-char)
(global-set-key	(kbd "M-k") 'next-line)
(global-set-key	(kbd "M-l") 'forward-char)

(global-set-key	(kbd "M-I") 'scroll-down-command)
(global-set-key	(kbd "M-J") 'backward-word)
(global-set-key	(kbd "M-K") 'scroll-up-command)
(global-set-key	(kbd "M-L") 'forward-word)

(global-set-key (kbd "C-c d") 'kill-whole-line)
(global-set-key (kbd "C-c s") 'search-selection)
(global-set-key (kbd "C-c a") 'duplicate-line)
