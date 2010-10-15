;;; unreal.el --- unreal script miscs

;; Copyright (C) 2010 tm8st

;; Author: tm8st <tm8st@hotmail.co.jp>
;; Keywords: unreal
;; creation time: Wed May 19 00:03:07 2010
;;; Commentary:

;;; Code:

(eval-when-compile (require 'cl))
(require 'easy-imenu-index-create)

(defvar unreal-imenu-source
    (make-easy-imenu-index-source
   :alist
   `(
     ((caption . "[State] ")
      (regexp . "^[ \t]*state\\(()\\)?[ \t]*"))
     ((caption . "[Var] ")
      (regexp . "^[ \t]*var"))
     ((caption . "[Func] ")
      (regexp . "^[ \t]*\\(static \\)?\\(public \\)?\\(private \\)?\\(protected \\)?\\(simulated \\)?\\(native \\)?\\(final \\)?\\(function\\)[ \t]+\\([a-zA-Z_]+[a-zA-Z0-9_]*\\)"))
     ((caption . "[Event] ")
      (regexp . "^[ \t]*\\(simulated \\)?\\(event \\)\\([a-zA-Z_]+[a-zA-Z0-9_]*\\)"))	
     ((caption . "[Classs] ")
      (regexp . "^[ \t]*class[ \n\t]+\\([a-zA-Z_]+[a-zA-Z0-9_]*\\)"))
     ;; (regexp . "^[ \t]*class[ \n\t]+\\([a-zA-Z_]+[a-zA-Z0-9_]*\\)[ \t\n]*\\(:\\|{\\)"))
     ((caption . "[Strucs] ")
      (regexp . "^[ \t]*struct[ \n\t]+\\([a-zA-Z_]+[a-zA-Z0-9_]*\\)[ \t\n]*[{]"))
     )
   :add-line-number-to-item t
   ))

(defun unreal-imenu-set-for-current-buffer ()
  ""
  (interactive)
  (easy-imenu-index-create-imenu-set-for-current-buffer unreal-imenu-source))

(provide 'unreal)
