(define (subset set)
    (if (null? set)
        (list '())
        (let (( rest (subset (cdr set)) ))
            (append rest 
                    (map (lambda (x) (append (list (car set)) x)) 
                         rest
                    )
            )
        )
    )
)