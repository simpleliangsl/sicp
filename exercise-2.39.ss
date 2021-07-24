(load "fold-left.ss")

(define (reverse-1 sequence)
    (fold-right (lambda (x y) (append y (list x))) '() sequence)
)

(define (reverse-2 sequence)
    (fold-left (lambda (x y) (cons y x)) '() sequence)
)