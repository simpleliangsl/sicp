(define (queens board-size)

    (define empty-board '())

    (define (adjoin-position row k rest-of-queens)
        (cons row rest-of-queens)
    )

    (define (safe? k positions)

        (let ( (k-value (car positions)) )

            (define (iter rest-of-positions steps)
                (if (null? rest-of-positions)
                    #t
                    (let ( (i-value (car rest-of-positions)) )
                        (if (or (= k-value i-value) 
                                (= k-value (- i-value steps))
                                (= k-value (+ i-value steps))
                            )
                            #f
                            (iter (cdr rest-of-positions) (+ steps 1))
                        )
                    )
                )
            )

            (iter (cdr positions) 1)
        )
    )

    (define (queen-cols k)
        (if (= k 0)
            (list empty-board)
            (filter (lambda (positions) (safe? k positions))
                    (flatmap (lambda (rest-of-queens)
                                (map (lambda (new-row)
                                        (adjoin-position new-row k rest-of-queens)
                                     )
                                     (enumerate-interval 1 board-size)
                                )
                             )
                             (queen-cols (- k 1))
                    )
            )
        )
    )

    (queen-cols board-size)
)