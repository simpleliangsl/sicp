(load "accumulate-sequence.ss")

(define fold-right accumulate)

(define (fold-left op initial sequence)

    (define (iter result rest)
        (if (null? rest)
            result
            (iter (op result (car rest)) (cdr rest))
        )
    )

    (iter initial sequence)
)