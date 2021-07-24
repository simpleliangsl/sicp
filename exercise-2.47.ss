; One implement of constructor and selectors

(define (make-frame origin edge1 edge2)
    (list origin edge1 edge2)
)

(define (origin-frame frame)
    (car frame)
)

(define (edge1-frame frame)
    (cadr frame)
)

(define (edge2-frame frame)
    (caddr frame)
)

; The other implement of constructor and selectors

(define (make-frame origin edge1 edge2)
    (cons origin (cons edge1 dege2))
)

(define (origin-frame frame)
    (car frame)
)

(define (edge1-frame frame)
    (cadr frame)
)

(define (edge2-frame frame)
    (cddr frame)
)