#lang racket

(define size-MiB 1)
(define file-name "bigint.data")

(let ([byte-size (* size-MiB (expt 1024 2))])
  (displayln "generating file")
  (displayln "please wait, this may take a while depending on the size of the file...")
  (delete-file file-name)
  (with-output-to-file file-name
    (lambda ()
      (for ([i byte-size])
        (display (integer->char (+ 48 (random 10)))))
      (displayln ""))))
