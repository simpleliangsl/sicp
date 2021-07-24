(define (enumerate-interval start end)

    (define (iter result num)
        (if (< num start)
            result
            (iter (cons num result) (- num 1))
        )
    )

    (iter '() end)
)