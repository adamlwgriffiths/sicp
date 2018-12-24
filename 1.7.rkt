#lang sicp

#|
Exercise 1.7:
The good-enough? test used in computing square roots will not be very effective
for finding the square roots of very small numbers.
Also, in real computers, arithmetic operations are almost always performed with
limited precision.
This makes our test inadequate for very large numbers.
Explain these statements, with examples showing how the test fails for
small and large numbers.
An alternative strategy for implementing good-enough? is to watch how guess
changes from one iteration to the next and to stop when the change is a
very small fraction of the guess.
Design a square-root procedure that uses this kind of end test.
Does this work better for small and large numbers?
|#

(define (square x) (* x x))

(define (average x y)
  (/ (+ x y) 2))

(define (improve guess x)
  (average guess (/ x guess)))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
    guess
    (sqrt-iter (improve guess x) x)))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(sqrt 0.00000001)
;     -> 0.03125010656242753
; actual 0.0001
(sqrt 0.0001)
;     -> 0.03230844833048122
; actual 0.01
(sqrt 0.5)
;     -> 0.7071078431372548
; actual 0.7071067811865475
(sqrt 1)
;     -> 1.0
; actual 1.0
(sqrt 2)
;     -> 1.4142156862745097
; actual 1.4142135623730950
(sqrt 4)
;     -> 2.0000000929222947
; actual 2
(sqrt 256)
;     -> 16.00000352670594
; actual 16
(sqrt 1234567890)
;     -> 35136.41828645232
; actual 35136.41828644462
(sqrt 12345678901234567890)
;     -> 3513641828.820144
; actual 3513641828.820144
;;(sqrt 99999999999999999999999999999)
;     -> doesn't end
; actual 316227766016837.93319988935444169

; the delta used in `good-enough` is not related to the value being determined.
; as such the delta is too large for small values and causes the algorithm to
; exit early.
; for large numbers, the loss of precision will result in the estimate
; not coming close enough to the `good-enough` delta to meet the termination
; conditions.

(define delta+ 0.001)

(define (good-enough+? new-guess last-guess)
  (< (abs (- new-guess last-guess)) delta+))

(define (sqrt+-iter current-guess last-guess x)
  (if (good-enough+? current-guess last-guess)
    current-guess
    (sqrt+-iter (improve current-guess x) current-guess x)))

(define (sqrt+ x)
  (sqrt+-iter 1.0 x x))

(sqrt+ 0.00000001)
;     -> 0.0009799734463768973
; actual 0.0001
(sqrt+ 0.0001)
;     -> 0.010000714038711746
; actual 0.01
(sqrt+ 0.5)
;     -> 0.7071067811873449
; actual 0.7071067811865475
(sqrt+ 1)
;     -> 1.0
; actual 1.0
(sqrt+ 2)
;     -> 1.4142135623746899
; actual 1.4142135623730950
(sqrt+ 4)
;     -> 2.0000000929222947
; actual 2
(sqrt+ 256)
;     -> 16.00000000000039
; actual 16
(sqrt+ 1234567890)
;     -> 35136.41828644462
; actual 35136.41828644462
(sqrt+ 12345678901234567890)
;     -> 3513641828.820144
; actual 3513641828.820144
(sqrt+ 99999999999999999999999999999)
;     -> 316227766016837.9
; actual 316227766016837.93319988935444169
