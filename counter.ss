(define (make-counter n)

    (define (increment)
        (set! n (+ n 1))
    )

    (define (tally) n)

    (define (dispatch message)
        (cond ((equal? message 'increment) increment)
              ((equal? message 'tally) tally)
        )
    )

    dispatch
)


(define (counter-increment counter) 
    ((counter 'increment))
)

(define (counter-tally counter)
    ((counter 'tally))
)