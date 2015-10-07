#!/usr/bin/env racket
#lang racket

(define sample '(3 4 6 6))

(define (S l-i rst)
  (cond
      [(empty? rst) 1]
      [else (+ 1 (max! l-i rst))]))

(define (max! l-i rst)
  (apply max (crt l-i rst)))

(define (crt x lst)
  (cond
      [(empty? lst) '(0)]
      [else (cons (srch x lst) (crt x (cdr lst)))]))

(define (srch x y)
  (cond
     [(>= x (car y)) (S (car y) (cdr y))]
     [else 0]))

(define (search-big lst)
    (cond
        [(empty? lst) empty]
        [else (cons (S (car lst) (cdr lst)) (search-big (cdr lst)) ) ]))

(apply max (search-big (reverse sample)))
