;;;;
;; Clojure
;;;;

;; Enable paredit for Clojure
(add-hook 'clojure-mode-hook 'enable-paredit-mode)

;; This is useful for working with camel-case tokens, like names of
;; Java classes (e.g. JavaClassName)
(add-hook 'clojure-mode-hook 'subword-mode)

(add-hook 'clojure-mode-hook 'aggressive-indent-mode)

;; A little more syntax highlighting
(require 'clojure-mode-extra-font-locking)

;;;;
;; Cider
;;;;

;; go right to the REPL buffer when it's finished connecting
(setq cider-repl-pop-to-buffer-on-connect t)

;; When there's a cider error, show its buffer and switch to it
(setq cider-show-error-buffer t)
(setq cider-auto-select-error-buffer t)

;; Where to store the cider history.
(setq cider-repl-history-file "~/.emacs.d/cider-history")

;; Wrap when navigating history.
(setq cider-repl-wrap-history t)

;; enable paredit in your REPL
(add-hook 'cider-repl-mode-hook 'paredit-mode)


(put-clojure-indent 'attempt-all 1)
(put-clojure-indent 'thrown-with-type? 1)
;; Use clojure mode for other extensions
;; (add-to-list 'auto-mode-alist '("\\.edn$" . clojure-mode))
;; (add-to-list 'auto-mode-alist '("\\.boot$" . clojure-mode))
;; (add-to-list 'auto-mode-alist '("\\.cljs.*$" . clojure-mode))
;; (add-to-list 'auto-mode-alist '("lein-env" . enh-ruby-mode))


;; key bindings
;; these help me out with the way I usually develop web apps
;; (defun cider-start-http-server ()
  ;; (interactive)
  ;; (cider-load-current-buffer)
  ;; (let ((ns (cider-current-ns)))
    ;; (cider-repl-set-ns ns)
    ;; (cider-interactive-eval (format "(println '(def server (%s/start))) (println 'server)" ns))
    ;; (cider-interactive-eval (format "(def server (%s/start)) (println server)" ns))))


;; (defun cider-refresh ()
  ;; (interactive)
  ;; (cider-interactive-eval (format "(user/reset)")))

;; (defun cider-user-ns ()
  ;; (interactive)
  ;; (cider-repl-set-ns "user"))

;; (eval-after-load 'cider
  ;; '(progn
     ;; (define-key clojure-mode-map (kbd "C-c C-v") 'cider-start-http-server)
     ;; (define-key clojure-mode-map (kbd "C-M-r") 'cider-refresh)
     ;; (define-key clojure-mode-map (kbd "C-c u") 'cider-user-ns)
     ;; (define-key cider-mode-map (kbd "C-c u") 'cider-user-ns)))
