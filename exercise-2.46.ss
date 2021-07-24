(load "vector.ss")

(define v (make-vector 1 2))
(define w (make-vector -3 4))

(display (add-vector v w))
(newline)

(display (sub-vector v w))
(newline)

(display (scale-vector 3 v))
(newline)

(display (add-vector (scale-vector 5 v) (scale-vector 3 w)))
(newline)