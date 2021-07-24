(define (count-pairs x)
    (define queue '())

    (define (contains? q x)
        (cond [(null? q) #f]
              [(eq? (car q) x) #t]
              [else (contains? (cdr q) x)]
        )
    )

    (define (count-pairs-recur x)
        (if (or (not (pair? x)) (contains? queue x))
            0
            (begin
                (set! queue (cons x queue))

                (+ (count-pairs-recur (car x))
                   (count-pairs-recur (cdr x))
                   1
                )
            )
        )
    )

    (count-pairs-recur x)
)

(define pair0 (cons 'a 'b))
(define pair1 (cons pair0 'c))
(define pair2 (cons pair1 'd))
(display (count-pairs pair2)) ; 3
(newline)

(define pair3 (cons 'a 'b))
(define pair4 (cons pair3 pair3))
(define pair5 (cons pair4 'd))
(display (count-pairs pair5)) ; 3
(newline)

(define pair6 (cons 'a 'b))
(define pair7 (cons pair6 pair6))
(define pair8 (cons pair7 pair7))
(display (count-pairs pair8)) ; 3
(newline)

; Not infinite loop any more
(set-car! pair0 pair1)
(display (count-pairs pair2)) ; 3

