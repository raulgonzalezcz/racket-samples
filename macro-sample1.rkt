#lang racket

(define-syntax-rule (silly-plus x y)
  (+ x y))

(define a 5)
(define b 53)

(define (silly-swap x y)
  (let ([tmp x])
    (set! x y)
    (set! y tmp)))

(define-syntax-rule (macro-swap x y)
  (let ([tmp x])
    (set! x y)
    (set! y tmp)))

;; (define-syntax-rule (macro-print)
;;   (displayln m))

;; (define using-macro-print
;;   (let ([m 5])
;;     (macro-print)))

(define (local-example)
  (let ([z 5]  [o 2])
    (macro-swap z o)
    (displayln z)
    (displayln o)))
