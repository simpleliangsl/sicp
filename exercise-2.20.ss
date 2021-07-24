(define (same-pairity first-number . other-numbers)

    (define (filter predicate items)
        (if (null? items)
            '()
            (if (predicate (car items))
                (cons (car items) (filter predicate (cdr items)))
                (filter predicate (cdr items))
            )
        )
    )

    (define (pairity-matched? item)
        (even? (+ first-number item))
    )

    (filter pairity-matched? (cons first-number other-numbers))
)