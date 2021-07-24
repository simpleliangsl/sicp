(define (iterative-improve close-enough? improve init-guess)

    (define (iter guess)
        (let ((next-guess (improve guess)))
            (if (close-enough? guess next-guess)
                next-guess
                (iter next-guess)
            )
        )
    )

    (iter init-guess)
)

(define (sqrt x)

    (define (close-enough? x y)
        (< (abs (- x y)) 0.00001)
    )

    (define (improve guess)
        (/ (+ guess (/ x guess)) 2)
    )

    (iterative-improve close-enough? improve 1.0)
)

(define (fixed-point f guess)

    (iterative-improve (lambda (x y) (< (abs (- x y)) 0.00001)) 
                       f 
                       guess)
)