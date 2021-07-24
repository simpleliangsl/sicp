(load "average.ss")

(define (make-segment start-point end-point)
    (cons start-point end-point)
)

(define (start-segment s)
    (car s)
)

(define (end-segment s)
    (cdr s)
)

(define (mid-point s)
    (let ( 
            (start-x (x-point (start-segment s)))
            (start-y (y-point (start-segment s)))
            (end-x (x-point (end-segment s)))
            (end-y (y-point (end-segment s)))
         )

        (make-point (average start-x end-x) (average start-y end-y))
    )
)

(define (make-point x y)
    (cons x y)
)

(define (x-point p)
    (car p)
)

(define (y-point p)
    (cdr p)
)