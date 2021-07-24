(load "sum.ss")

(define (integral f a b dx)
    (define (next a) (+ a dx))
    (* dx 
       (sum f (+ a (/ dx 2.0)) next b)
    )
)