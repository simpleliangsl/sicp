(load "prime-fast.ss")

; Carmichael numbers: 561, 1105, 1729, 2465, 2821, 6601
(define (full-fermat-test n)
    (define (try a)
        (if (> (square a) n)
            #t
            (if (= (expmod a n n) a)
                (try (+ a 1))
                #f
            )
        )
    )
    (try 2)
)