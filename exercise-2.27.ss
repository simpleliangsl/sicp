(define (reverse lst)

    (define (iter result lst)
        (if (null? lst)
            result
            (iter (cons (car lst) result) (cdr lst))
        )
    )

    (iter '() lst)
)

(define (deep-reverse lst)

    (define (iter result items)
        (if (null? items)
            result
            (if (not (pair? items))
                items
                (iter (cons (deep-reverse (car items)) result) (cdr items))
            )
        )
    )

    (iter '() lst)
)