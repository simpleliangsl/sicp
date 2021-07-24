(library (unit-test)
    (export test)
    (import (chezscheme))

    (define (test case-name expected actual)
        (newline)
        (display (format "Case: ~a -> " case-name))

        (if (equal? expected actual) 
            (display "OK.")
            (errorf #f "~a should be ~a" actual expected)
        )

        (newline)
    )
)