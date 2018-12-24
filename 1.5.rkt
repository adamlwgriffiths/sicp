#lang sicp

#|
Exercise 1.5:
Ben Bitdiddle has invented a test to determine whether the interpreter
he is faced with is using applicative order evaluation or normal-order evaluation.
He deﬁnes the following two procedures:
(define (p) (p))
(define (test x y)
  (if (= x 0) 0 y))

Then he evaluates the expression
(test 0 (p))

What behavior will Ben observe with an interpreter that uses applicative-order evaluation?
What behavior will he observe with an interpreter that uses normal-order evaluation?
Explain your answer.
Assume that the evaluation rule for the special form if is the same whether the
interpreter is using normal or applicative order:
The predicate expression is evaluated fist, and the result determines
whether to evaluate the consequent or the alternative expression.
|#

; applicative-order execution will fully evaluate the operator and the operands
; prior to applying the arguments to the operator.

; normal-order will expand the operator and substitute the operands in the operators
; prior to evaluating.

; applicative order will result in the code never halting as p is recursively
; evaluated.

; normal-order will result in 0, as p is never evaluated.
