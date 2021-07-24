(load "monte-carlo.ss")

(define (random-in-range low high)
    (let ([range (- high low)])
        (+ low (random range) 0.0)
    )
)

(define (estimate-integral trials p? x1 x2 y1 y2)

    (define (experiment)
        (p? (random-in-range x1 x2) 
           (random-in-range y1 y2)
        )
    )

    (define area (* (- x2 x1) (- y2 y1)))

    (* (monte-carlo trials experiment) area)
)

(define (estimate-pi trials)

    (define (p? x y)
        (<= (+ (* x x) (* y y)) 1)
    )

    (define x1 -1.0)
    (define x2 1.0)
    (define y1 -1.0)
    (define y2 1.0)

    (estimate-integral trials p x1 x2 y1 y2)
)