#lang sicp

#|
Exercise 1.4:
Observe that our model of evaluation allows for combinations
whose operators are compound expressions.
Use this observation to describe the behavior of the following procedure:
(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))
|#

; adds the absolute value of b to a
; if b is great than zero, then b is added to a
; if b is less than or equal to zero, then b is subtracted from a
