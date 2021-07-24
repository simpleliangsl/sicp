(define (make-counter n)
    (lambda () 
        (set! n (+ 1 n))
        n
    )
)