(import (simple-stream))

(define (average x y) (/ (+ x y) 2))

(define (sqrt-improve g x)
    (average (/ x g) g)
)

(define (sqrt-stream x)
    (define guesses 
            (cons-stream 1.0 
                         (stream-map (lambda (g)
                                        (sqrt-improve g x)
                                     )
                                     guesses
                         )
            )
    )

    guesses
)

(define (stream-limit stream tolerance)
    (if (empty-stream? stream)
        'null
        (let ([first (stream-car stream)]
              [rest (stream-cdr stream)]
             )
            
            (if (empty-stream? rest)
                first
                (let ([second (stream-car rest)])

                    (if (<= (abs (- second first)) tolerance)
                        second
                        (stream-limit (stream-cdr stream) tolerance)
                    )
                )
            )
        )
    )
)

(define (sqrt x tolerance)
    (stream-limit (sqrt-stream x) tolerance)
)