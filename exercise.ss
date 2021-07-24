(define (square x) (* x x))

; exercise 1.3
(define (max a b c) 
    (if (< a b) (if (< b c) c b) (if (< a c) c a)))

; exercise 1.5
(define (p) (p))
(define (test x y)
    (if (= x 0) 0 y))

; exercise 1.11
(define (f1 n)
    (if (< n 3)
        n
        (+ (f1 (- n 1))
           (* (f1 (- n 2)) 2)
           (* (f1 (- n 3)) 3)
        )
    )
)

(define (f2 n)
    (define (f2-iter n0 n1 n2 n)
        (if (< n 3)
            n2
            (f2-iter n1 n2 (+ n2 (* 2 n1) (* 3 n0)) (- n 1))
        )
    )
    (if (< n 3)
        n
        (f2-iter (f2 0) (f2 1) (f2 2) n)
    )
)

; exercise 1.15
(define p-counter 0) ; just for calculate how many times p is callded
(define (sine angle)
    (define (cube x) (* x x x))
    (define (p x) (set! p-counter (+ p-counter 1)) (- (* 3 x) (* 4 (cube x))))
    (if (<= (abs angle) 0.1)
        angle
        (p (sine (/ angle 3.0)))
    )
)

; exercise 1.16
(define (expt-v1 b n)
    (if (= n 0)
        1
        (* b expt (- n 1))
    )
)

(define (expt-v2 b n)
    (define (iter product counter)
        (if (= n 0)
            product
            (iter (* b product) (- counter 1))
        )
    )
    (iter 1 n)
)

(define (expt-fast-v1 b n)
    (cond ((= n 0) 1)
          ((even? n) (square (expt-fast-v1 b (/ n 2))))
          (else (* b (expt-fast-v1 b (- n 1))))
    )
)

(define (expt-fast-v2 b n)
    (define (iter b n a)
        (if (= n 0)
            a
            (if (even? n)
                (iter (square b) (/ n 2) a)
                (iter b (- n 1) (* b a))
            )
        )
    )
    (iter b n 1)
)

; exercise 1.17
(define (*-v1 a b)
    (if (= b 0)
        0
        (+ a (*-v1 a (- b 1)))
    )
)

(define (*-v2 a b)
    (define (iter result counter)
        (if (= counter 0)
            result
            (iter (+ a result) (- counter 1))
        )
    )
    (iter 0 b)
)

(define (double x) (+ x x))
(define (halve x) (/ x 2))

(define (*-fast-v1 a b)
    (if (= b 0)
        0
        (if (even? b)
            (double (*-fast-v1 a (halve b)))
            (+ a (*-fast-v1 a (- b 1)))
        )
    )
)

(define (*-fast-v2 a b)
    (define (iter a b result)
        (if (= b 0)
            result
            (if (even? b)
                (iter (double a) (halve b) result)
                (iter a (- b 1) (+ a result))
            )

        )
    )
    (iter a b 0)
)

; exercise 1.21
