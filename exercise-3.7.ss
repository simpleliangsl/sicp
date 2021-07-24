(load "exercise-3.3-3.4.ss")

(define (make-joint account account-password joint-password)
    (lambda (input-password message)
        (if (eq? input-password joint-password)
            (account account-password message)
            (error #f "Incorrect password!")
        )
    )
)

(define peter-acc (make-account 120 'open-sesame))
(define paul-acc (make-joint peter-acc 'open-sesame 'rosebud))

(display "original balance from peter: ")
(display ((peter-acc 'open-sesame 'deposit) 0))
(newline)

(display "after withdrawing 100 by paul: ")
(display ((paul-acc 'rosebud 'withdraw) 100))
(newline)

(display "after depositing 30 by peter: ")
(display ((peter-acc 'open-sesame 'deposit) 30))
(newline)

(display "after withdrawing 20 by peter: ")
(display ((peter-acc 'open-sesame 'withdraw) 20))
(newline)

(display "final balance from paul: ")
(display ((paul-acc 'rosebud 'deposit) 0))
(newline)