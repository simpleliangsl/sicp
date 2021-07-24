(load "accumulate-sequence.ss")

(define (count-leaves t)
    (accumulate + 
                0 
                (map (lambda (x)
                        (if (null? x)
                            0
                            (if (not (pair? x))
                                1
                                (count-leaves x)
                            )
                        )
                     )
                     t
                )
    )
)