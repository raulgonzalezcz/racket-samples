#!/usr/bin/env racket
#lang racket

; This module contains an unoptimized example of the solution of calculating
; the loose change of a given amount, this file has a python file companion

(define (change n coins [current-coin (if (empty? coins) empty (car coins))])
    (cond
        [(null? current-coin) (raise 'failed #t)]
        [(= (- n current-coin) 0) (cons current-coin empty)]
        [(< (- n current-coin) 0) (change n (cdr coins))]
        [else (cons current-coin (change (- n current-coin) coins))]))

(let ([coins '(100 50 20 10 5 1 0.5)])
  (change (read) coins) )
