(asdf:defsystem #:impl-hash
  :description "Implemented hashtable code for Common Lisp standard datatypes"
  :version "0.1"
  :depends-on (#:md5 #:genhash)
  :license "LLGPL"
  :components ((:file "implemented-hashes")))
