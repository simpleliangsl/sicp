; (derivate expression variable)
(define (deriv exp var)

    (cond ((number? exp) 0)

          ((variable? exp) (if (same-variable? exp var) 1 0))

          ((sum? exp) 
           (make-sum (deriv (addend exp) var) 
                     (deriv (augend exp) var)
           )
          )

          ((product? exp)
           (make-sum (make-product (multiplier exp) (deriv (multiplicand exp) var))
                     (make-product (multiplicand exp) (deriv (multiplier exp) var))
           )
          )

          ((exponentiation? exp)
            (let ((u (base exp)) (n (exponent exp)))
                (make-product n (make-product (make-exponentiation u (- n 1)) (deriv u var))
                )
            )
          )

          (else (errorf #f "Unknown expression ~s" exp))
    )
)

(define (variable? x) (symbol? x))

(define (same-variable? v1 v2) 
    (and (variable? v1) (variable? v2) (eq? v1 v2))
)

(define (make-sum a1 a2)
    (cond ((=number? a1 0) a2)
          ((=number? a2 0) a1)
          ((and (number? a1) (number? a2)) (+ a1 a2))
          (else (list '+ a1 a2))
    )
)

(define (=number? exp num) (and (number? exp) (= exp num)))

(define (make-product a1 a2)
    (cond ((or (=number? a1 0) (=number? a2 0)) 0)
          ((=number? a1 1) a2)
          ((=number? a2 1) a1)
          ((and (number? a1) (number? a2)) (* a1 a2))
          (else (list '* a1 a2))
    )
)

(define (sum? x) (and (pair? x) (eq? (car x) '+)))

(define (addend s) (cadr s))

(define (augend s)
    (let ( (rest (cddr s)) )
        (if (null? (cdr rest)) ; only one item left
            (car rest)
            (cons '+ rest)
        )
    )
)

(define (product? x) (and (pair? x) (eq? (car x) '*)))

(define (multiplier p) (cadr p))

(define (multiplicand p) 
    (let ( (rest (cddr p)) )
        (if (null? (cdr rest)) ; only one item left
            (car rest)
            (cons '* rest)
        )
    )
)

(define (exponentiation? x) (and (pair? x) (eq? (car x) '**)))

(define (base x) (cadr x))

(define (exponent x) (caddr x))

(define (make-exponentiation base exponent)
    (cond ((= exponent 0) 1)
          ((= exponent 1) base)
          (else (list '** base exponent))
    )
)
