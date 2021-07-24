(define (make-vector x y)
    (list x y)
)

(define (xcor-vector v)
    (car v)
)

(define (ycor-vector v)
    (cadr v)
)

(define (add-vector v w)
    (make-vector (+ (xcor-vector v) (xcor-vector w))
                 (+ (ycor-vector v) (ycor-vector w))
    )
)

(define (sub-vector v w)
    (make-vector (- (xcor-vector v) (xcor-vector w))
                 (- (ycor-vector v) (ycor-vector w))
    )
)

(define (scale-vector s v)
    (make-vector (* s (xcor-vector v)) (* s (ycor-vector v)))
)