(load "fold-left.ss")

(display (fold-right / 1 (list 1 2 3))) ; 3/2
(newline)

(display (fold-left / 1 (list 1 2 3))) ; 1/6
(newline)

(display (fold-right list '() (list 1 2 3))) ; (1 (2 (3 '())))
(newline)

(display (fold-left list '() (list 1 2 3))) ; ((('() 1) 2) 3)
(newline)