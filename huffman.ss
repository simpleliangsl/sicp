(library (huffman)
    
    (export decode encode generate-huffman-tree)

    (import (rnrs))

    (define (make-leaf symbol weight)
        (list 'leaf symbol weight)
    )

    (define (leaf? object) (eq? (car object) 'leaf))

    (define (leaf-symbol leaf) (cadr leaf))

    (define (leaf-weight leaf) (caddr leaf))


    (define (make-code-tree left right)
        (list left 
              right 
              (append (symbols left) (symbols right))
              (+ (weight left) (weight right))
        )
    )

    (define (left-branch tree) (car tree))

    (define (right-branch tree) (cadr tree))

    (define (symbols tree)
        (if (leaf? tree)
            (list (leaf-symbol tree))
            (caddr tree)
        )
    )

    (define (weight tree)
        (if (leaf? tree)
            (leaf-weight tree)
            (cadddr tree)
        )
    )

    (define (decode bits tree)

        (define (decode-recur bits branch)
            (if (null? bits)
                '()
                (let ([next-branch (choose-branch (car bits) branch)])
                    (if (leaf? next-branch)
                        (cons (leaf-symbol next-branch)
                              (decode-recur (cdr bits) tree)
                        )
                        (decode-recur (cdr bits) next-branch)
                    )
                )
            )
        )

        (define (choose-branch bit branch)
            (cond [(= bit 0) (left-branch branch)]
                  [(= bit 1) (right-branch branch)]
                  [else (error #f "bad bit" bit)]
            )
        )

        (decode-recur bits tree)
    )

    (define (encode message tree)

        (define (encode-symbol symbol tree)
            (cond [(leaf? tree) '()]
                  [(find-in-branch? symbol (left-branch tree)) 
                   (cons 0 
                         (encode-symbol symbol (left-branch tree))
                   )
                  ]
                  [(find-in-branch? symbol (right-branch tree))
                   (cons 1
                         (encode-symbol symbol (right-branch tree))
                   )
                  ]
                  [else (error #f "symbol not tree" symbol)]
            )
        )

        (define (find-in-branch? symbol branch)
            (find (lambda (element) (eq? symbol element))
                  (symbols branch)
            )
        ) 

        (if (null? message)
            '()
            (append (encode-symbol (car message) tree)
                  (encode (cdr message) tree)
            )
        )
    )

    (define (generate-huffman-tree pairs)

        (define (successive-merge node-set)
            (if (eq? '() node-set)
                '()
                (let ([first-node (car node-set)])
                    (if (eq? '() (cdr node-set))
                        first-node
                        (let ([second-node (cadr node-set)])
                            (successive-merge (adjoin-set (make-code-tree first-node 
                                                                          second-node)
                                                          (cddr node-set))
                            )
                        )
                    )
                )
            )
        )

        (successive-merge (make-leaf-set pairs))
        
    )

    (define (make-leaf-set pairs)

        (define (make-leaf-set-iter pairs result-set)
            (if (null? pairs)
                result-set
                (let ([pair (car pairs)])
                    (make-leaf-set-iter (cdr pairs)
                                        (adjoin-set (make-leaf (car pair) ; symbol
                                                            (cadr pair) ; frequency
                                                    )
                                                    result-set
                                        )
                    )
                )
            )
        )

        (make-leaf-set-iter pairs '())
    )

    (define (adjoin-set node node-set)

        (if (null? node-set)
            (cons node node-set)
            (if (< (weight node) (weight (car node-set)))
                (cons node node-set)
                (cons (car node-set) (adjoin-set node (cdr node-set)))
            )
        )
    )
)