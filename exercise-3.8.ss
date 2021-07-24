(define f 
    (let ((a 0))
        (lambda (x)
            (if (= a 0)
                (begin (set! a 1) x)
                (begin (set! a 0) 0)
            )
        )
    )
)

(define f
    (lambda (first-value)
        (set! f (lambda (second-value) 0))
        first-value))