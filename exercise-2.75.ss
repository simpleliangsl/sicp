(top-level-program

    (import (rnrs) (complex-number))

    (define c1 (make-from-real-imag 1 2))

    (define c2 (make-from-mag-ang (c1 'magnitude) (c1 'angle)))

    (assert (equal? 1 (c1 'real-part)))
    (assert (equal? 2 (c1 'imag-part)))
    (assert (equal? 1 (c2 'real-part)))
    (assert (equal? 2 (c2 'imag-part)))
)