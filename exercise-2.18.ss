(define (reverse items)

    (define (iter result items)
        (if (null? items)
            result
            (iter (cons (car items) result) (cdr items))
        )
    )

    (iter '() items)
)