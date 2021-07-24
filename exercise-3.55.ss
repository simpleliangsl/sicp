(top-level-program
    (import (simple-stream) (rnrs))

    (define (partial-sums stream)
        (define (iter a s)
            (let ([result (+ a (stream-car s))])
                (cons-stream result (iter result (stream-cdr s)))
            )
        )
        (iter 0 stream)
    )

    ; Test Here:
    (define ones (cons-stream 1 ones))
    (define integers (cons-stream 1 (add-streams ones integers)))

    (define sums (partial-sums integers))

    (assert (= 1 (stream-ref sums 0)))
    (assert (= 3 (stream-ref sums 1)))
    (assert (= 6 (stream-ref sums 2)))
    (assert (= 10 (stream-ref sums 3)))
    (assert (= 15 (stream-ref sums 4)))
    (display "Well done")
)