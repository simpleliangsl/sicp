
(define-syntax z
  (syntax-rules (and)
    ( (z (and x y)) (and y x) )
  )
)

(define-syntax c
  (syntax-rules ()
    [(c (o n m)) (o m n)]
  )
)

(define command (command-line-arguments))
(display command)
;(exit)()