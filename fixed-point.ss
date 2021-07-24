(define (fixed-point f guess)
    (display guess)
    (newline)
    (let ((next-guess (f guess)))
        (if (close-enough? guess next-guess)
            next-guess
            (fixed-point f next-guess)
        )
    )
)

(define (close-enough? x y) 
    (< (abs (- x y)) 0.00001)
)

(define (damping-fixed-point f guess)

    (define (average x y) (/ (+ x y) 2))

    (let ( (f (lambda (x) (average x (f x)))) )
        (fixed-point f guess)
    )
)