(define (cons a b)
    (* (exp 2 a) (exp 3 b))
)

(define (exp a b)

    (define (iter result k)
        (if (> k b)
            result
            (iter (* result a) (+ k 1))
        )
    )

    (iter 1 1)
)

(define (number-of-a c a)
    (define (iter c k)
        (if (= (remainder c a) 0)
            (iter (/ c a) (+ k 1))
            k
        )
    )
    (iter c 0)
)

(define (car c) (number-of-a c 2))

(define (cdr c) (number-of-a c 3))