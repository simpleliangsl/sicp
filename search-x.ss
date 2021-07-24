(load "average.ss")

(define (search f neg-point pos-point)
    (let ( (mid-point (average neg-point pos-point)) )
        (if (close-enough? neg-point pos-point)
            mid-point
            (cond ((> (f mid-point) 0) (search f neg-point mid-point))
                  ((< (f mid-point) 0) (search f mid-point pos-point))
                  (else mid-point)
            )
        )
    )
)

(define (close-enough? x y)
    (< (abs (- x y)) 0.001)
)

