#lang racket

(define block-size 2)
(define stop-chars '(#\space #\newline))

(define (calculate-super-int file-name)
  (with-input-from-file file-name
    (lambda ()
      (let ([buffer (make-string block-size #\space)]
            [i 0]
            [open #f])

        (define (read-block)
          (read-string! buffer (current-input-port) 0 block-size)
          (set! i 0))

        (define (next-char)
          (cond
            [(not open) (begin
                          (read-block)
                          (set! open #t)
                          (next-char))]
            [(< i block-size) (begin
                                (set! i (add1 i))
                                (string-ref buffer (sub1 i)))]
            [else (begin
                    (read-block)
                    (next-char))]))

        (define (sum [acc 0])
          (let ([c (next-char)]
                [acc (if (> acc 9) (add1 (remainder acc 10)) acc)])
            (cond
              [(> acc 9) (sum (add1 (remainder acc 10)))]
              [(char-numeric? c)  (sum (+ acc (- (char->integer c) 48)))]
              [else acc])))

        (sum)))))


(displayln (calculate-super-int "bigint.data"))
