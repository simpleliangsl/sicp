(load "exercise-2.40.ss")

(define (three-num-tuples n sum)

    (filter (lambda (tuple) (equal? (accumulate + 0 tuple) sum))
            (flatmap (lambda (p) 
                    (map (lambda (i) (cons i p)) 
                         (enumerate-interval 1 (- (car p) 1))
                    )
                 ) 
                 (unique-pairs n)
            )    
    )
)