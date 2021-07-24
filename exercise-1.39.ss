(define (tan-cf x k)

    (define (numerator i)
        (if (= i 1)
            x
            (- (* x x))
        )
    )

    (define (denominator i)
        (- (* 2 i) 1.0)
    )

    (cont-frac numerator denominator k)
)