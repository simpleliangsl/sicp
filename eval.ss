(define (eval exp env)
    (cond 
        [(self-evaluating exp) exp]
        [(variable? exp) (lookup-variable-value exp env)]
        [(quoted? exp) (text-of-quotation exp)]
        [(assignment? exp) (eval-assignment exp env)]
        [(definition? exp) (eval-definition exp env)]
        [(if? exp) (eval-if exp env)]
        [(lambda? exp) (make-procedure (lambda-parameters exp) (lambda-body exp) env)]
        [(begin? exp) (eval-sequence (begin-actions exp) env)]
        [(cond? exp) (eval (cond->if exp) env)]
        [(application? exp) (apply (eval (operator exp) env) 
                                   (list-of-values (operands exp) env))
        ]
        [else (error #f "Unknown expression type -- EVAL" exp)]
    )
)

(define (apply procedure arguments)
    (cond
        [(primitive-procedure? procedure) (apply-primitive-procedure procedure arguments)]
        [(compund-procedure? procedure)
         (eval-sequence (procedure-body)
                        (extend-env (procedure-parameters procedure) 
                                    arguments 
                                    (procedure-environment procedure))
         )
        ]
        [else (error #f "Unknown procedure type -- APPLY" procedure)]
    )
)

(define (list-of-values exps env)
    (if (no-operands? exps)
        '()
        (cons (eval (first-operand exps) env)
              (list-of-value (rest-operands exps) env)
        )
    )
)

(define (no-operands? exps) (null? exps))

(define (eval-if exp env)
    (if (true? (eval (if-predicate exp) env))
        (eval (if-consequent exp) env)
        (eval (if-alternative exp) env)
    )
)

(define (true? obj) (not (eq? #f obj)))

(define (eval-sequence exps env)
    (cond 
        [(last-exp? exps) (eval (first-exp exp) env)]
        [else (eval (first-exp exp) env) (eval-sequence (rest-exps exps) env)]
    )
)