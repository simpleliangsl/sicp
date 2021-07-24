(load "fixed-point.ss")

(define (x^x=1000)
    (fixed-point (lambda (x) (/ (log 1000) (log x))) 2)
)

(define (damping-x^x=1000)
    (damping-fixed-point (lambda (x) (/ (log 1000) (log xd))) 2)
)