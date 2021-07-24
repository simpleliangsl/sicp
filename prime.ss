(load "square.ss")

(define (find-divisor-1 test-divisor n)
    (if (= (remainder n test-divisor) 0)
        test-divisor
        (if (> (square test-divisor) n)
            n
            (find-divisor (+ test-divisor 1) n)
        )
    )
)

(define (find-divisor test-divisor n)
    (if (= (remainder n test-divisor) 0)
        test-divisor
        (if (> (square test-divisor) n)
            n
            (find-divisor (next test-divisor) n)
        )
    )
)

(define (next test-divisor)
    (if (= test-divisor 2)
        3
        (+ test-divisor 2)
    )
)

(define (smallest-divisor n) (find-divisor 2 n))

(define (prime? n)
    (= (smallest-divisor n) n)
)

(define (search-for-prime number n)
    (define (search-iter number n)
        (if (= n 0)
            (void)
            (if (prime? number)
                (begin (display number) (time (prime? number)) (search-iter (+ number 1) (- n 1)))
                (search-iter (+ number 1) n)
            )
        )
    )
    (search-iter (+ number 1) n)
)
        