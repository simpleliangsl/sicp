(load "cont-frac.ss")

(define (e k)
    (define (n i) 1)

    (define (d i)
        (if (= (remainder (+ i 1) 3) 0)
            (* (/ (+ i 1) 3) 2)
            1
        )
    )

    (+ 2.0 (cont-frac n d k))
)