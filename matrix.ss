(load "accumulate-n.ss")

(define (dot-product v w)
    (accumulate + 0 (map * v w))
)

(define (matrix-*-vector m v)
    (map (lambda (w) (dot-product v w)) m)
)

(define (transpose mat)
    (accumulate-n cons '() mat)
)

(define (matrix-*-matrix m n)
    (let ((cols (transpose n)))
        (map (lambda (v) (matrix-*-vector cols v)) m)
    )
)