(library (unordered-set)

    (export element-of-set? adjoin-set intersection-set union-set)

    (import (rnrs))

    (define (element-of-set? x set)
        (if (null? set) 
            #f
            (if (equal? x (car set))
                #t
                (element-of-set? x (cdr set))
            )
        )
    )

    (define (adjoin-set x set)
        (if (element-of-set? x set)
            set
            (cons x set)
        )
    )

    (define (intersection-set set1 set2)
        (if (or (null? set1) (null? set2))
            '()
            (if (element-of-set? (car set1) set2)
                (cons (car set1) 
                      (intersection-set (cdr set1) set2)
                )
                (intersection-set (cdr set1) set2)
            )
        )
    )

    (define (union-set set1 set2)
        (if (null? set1)
            set2
            (if (element-of-set? (car set1) set2)
                (union-set (cdr set1) set2)
                (cons (car set1) 
                      (union-set (cdr set1) set2)
                )
            )
        )
    )
)