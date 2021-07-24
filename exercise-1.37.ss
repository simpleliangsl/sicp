(load "cont-frac.ss")

(define (fai k)
    (+ 1 
       (cont-frac (lambda (i) 1.0) (lambda (i) 1.0) k)
    )
)