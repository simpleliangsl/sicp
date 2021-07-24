(load "fixed-point.ss")

(define (fai)
    (fixed-point (lambda (x) (+ 1 (/ 1.0 x))) 1)
)

(define (damping-fai)
    (damping-fixed-point (lambda (x) (+ 1 (/ 1.0 x))) 1)
)

; 1.6180311591702674