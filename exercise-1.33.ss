(define (filtered-accumulate filter combiner null-value term a next b)
    (if (> a b)
        null-value
        (if (filter a)
            (combiner (term a) (filtered-accumulate filter combiner null-value term (next a) next b))
            (filtered-accumulate filter combiner null-value term (next a) next b)
        )
    )
)