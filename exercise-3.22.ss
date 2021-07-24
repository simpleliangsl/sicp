(define (make-queue)
    (let ([front-ptr '()]
          [rear-ptr '()]
         )
        
        (define (empty?) (null? front-ptr))

        (define (front)
            (if (empty?)
                (error #f "FRONT called with empty queue")
                (car front-ptr)
            )
        )

        (define (insert! item)
            (let ([new-pair (cons item '())])
                (if (empty?)
                    (begin (set! front-ptr new-pair) (set! rear-ptr new-pair))
                    (begin (set-cdr! rear-ptr new-pair) (set! rear-ptr new-pair))
                )
                front-ptr
            )
        )

        (define (delete!)
            (if (empty?)
                (error #f "DELETE called with empty queue")
                (set! front-ptr (cdr front-ptr))
            )
            front-ptr
        )

        (define (dispatch message)
            (cond
                [(eq? message 'front-ptr) front-ptr]
                [(eq? message 'rear-ptr) rear-ptr]
                [(eq? message 'front) front]
                [(eq? message 'empty?) empty?]
                [(eq? message 'insert!) insert!]
                [(eq? message 'delete!) delete!]
            )
        )

        dispatch
    )
)