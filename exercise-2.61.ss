(top-level-program (import (rnrs) (ordered-set))

    (define x 7)
    (define set1 '(1 3 5 7 9 11 13 15))
    (define set2 '(2 4 5 6 9 10 12 14))

    (assert (element-of-set? x set1))
    (assert (not (element-of-set? x set2)))
    (assert (element-of-set? x (adjoin-set x set2)))

    (assert (equal? '(5 9) (intersection-set set1 set2)))

    (assert (equal? '(1 2 3 4 5 6 7 9 10 11 12 13 14 15) (union-set set1 set2)))

    (display "PASSED!")
)