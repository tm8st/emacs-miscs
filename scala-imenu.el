;;; scala-imenu.el --- scala imenu

;; Copyright (C) 2010 tm8st

;; Author: tm8st <tm8st@hotmail.co.jp>
;; Keywords: scala, imenu
;; creation time: [Thu Jun 10 23:00:56 2010]
;;; Commentary:

;;; Code:

(eval-when-compile (require 'cl))
(require 'easy-imenu-index-create)

(defvar scala-imenu-source
  (make-easy-imenu-index-source
   :alist
   `(
     ((caption . "[CLASS]  ")
      (regexp . "^[ \t]*\\(abstract \\)?\\(case \\)?class[ \n\t]+\\([a-zA-Z_]+[a-zA-Z0-9_]*\\)"))
     ((caption . "[OBJECT] ")
      (regexp . "^[ \t]*object[ \n\t]+\\([a-zA-Z_]+[a-zA-Z0-9_]*\\)"))
     ((caption . "[TRAIT]  ")
      (regexp . "^[ \t]*trait[ \n\t]+\\([a-zA-Z_]+[a-zA-Z0-9_]*\\)"))
     ((caption . "[FUNC]      ")
      (regexp . "^[ \t]*\\(private \\)?\\(override \\)?\\(final \\)?\\(def \\)+\\([a-zA-Z_]+[a-zA-Z0-9_]*\\)"))
     ((caption . "[VAL]    ")
      (regexp . "^[ \t]*\\(private \\)?\\var[ \t]"))
     ((caption . "[VAR]    ")
      (regexp . "^[ \t]*\\(private \\)?\\val[ \t]"))
     )
   :add-line-number-to-item t
   ))

(provide 'scala-imenu)
