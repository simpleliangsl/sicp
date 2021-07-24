(load "unit-test.ss")
(load "square.ss")

(define (square-tree tree)
    (if (null? tree)
        '()
        (if (not (pair? tree))
            (square tree)
            (cons (square-tree (car tree))
                  (square-tree (cdr tree))
            )
        )
    )
)

(define (square-tree tree)

    (define (square-subtree subtree)
        (if (null? subtree)
            '()
            (if (pair? subtree)
                (square-tree subtree)
                (square subtree)
            )
        )
    )

    (map square-subtree tree)
)

; Test: ==========================================

(define (square-tree-unit-tests)

    (define (test1)
        (let (
                (expected (list 1 (list 4 (list 9 16) 25) (list 36 49)))
                (actual (square-tree (list 1 (list 2 (list 3 4) 5) (list 6 7))))
             )

            (test "test1" expected actual)
        )
    )

    (test1)
)