(top-level-program (import (rnrs) (ordered-set))

    (define set1 '(1 3 5 7 9 11 13 15))
    (define set2 '(2 4 5 6 9 10 12 14))

    (assert (equal? '(1 2 3 4 5 6 7 9 10 11 12 13 14 15) (union-set set1 set2)))

    (display "PASSED!")
)