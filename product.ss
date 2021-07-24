(define (product term a next b)
    (if (> a b)
        1
        (* (term a) (product term (next a) next b))
    )
)

(define (product term a next b)
    (define (iter a result)
        (if (> a b)
            result
            (iter (next a) (* (term a) result))
        )
    )
    (iter 1 1)
)