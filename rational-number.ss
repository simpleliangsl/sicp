(load "gcd.ss")

(define (make-rat n d)

    (let ( (g (gcd (abs n) (abs d))))
        (if (< d 0)
            (cons (- (/ n g)) (- (/ d g)))
            (cons (/ n g) (/ d g))
        )
    )
)

(define (numerator x)
    (car x)
)

(define (denominator x)
    (cdr x)
)

(define (print-rat x)
    (newline)
    (display (numerator x))
    (display "/")
    (display (denominator x))
)