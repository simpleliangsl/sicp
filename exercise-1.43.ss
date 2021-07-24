(define (repeated f n)
    (lambda (x)
        (define (iter value k)
            (if (= k 0)
                value
                (iter (f value) (- k 1))
            )
        )
        (iter x n)   
    )
)


(define (compose f g)
    (lambda (x) (f (g x)))
)

(define (compose-repeated f n)

    (define (iter g k)
        (if (= k 1)
            g
            (iter (compose f g) (- k 1))
        )
    )

    (iter f n)
)