(top-level-program (import (rnrs) (treed-set))

    (define (tree->list-1 tree)
        (if (null? tree)
            '()
            (append (tree->list-1 (left-branch tree))
                    (cons (entry tree)
                          (tree->list-1 (right-branch tree))
                    )
            )
        )
    )

    (define (tree->list-2 tree)
        
        (define (copy-to-list tree result-list)
            (if (null? tree)
                result-list
                (copy-to-list (left-branch tree) 
                              (cons (entry tree) 
                                    (copy-to-list (right-branch tree) result-list)
                              )
                )
            )
        )

        (copy-to-list tree '())
    )

    (define tree1 (make-tree 7 
                             (make-tree 3 
                                        (make-tree 1 '() '()) 
                                        (make-tree 5 '() '())
                             ) 
                             (make-tree 9 
                                        '() 
                                        (make-tree 11 '() '())
                             )
                  ) 
    )

    (display (tree->list-1 tree1))
    (newline)

    (display (tree->list-2 tree1))
    (newline)

    (newline)

    (define tree2 (make-tree 3
                             (make-tree 1 '() '())
                             (make-tree 7
                                        (make-tree 5 '() '())
                                        (make-tree 9 
                                                   '()
                                                   (make-tree 11 '() '())
                                        )
                             )
                  )
    )

    (display (tree->list-1 tree2))
    (newline)

    (display (tree->list-2 tree2))
    (newline)

    (newline)

    (define tree3 (make-tree 5
                             (make-tree 3
                                        (make-tree 1 '() '())
                                        '()
                             )
                             (make-tree 9
                                        (make-tree 7 '() '())
                                        (make-tree 11 '() '())
                             )
                  )
    )

    (display (tree->list-1 tree3))
    (newline)

    (display (tree->list-2 tree3))
    (newline)
)