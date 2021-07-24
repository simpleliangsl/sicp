(top-level-program

    (import (chezscheme) (huffman))

    (define pairs '((A 2) (NA 16) (BOOM 1) (SHA 3) (GET 2) (YIP 9) (JOB 2) (WAH 1)) )

    (define huffman-tree (generate-huffman-tree pairs))

    (define message '(
        GET A JOB
        SHA NA NA NA NA NA NA NA NA
        GET A JOB
        SHA NA NA NA NA NA NA NA NA
        WAH YIP YIP YIP YIP YIP YIP YIP YIP YIP
        SHA BOOM
    ))

    (define codes (encode message huffman-tree))

    (display codes)
    (newline)

    (display (format "length of codes: ~a" (length codes)))
    (newline)

    (display (format "length of fixed codes: ~a" (* (log (length pairs) 2) (length message))))
)