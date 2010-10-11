;;; easy-imenu-index-create.el --- easy implement imenu-create-index-function

;; Copyright (C) 2010 tm8st

;; Author: tm8st <http://twitter.com/tm8st>
;; Version: 0.3
;; Keywords: convenience, imenu, easy

;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.

;; This file is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the

;; GNU General Public License for more details.

;; You should have received ba  copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.	If not, write to the
;; Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

;;; Commentary:

;; 設定例

;;; Code:


(eval-when-compile (require 'cl))

;; imenu生成用設定データ構造体
(defstruct easy-imenu-index-source
  alist
  add-line-number-to-item
  )

;; sample source
(defvar easy-imenu-index-create-source-sample
  (make-easy-imenu-index-source
   :alist
   `(
     ((caption . "[SAMPlE] ")
      (regexp . "\\([a-zA-Z_]+[a-zA-Z0-9_]+\\)"))
     )
   :add-line-number-to-item t
   )
  "imenuのindex生成用設定データ"
  )

(defun easy-imenu-index-create-imenu-alist-attr (name iter)
  "alist用getter."
  (cdr (assq name iter)))

(defun easy-imenu-index-create-imenu-create-index (source)
  "get current buffer imenu index."
  (save-excursion
    (let ((index-list)
	  (case-fold-search nil))
      (dolist (iter (easy-imenu-index-source-alist source))
	(goto-char (point-min))
	(while (re-search-forward (easy-imenu-index-create-imenu-alist-attr 'regexp iter) nil t)
	  (goto-char (match-beginning 0))
	  (push (cons
		 (concat (easy-imenu-index-create-imenu-alist-attr 'caption iter)
			 (replace-regexp-in-string "[\n\t]" " " (thing-at-point 'line))
			 (when (easy-imenu-index-source-add-line-number-to-item source)
			   (number-to-string (count-lines (point-min) (match-beginning 0))))
			 )
		 (point))
		index-list)
	  (goto-char (match-end 0))))
      (nreverse index-list))))

(defun easy-imenu-index-create-imenu-set-for-current-buffer (source)
  "imenuに使用するsourceを設定する。 ***-mode-hookなどに追加するとmode別imenu設定が可能。"
  (interactive)
  (setq imenu-create-index-function
	`(lambda () (interactive) (easy-imenu-index-create-imenu-create-index ,source))))

(defun easy-imenu-index-create-imenu-set-for-current-buffer-sample ()
  ""
  (interactive)
  (easy-imenu-index-create-imenu-set-for-current-buffer easy-imenu-index-create-source-sample))

(provide 'easy-imenu-index-create)
