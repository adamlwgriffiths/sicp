#lang sicp

#|
Exercise 1.6:
Alyssa P. Hacker doesn't see why if needs to be provided as a special form.
"Why can't I just deﬁne it as an ordinary procedure in terms of cond?"
she asks.
Alyssa's friend Eva Lu Ator claims this can indeed be done, and she deﬁnes a
new version of if:
(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

Eva demonstrates the program for Alyssa:
(new-if (= 2 3) 0 5)
5
(new-if (= 1 1) 0 5)
0

Delighted, Alyssa uses new-if to rewrite the square-root program:
(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
    guess
    (sqrt-iter (improve guess x) x)))

What happens when Alyssaa attempts to use this to compute square roots? Explain.
|#

; Assuming the interpreter is using applicative-order evaluation, it will
; expand all branches (arguments) of the if expression which will cause
; infinite recursion.
