(top-level-program

    (import (rnrs) (treed-set))

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

    (define tree2 (make-tree 3
                             (make-tree 1 '() '())
                             (make-tree 8
                                        (make-tree 5 '() '())
                                        (make-tree 9 
                                                   '()
                                                   (make-tree 11 '() '())
                                        )
                             )
                  )
    )

    (display (intersection-set tree1 tree2))
    (newline)

    (display (union-set tree1 tree2))
)