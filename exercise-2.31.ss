(load "tree-map.ss")
(load "square.ss")

(define (square-tree tree)
    (tree-map square tree)
)
