;;; howm-imenu.el --- howm imenu

;; Copyright (C) 2010 tm8st

;; Author: tm8st <tm8st@hotmail.co.jp>
;; Keywords: howm, imenu
;; creation time: [Thu Jun 10 23:00:56 2010]
;;; Commentary:

;;; Code:

(eval-when-compile (require 'cl))
(require 'easy-imenu-index-create)

(defvar howm-imenu-source
  (make-easy-imenu-index-source
   :alist
   `(
     ((caption . "[TODO]  ")
      (regexp . "^[ \t]*\\[.+\\]\\+"))
     ((caption . "[MEMO]  ")
      (regexp . "^= "))
     ((caption . "[GOTO]  ")
      (regexp . ">>>"))
     ((caption . "[COME]  ")
      (regexp . "<<<"))
     ;; [2010-10-12]+ [TODO]
     )
   :add-line-number-to-item t
   ))

(provide 'howm-imenu)
