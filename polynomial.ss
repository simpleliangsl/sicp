(library (polynomial)

    (export n)

    (import (rnrs))

    ; polynomial
    (define (make-polynomial var terms) (list var terms))
    (define (var-of-polynomial p) (car p))
    (define (terms-of-polynomial p) (cadr p))

    ; term
    (define (make-term order coefficient) (list order coefficient))
    (define (order-of-term term) (car term))
    (define (coefficient-of-term term) (cadr term))

    ; terms
    (define EMPTY-TERMS '())
    (define (empty-terms? terms) (null? terms))
    (define (first-term terms) (car terms))
    (define (rest-of-terms terms) (cdr terms))

    (define (adjoin-term term terms)
        (if (=zero? (coefficient term)
            terms
            (cons term terms)
        )
    )

    (define (add-terms L1 L2)

        (cond [(empty-terms? L1) L2]
              [(empty-terms? L2) L1]
              [else
                (let ([t1 (first-term L1)]
                      [t2 (first-term L2)]
                     )

                    (cond [(> (order t1) (order t2))
                           (adjoin-term t1 (add-terms (rest-of-terms L1) L2))
                          ]
                          [(< (order t1) (order t2))
                           (adjoin-term t2 (add-terms L1 (rest-of-terms L2)))
                          ]
                          [else
                           (adjoin-term (make-term (order t1) 
                                                   (add (coefficient t1) (coefficient t2))
                                        )
                                        (add-terms (rest-of-terms L1)
                                                   (rest-of-terms L2)
                                        )
                          )
                         ]
                    )
                )
              ]
        )

    )

    (define (sub-terms L1 L2)
        (add-terms L1 (minus-terms L2))
    )

    (define (minus-terms L)
        (if (empty-terms? L)
            L
            (let ([t (first-term L)])
                (adjoin-term (make-term (order t) 
                                        (minus (coefficient t))
                             )
                             (minus-terms (rest-of-terms L))
                )
            )
        )
    )

    (define (mul-term-by-all-terms t1 L)
        (if (empty-terms? L)
            EMPTY-TERMS
            (let ([t2 (first-term L)])
                (adjoin-term (make-term (add (order t1) (order t2))
                                        (mul (coefficient t1) (coefficient t2))
                             )
                             (mul-term-by-all-termss t1 (rest-of-terms L))
                )
            )
            (adjoin-term (make-term )
            )
        )
    )

    (define (mul-terms L1 L2)

        (if (empty-terms? L1) 
            EMPTY-TERMS
            (add-terms (mul-term-by-all-terms (first-term L1) L2)
                        (mul-terms (rest-of-terms L1) L2)
            )
        )
    )

    (define (div-terms L1 L2)
        (cond [(empty-terms? L1) (list EMPTY-TERMS EMPTY-TERMS)]
              [(empty-terms? L2) (list EMPTY-TERMS L1)]
              [else
               (let ([t1 (first-term L1)]
                     [t2 (first-term L2)]
                    )
                    (if (< (order t1) (order t2))
                        (list EMPTY-TERMS L2)
                        (let ([new-o (sub (order t1) (order t2))]
                              [new-c (div (coefficient t1) (coefficient t2))]
                             )
                             (let ([rest-of-result
                                    (div-terms (sub-terms L1
                                                          (mul-term-by-all-terms (make-term new-o new-c)
                                                                                 L2
                                                          )
                                               )
                                               L2
                                    )
                                   ])

                                   (list (adjoin-term (make-term new-o new-c) (car rest-of-result))
                                         (cadr rest-of-result)
                                   )
                             )
                        )
                    )
               )
              ]
        )
    )

    ; They should be installed into general operator table
    ; but I just implement them here for short term
    (define (=zero? x) (equal? x 0))
    (define (add x y) (+ x y))
    (define (mul x y) (* x y))
    (define (sub x y) (- x y))
    (define (div x y) (/ x y))
    (define (minus x) (- x))
)