(load "enumerate-interval.ss")
(load "flatmap.ss")
(load "prime.ss")

(define (unique-pairs n)
    (flatmap (lambda (i) 
                (map (lambda (j) (list j i)) 
                     (enumerate-interval 1 (- i 1)))
             )
             (enumerate-interval 1 n)
    )
)

(define (prime-sum-pairs n)

    (define (prime-sum? pair)
        (prime? (+ (car pair) (cadr pair)))
    )

    (define (make-pair-sum pair)
        (append pair 
                (list (+ (car pair) (cadr pair)))
        )
    )

    (map make-pair-sum (filter prime-sum? (unique-pairs n)))
)