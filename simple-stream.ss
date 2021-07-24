(library (simple-stream)

    (export cons-stream
            stream-car 
            stream-cdr 
            empty-stream?
            EMPTY-STREAM
            stream-filter
            stream-map 
            stream-for-each 
            stream-ref
            stream-head
            stream-enumerate-interval
            add-streams
    )

    (import (rnrs) (rnrs r5rs))

    (define-syntax cons-stream
        (syntax-rules ()
            [(_ x y) (cons x (memo-proc (delay y)))]
        )
    )

    (define (stream-car z) (car z))

    (define (stream-cdr z) (force (cdr z)))

    (define (memo-proc proc)
        (let ([already-run? #f] [result '()])
            (lambda ()
                (if already-run?
                    result
                    (begin
                        (set! already-run? #t)
                        (set! result (proc))
                        result
                    )
                )
            )
        )
    )

    (define EMPTY-STREAM '())

    (define (empty-stream? stream) (eq? EMPTY-STREAM stream))

    (define (stream-filter pred stream)
        (if (empty-stream? stream)
            EMPTY-STREAM
            (let ([item (stream-car stream)])
                (if (pred item)
                    (cons-stream item (stream-filter pred (stream-cdr stream)))
                    (stream-filter pred (stream-cdr stream))
                )
            )
        )
    )

    (define (stream-map proc stream)
        (if (empty-stream? stream)
            EMPTY-STREAM
            (cons-stream (proc (stream-car stream)) 
                        (stream-map proc (stream-cdr stream))
            )
        )
    )

    (define (stream-for-each proc stream)
        (if (empty-stream? stream)
            'DONE
            (begin
                (proc (stream-car stream))
                (stream-for-each proc (stream-cdr stream))
            )
        )
    )

    (define (stream-ref stream n)
        (if (= n 0)
            (stream-car stream)
            (stream-ref (stream-cdr stream) (- n 1))
        )
    )

    (define (stream-head stream n)
        (if (or (<= n 0) (empty-stream? stream))
            '()
            (cons (stream-car stream)
                  (stream-head (stream-cdr stream) (- n 1))
            )
        )
    )

    (define (stream-enumerate-interval low high)
        (if (> low high)
            EMPTY-STREAM
            (cons-stream low 
                        (stream-enumerate-interval (+ low 1) high)
            )
        )
    )

    (define (add-streams s1 s2)
        (cond [(empty-stream? s1) s2]
              [(empty-stream? s2) s1]
              [else
                (cons-stream (+ (stream-car s1) (stream-car s2))
                             (add-streams (stream-cdr s1) (stream-cdr s2))
                )
              ]
        )
    )

    (define (scale-stream stream factor)
        (stream-map (lambda (x) (* x factor)) stream)
    )
)