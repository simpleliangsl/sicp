(define (cont-frac n d k)

    (define (recur n d i)
        (if (> i k)
            0
            (/ (n i) (+ (d i) (recur n d (+ i 1))))
        )
    )

    (recur n d 1)
)

(define (cont-frac n d k)

    (define (iter result i)
        (if (= i 0)
            result
            (iter (/ (n i) (+ (d i) result)) (- i 1))
        )
    )
    
    (iter 0 k)
)