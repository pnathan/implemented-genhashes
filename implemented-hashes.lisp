(defpackage #:impl-hash
  (:use  #:cl #:genhash)
  (:export #:string-hash
           #:number-hash
           #:char-hash
           #:tree-hash))
(in-package #:impl-hash)

(defun string-hash (string)
  (declare
   (optimize (speed 3) (safety 2) (space 0) (debug 1))
   (type string string))
  (the fixnum
       (mod (loop
           for ele across (md5:md5sum-string string)
           for i from 0 by 8
           sum (ash ele (the fixnum i)))
        most-positive-fixnum)))

(defun number-hash (number)
  (declare
   (optimize (speed 3) (safety 2) (space 0) (debug 1))
   (type number number))
  (the fixnum (mod number most-positive-fixnum)))

(defun char-hash (char)
  (declare
   (optimize (speed 3) (safety 2) (space 0) (debug 1))
   (type character char))
  (the fixnum (mod (char-code char) most-positive-fixnum)))

(defun tree-hash (list)
  (sxhash list))

(genhash:register-test-designator 'string-hash #'string-hash #'string=)

(genhash:register-test-designator 'identity #'number-hash #'=)

(genhash:register-test-designator 'char-hash #'sxhash #'char-equal)

(genhash:register-test-designator 'tree-hash #' #'tree-equal)
