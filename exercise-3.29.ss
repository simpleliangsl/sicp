(load "digital-signal.ss")

(define (or-gate a1 a2 output)

    ; (not (and (not a1) (not a2)))

    (let ([o1 (make-wire)]
          [o2 (make-wire)]
          [o3 (make-wire)]
         )
         (inverter a1 o1)
         (inverter a2 o2)
         (and-gate o1 o2 o3)
         (inverter o3 output)
    )

    'ok
)