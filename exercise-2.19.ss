(define us-coins (list 50 25 10 5 1))
(define uk-coins (list 100 50 20 10 5 2 1 0.5))

(define (count-change amount coin-values)
    (if (= amount 0)
        1
        (if (or (< amount 0) (no-more? coin-values))
            0
            (+ (count-change amount (except-first-denomination coin-values))
               (count-change (- amount (first-denomination coin-values)) coin-values)
            )
        )
    )
)

(define (no-more? coin-values)
    (null? coin-values)
)

(define (except-first-denomination coin-values)
    (cdr coin-values)
)

(define (first-denomination coin-values)
    (car coin-values)
)