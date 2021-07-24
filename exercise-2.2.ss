(load "segment.ss")

(define (print-point p)
    (display "(")
    (display (x-point p))
    (display ", ")
    (display (y-point p))
    (display ")")
)

(define start (make-point 2 3.0))
(define end (make-point 8 8))
(define seg (make-segment start end))
(define mid (mid-point seg))

(print-point mid)