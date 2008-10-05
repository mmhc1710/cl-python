;; -*- Mode: LISP; Syntax: COMMON-LISP; Package: CLPYTHON.MODULE.OS; Readtable: PY-USER-READTABLE -*-
;;
;; This software is Copyright (c) Franz Inc. and Willem Broekema.
;; Franz Inc. and Willem Broekema grant you the rights to
;; distribute and use this software as governed by the terms
;; of the Lisp Lesser GNU Public License
;; (http://opensource.franz.com/preamble.html),
;; known as the LLGPL.

(in-package :clpython.module.os)
(in-syntax *user-readtable*)
;;; OS

(defvar |name| "common lisp")
(defvar |error| (find-class '{OSError}))

(defun |urandom| (n)
  "Return string of N random bytes"
  (let ((s (make-string n)))
    (dotimes (i n)
      (setf (aref s i) (code-char (random 256))))
    s))

#+allegro
(defvar |environ| (clpython::make-dict-from-symbol-alist (excl.osi:environment)))

(set-impl-status '(|name| |error| |urandom| #+allegro |environ|) t)

(do-external-symbols (s :clpython.module.os)
  (unless (clpython::impl-status s)
    (set-impl-status s :todo)))

