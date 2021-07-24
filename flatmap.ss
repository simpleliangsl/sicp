(load "accumulate-sequence.ss")

(define (flatmap proc sequence)
    (accumulate append '() (map proc sequence))
)