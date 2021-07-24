(define (make-mobile left right)
    (list left right)
)

(define (left-branch mobile)
    (car mobile)
)

(define (right-branch mobile)
    (car (cdr mobile))
)

(define (make-branch length structure)
    (list length structure)
)

(define (branch-length branch)
    (car branch)
)

(define (branch-structure branch)
    (car (cdr branch))
)

(define (branch-weight branch)
    (let ((mobile (branch-structure branch)))
        (if (pair? mobile) ; is it mobile?
            (total-weight mobile)
            mobile ; it is a number of weight
        )
    )
)

(define (total-weight mobile)
    (+ (branch-weight (left-branch mobile))
       (branch-weight (right-branch mobile))    
    )
)

(define (branch-torque branch)
    (* (branch-length branch) (branch-weight branch))
)

(define (balanced? mobile)
    (equal? (branch-torque (left-branch mobile))
            (branch-torque (right-branch mobile))
    )
)

; TEST ----------------------------------------------------
(define left-mobile (make-mobile (make-branch 1 12) (make-branch 2 13)))
(define left (make-branch 2 left-mobile))
(define right (make-branch 5 10))
(define mobile (make-mobile left right))

