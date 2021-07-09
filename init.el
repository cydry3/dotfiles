(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (tango-dark)))
 '(global-display-line-numbers-mode t)
 '(package-selected-packages
   (quote
    (crystal-mode twittering-mode emmet-mode web-mode mozc)))
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

(setq eww-search-prefix "https://www.google.co.jp/search?q=")

(require 'twittering-mode)
(setq twittering-use-master-password t)

(global-display-line-numbers-mode)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono" :foundry "PfEd" :slant normal :weight normal :height 128 :width normal)))))

(setq-default indent-tabs-mode nil)

(add-hook 'makefile-mode-hook
          (lambda (setq indent-tabs-mode t)))

;;(autoload 'crystal-mode "crystal-mode" "Major mode for crystal files" t)
;;(add-to-list 'auto-mode-alist '("\\.cr$" . crystal-mode))
;;(add-to-list 'interpreter-mode-alist '("crystal" . crystal-mode))
