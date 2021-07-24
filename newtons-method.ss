(load "fixed-point.ss")

(define (newtons-method g guess)

    (define (newton-transform g)
        (lambda (x)
            (- x (/ (g x) ((derivate g) x)))
        )
    )

    (define (derivate g)
        (lambda (x) 
            (/ (- (g (+ x dx)) (g x)) 
               dx)
        )
    )

    (define dx 0.00001)

    (fixed-point (newton-transform g) guess)
)