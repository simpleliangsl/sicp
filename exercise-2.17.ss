(define (last-pair items)
    (if (null? (cdr items))
        (car items)
        (last-pair (cdr items))
    )
)

; (last-pair (list 2 3)) => 3
; (last-pair (list 2 3 17)) => 17