(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

;; Customizing with GUI.
(custom-set-variables
 '(custom-enabled-themes (quote (tango-dark)))
 '(package-selected-packages (quote (twittering-mode emmet-mode web-mode mozc))))
(custom-set-faces
 )

;; Presentation.
(tool-bar-mode -1)
(setq inhibit-startup-message t
      shr-color-visible-luminance-min 70)

;; Backup.
(setq backup-inhibited t
      make-backup-files nil
      auto-save-default nil)

;; Input method.
(prefer-coding-system 'utf-8)
;; Japanese Input method.
(setq default-input-method "japanese-mozc")
(set-fontset-font t 'japanese-jisx0208 "IPAGothic")

;; Tiny tool to insert a date time ( today ).
(defun insert-current-date () (interactive)
       (insert (shell-command-to-string "echo -n $(date)")))

;; React JS, ReactNative, Expo.
(add-to-list 'auto-mode-alist '("\\.html?$" .    web-mode))
(add-to-list 'auto-mode-alist '("\\.[jt]s[x]?$" . web-mode))
(add-hook 'web-mode-hook  'emmet-mode)
(add-hook 'web-mode-hook
          '(lambda ()
             (setq web-mode-attr-indent-offset nil)
             (setq web-mode-markup-indent-offset 2)
             (setq web-mode-css-indent-offset 2)
             (setq web-mode-code-indent-offset 2)
             (setq indent-tabs-mode nil)
             (setq tab-width 2)
	     (setq web-mode-enable-current-column-highlight t)
	     (setq web-mode-enable-auto-quoting nil)
             ))

;; Gatsby JS. (for a project)
(setq web-mode-content-types-alist
      '(
	("jsx" . "/path/to/root/of/mysite/.*\\.js[x]?\\'")
	))

;; Search engine for 'eww' (default: duckduckgo)
(setq eww-search-prefix "https://www.google.co.jp/search?q=")

;; Twitter on Emacs.
(require 'twittering-mode)
(setq twittering-use-master-password t)

