(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

(custom-set-variables
 '(custom-enabled-themes (quote (tango-dark)))
 '(global-display-line-numbers-mode t)
 '(package-selected-packages (quote (twittering-mode emmet-mode web-mode mozc)))
 '(tool-bar-mode nil))

(tool-bar-mode -1)
(setq inhibit-startup-message t
      shr-color-visible-luminance-min 70)

(setq backup-inhibited t
      make-backup-files nil
      auto-save-default nil)

(prefer-coding-system 'utf-8)
(setq default-input-method "japanese-mozc")
(set-fontset-font t 'japanese-jisx0208 "IPAGothic")

(defun insert-current-date () (interactive)
  (insert (shell-command-to-string "echo -n $(date)")))

(setq eww-search-prefix "https://www.google.co.jp/search?q=")

(require 'twittering-mode)
(setq twittering-use-master-password t)

(global-display-line-numbers-mode)
(custom-set-faces
 '(default ((t (:family "DejaVu Sans Mono" :foundry "PfEd" :slant normal :weight normal :height 128 :width normal)))))

(setq-default indent-tabs-mode nil)

