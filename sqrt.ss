(load "square.ss")

(define (sqrt x) 
  (define (improve y x)
    (/ (+ y (/ x y)) 2)
  )
  (define (good-enough? guess x)
    (< (abs (- (square guess) x)) 0.001)
  )
  (define (sqrt-iter guess x)
    (if (good-enough? guess x)
        guess
        (sqrt-iter (improve guess x) x)
    )
  )
  (sqrt-iter 1.0 x); Use 1.0 instead of 1
)