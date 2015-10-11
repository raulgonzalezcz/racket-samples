#!/usr/bin/env racket
#lang racket

(define sample '(3 4 6 5))

(define (S l-i rst)
  (cond
      [(empty? rst) 1]
      [(empty? (filter (curry >= l-i) rst)) 1]
      [else (+ 1
               (apply max
                      (map S
                           (filter (curry >= l-i) rst)
                           (create-list (filter (curry >= l-i)
                                                rst)))))]))

(define (create-list l)
    (cond
        [(empty? l) empty]
        [else (cons (cdr l) (create-list (cdr l)))]))

(S (car (reverse sample)) (cdr (reverse sample)))
