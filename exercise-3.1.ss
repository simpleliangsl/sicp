(define (make-accumulator number)
    (lambda (plus-number)
        (set! number (+ number plus-number))
        number
    )
)

;> (define A (make-accumulator 5))

;> (A 10)
; 15

;> (A 10)
; 25