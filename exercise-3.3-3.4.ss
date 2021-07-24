(define (make-account balance secret-password)

    (define (withdraw amount)
        (if (> balance amount)
            (begin
                (set! balance (- balance amount))
                balance
            )
            (error #f "Insufficient funds")
        )
    )

    (define (deposit amount)
        (set! balance (+ balance amount))
        balance
    )

    (define INCORRECT-TIMES-ALLOWED 3)
    (define incorrect-times-inputed 0)

    (define (dispatch password message)
        (cond
            [(not (eq? password secret-password))
             (set! incorrect-times-inputed (+ incorrect-times-inputed 1))
             (if (>= incorrect-times-inputed INCORRECT-TIMES-ALLOWED)
                 (error #f "Call-the-cops!!!")
                 (error #f "Incorrect password")
             )
            ]
            [(eq? message 'withdraw) withdraw]
            [(eq? message 'deposit) deposit]
            [else (error #f "Unknown request -- MAKE-ACCOUNT" message)]
        )
    )

    dispatch
)