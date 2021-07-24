(define (make-wire)

    (define signal 0)

    (define actions '())

    (define (set-signal! new-value)
        (if (not (= signal new-value))
            (begin 
                (set! signal new-value)
                (call-each actions)
            )
            'done
        )
    )

    (define (call-each actions)
        (if (null? actions)
            'done
            (begin
                ((car actions))
                (call-each (cdr actions))
            )
        )
    )

    (define (add-action! action)
        (set! actions (cons action actions))
        (action)
    )

    (define (dispatch message)
        (cond [(eq? message 'get-signal) signal]
              [(eq? message 'set-signal!) set-signal!]
              [(eq? message 'add-action!) add-action!]
              [else (error #f "Unknown operation on WIRE" message)]
        )
    )

    dispatch
)

(define (get-signal wire) 
    (wire 'get-signal)
)

(define (set-signal! wire new-value) 
    ((wire 'set-signal!) new-value)
)

(define (add-action! wire action)
    ((wire 'add-action!) action)
)


(define (after-delay delay action))


(define (inverter input output)

    (define (logical-not signal)
        (cond [(= signal 0) 1]
              [(= signal 1) 0]
              [else (error #f "Invalid signal " signal)]
        )
    )

    (define (action-procedure)
        (let ([new-value (logical-not (get-signal input))])
            (after-delay inverter-delay 
                         (lambda () (set-signal! output new-value))
            )
        )
    )

    (add-action! input action-procedure)

    'ok
)

(define (and-gate a1 a2 output)

    (define (logical-and signal1 signal2)
        (if (or (= signal 0) (= signal 0)) 0 1)
    )

    (define (action-procedure)
        (let ([new-value (logical-and (get-signal a1) (get-signal a1))])
            (after-delay and-delay
                         (lambda () (set-signal! output new-value))
            )
        )
    )

    (add-action! a1 action-procedure)
    (add-action! a2 action-procedure)

    'ok
)

(define (or-gate a1 a2 output)

    (define (logical-or signal1 signal2)
        (if (and (= signal1 0) (= signal2 0)) 0 1)
    )

    (define (action-procedure)
        (let ([new-value (logical-or (get-signal a1) (get-signal a2))])
            (after-delay or-delay
                         (lambda () (set-signal! output new-value))
            )
        )
    )

    (add-action! a1 action-procedure)
    (add-action! a2 action-procedure)

    'ok
)
