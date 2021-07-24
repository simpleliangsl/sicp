(define (count-pairs x)
    (if (not (pair? x))
        0
        (+ (count-pairs (car x))
           (count-pairs (cdr x))
           1
        )
    )
)

(define pair0 (cons 'a 'b))
(define pair1 (cons pair0 'c))
(define pair2 (cons pair1 'd))
(display (count-pairs pair2)) ; 3
(newline)

(define pair3 (cons 'a 'b))
(define pair4 (cons pair3 pair3))
(define pair5 (cons pair4 'd))
(display (count-pairs pair5)) ; 4
(newline)

(define pair6 (cons 'a 'b))
(define pair7 (cons pair6 pair6))
(define pair8 (cons pair7 pair7))
(display (count-pairs pair8)) ; 7
(newline)

; infinite loop!
(set-car! pair0 pair1)
(display (count-pairs pair2)) ; out of memory

