(top-level-program

    (import (rnrs) (huffman))

    (define huffman-tree (generate-huffman-tree '((A 4) (B 2) (D 1) (C 1))))

    (define sample-message '(A D A B B C A))

    (display (encode sample-message huffman-tree)) ; (0 1 1 0 0 1 0 1 0 1 1 1 0)
    (newline)

    (define sample-codes '(0 1 1 0 0 1 0 1 0 1 1 1 0))

    (display (decode sample-codes huffman-tree)) ; (A D A B B C A)
    (newline)
)