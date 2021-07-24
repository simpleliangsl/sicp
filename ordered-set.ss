(library (ordered-set)
    (export element-of-set? adjoin-set intersection-set union-set)
    (import (rnrs))


    (define (element-of-set? x set)
        (if (null? set)
            #f
            (let ( (item (car set)) )
                (cond ((= x item) #t)
                      ((< x item) #f)
                      ((> x item) (element-of-set? x (cdr set)))
                )
            )
        )
    )

    (define (adjoin-set x set)
        (if (null? set)
            (cons x set)
            (let ( (item (car set)) )
                (cond ((= x item) set)
                      ((< x item) (cons x set))
                      ((> x item) (cons item (adjoin-set x (cdr set))))
                )
            )
        )
    )

    (define (intersection-set set1 set2)
        (if (or (null? set1) (null? set2))
            '()
            (let ( (x1 (car set1)) (x2 (car set2)) )
                (cond ((= x1 x2) (cons x1 (intersection-set (cdr set1) (cdr set2))))
                      ((< x1 x2) (intersection-set (cdr set1) set2))
                      ((> x1 x2) (intersection-set set1 (cdr set2)))
                )
            )
        )
    )

    (define (union-set set1 set2)
        (cond ((null? set1) set2)
              ((null? set2) set1)
              (else
                (let ( (x1 (car set1)) (x2 (car set2)) )
                    (cond ((= x1 x2) (union-set (cdr set1) set2))
                        ((< x1 x2) (cons x1 (union-set (cdr set1) set2)))
                        ((> x1 x2) (cons x2 (union-set set1 (cdr set2))))
                    )
                )
              )
        )
    )
)