(define (double f)
    (lambda (x) 
        (f (f x))
    )
)

(define (inc x) (+ x 1))

; ((double inc) 5) = 5 + 1 + 1 = 7
; (((double (double double)) inc) 5)

; 1. (double double) = (^ (x) (double (double x)) )

; 2. (double (double double)) = (^ (x) (double (double (double (double x)))) )

; 3. ((double (double double)) inc) = (double (double (double (double inc))))

; 4. (((double (double double)) inc) 5) = 21