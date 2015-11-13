#lang racket

(define (sample-match-1 a)
  (match a
    [(list) (displayln "Empty")]
    [(list 1) (displayln "uno")]
    [(list x) (displayln "one elemen, not one")]))

(define (sample-match-2 a)
  (match a
    [1 (displayln "this is one")]
    [_ (displayln "this i dont care")]))

(define/match (factorial n)
  [(0) 1]
  [(n) (* n (factorial (- n 1)))])

(define x 3)
