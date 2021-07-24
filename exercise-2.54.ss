(define (equal? a b)
    (if (eq? a b)
        #t
        (if (and (pair? a) (pair? b))
            (and (equal? (car a) (car b))
                 (equal? (cdr a) (cdr b))
            )
            #f
        )
    )
)