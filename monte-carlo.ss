(define (monte-carlo trials experiment)

    (define (iter trials-remaining trials-passed)
        (if (= trials-remaining 0)
            (/ trials-passed  trials 1.0)
            (if (experiment)
                (iter (- trials-remaining 1) (+ trials-passed 1))
                (iter (- trials-remaining 1) trials-passed)
            )
        )
    )

    (iter trials 0)
)