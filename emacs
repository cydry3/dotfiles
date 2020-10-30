
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(require 'mozc)
(setq default-input-method "japanese-mozc")

(setq inhibit-startup-message t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (tango-dark)))
 '(initial-buffer-choice nil)
 '(package-selected-packages
   (quote
    (twittering-mode xah-lookup company-c-headers company-fuzzy auto-complete buffer-move company hy-mode auto-save-buffers-enhanced)))
 '(tool-bar-mode nil))
(setq c-mode-hook '(lambda ()(gtags-mode 1)))
(setq c++-mode-hook '(lambda ()(gtags-mode 1)))

;; For copying 1 line.
(defun copy-line (arg)
  "Copy lines (as many as prefix argument) in  the kill ring"
  (interactive "p")
  (kill-ring-save (line-beginning-position)
		  (line-beginning-position (+ 1 arg)))
  (message "%d line%s copied" arg (if (= 1 arg) "" "s")))

(defun copy-one-line ()
  "Copy 1 line simply"
  (copy-line 0))

(global-set-key "\C-c\C-k" 'copy-line)
;;


(require 'auto-save-buffers-enhanced)
(auto-save-buffers-enhanced t)
(setq auto-save-buffers-enhanced-inteval 1)
(setq auto-save-buffers-enhanced-quiet-save-p t)

(setq make-backup-files nil)
(setq auto-save-list-file-prefix nil)

(add-hook 'prog-mode-hook 'linum-mode)

(set-fontset-font t 'japanese-jisx0208 "IPAGothic")

(require 'company)
(global-company-mode)

(require 'xah-lookup)
(require 'eww)
(put 'xah-lookup-word-definition 'xah-lookup-url
"http://ejje.weblio.jp/content/word02051")
(put 'xah-lookup-word-definition 'xah-lookup-browser-function 'eww)


(defun insert-current-date () (interactive)
  (insert (shell-command-to-string "echo -n $(date)")))
