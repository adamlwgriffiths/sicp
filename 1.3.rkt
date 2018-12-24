#lang sicp

#|
Exercise 1.3:
Deﬁne a procedure that takes three numbers as arguments
and returns the sum of the squares of the two larger numbers.
|#

(define (biggest-squares x y z)
  (+
    (if (> x y)
      (* x x)
      (* y y))
    (if (> y z)
      (* y y)
      (* z z))))

(biggest-squares 3 4 5)
; -> 41
