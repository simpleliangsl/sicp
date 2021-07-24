(define (lookup given-key set-of-records)
    (if (null? set-of-records) 
        #f
        (if (equal? given-key (key (car set-of-records))
            (car set-of-records)
            (lookup given-key (cdr set-of-records))
        )
    )
)