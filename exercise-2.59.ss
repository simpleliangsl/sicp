(top-level-program (import (rnrs) (unordered-set))
    
    (define x 17)

    (define y 299)

    (define set1 '(1 19 299 357 23 96 14 7 17 2))

    (define set2 '(2 21 357 97 14 23 9 0))

    (display (element-of-set? x set1))
    (newline)

    (display (element-of-set? x set2))
    (newline)

    (display (adjoin-set y set2))
    (newline)

    (display (intersection-set set1 set2))
    (newline)

    (display (union-set set1 set2))
    (newline)
)