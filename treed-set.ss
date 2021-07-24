(library (treed-set)

    (export make-tree entry left-branch right-branch 
            element-of-set? adjoin-set intersection-set union-set)

    (import (chezscheme) (prefix (ordered-set) ordered:))

    (define (make-tree entry left-branch right-branch)
        (list entry left-branch right-branch)
    )

    (define (entry tree) (car tree))

    (define (left-branch tree) (cadr tree))

    (define (right-branch tree) (caddr tree))

    ; tree as set
    (define (element-of-set? x set)
        (if (null? set)
            #f
            (let ( (e (entry set)) )
                (cond ((= x e) #t)
                      ((< x e) (element-of-set? (left-branch set)))
                      ((> x e) (element-of-set? (right-branch set)))
                )
            )
        )
    )

    (define (adjoin-set x set)
        (if (null? set)
            (make-tree x '() '())
            (let ( (e (entry set)) )
                (cond ((= x e) set)
                      ((< x e) 
                       (make-tree e 
                                  (adjoin-set x (left-branch set)) 
                                  (right-branch set)))
                      ((> x e) 
                       (make-tree e 
                                  (left-branch set) 
                                  (adjoin-set x (right-branch set))))
                )
            )
        )
    )

    (define (intersection-set set1 set2)
        (list->tree (ordered:intersection-set (tree->list set1) (tree->list set2)))
    )

    (define (union-set set1 set2)
        (list->tree (ordered:union-set (tree->list set1) (tree->list set2)))
    )

    (define (tree->list tree)

        (define (iter tree result-list)
            (if (null? tree)
                result-list
                (iter (left-branch tree) 
                      (cons (entry tree) 
                            (iter (right-branch tree) 
                                  result-list
                            )
                      )
                )
            )
        )

        (iter tree '())
    )

    (define (list->tree elements)

        (define (partial-tree elts n)
            (if (= n 0)
                (cons '() elts)
                (let* ([left-size (quotient (- n 1) 2)]
                       [left-result (partial-tree elts left-size)]
                       [left-tree (car left-result)]
                       [remaining-elts (cdr left-result)]
                       [this-entry (car remaining-elts)]
                       [right-size (- n 1 left-size)]
                       [right-result (partial-tree (cdr remaining-elts) right-size)]
                       [right-tree (car right-result)]
                      )

                    (cons (make-tree this-entry left-tree right-tree) (cdr right-result))
                )
            )
        )

        (car (partial-tree elements (length elements)))
    )
)