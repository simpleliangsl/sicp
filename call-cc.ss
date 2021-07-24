(define retry #f)

(define z  1)

(define factorial
  (lambda (x)
    (if (= x 0)
        (call/cc (lambda (k) (set! retry k) 1))
        (* z x (factorial (- x 1))))))


(define (fc x)
  (define y 3)
  (define t 
    (lambda (x)
      (call/cc (lambda (k) (set! retry k)))
      (set! y (+ y 1))
      y
    )
  )
  (define (set-y value)
    (set! y value)
  )
  (define (dispatch msg)
    (cond [(eq? msg 'set-y) set-y]
          [(eq? msg 't) t]
    )
  )
  dispatch
)

(+ 1 (factorial 4))

; (display "hello")

;(define d (fc 1))
;(define t (d 't))
;(define (tt x) (t 1) x)
;(display (tt 3))
;(newline)

;((d 'set-y) 5)
;(display (retry 1))
