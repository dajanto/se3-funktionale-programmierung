#lang racket
(define (hoch2 x) (* x x x x))

(define (asdf x) x)

(define *a* 10)
(define *b* '*a*)


(define listlist '(1 2 3 4 5))
(define (asdfasdf xs)
  (map (lambda(x) (* x x)) xs))

(define (multi x y)
  (lambda(x y) (* x y)))

(multi 5 6)
(asdfasdf listlist)

(define (test x)
(let((x (+ x *a*)))
(+ x 2)))

(test 4)

(cons 3 '())


(define (ho xs)
  (map length (filter (lambda(x) (> (length x) 3)) xs)))

;(ho '((1) (2 3) (1 2 2 2 2)))
;(hohoho '((1) (2 3) (1 2 2 2 2)))

(define paarliste '((1 . 2) (2 . 4) (3 . 5)))
(define (p x)
  (map car x))

(p paarliste)

(define paar (list 4 5 6 7 1 2))

(define (xysum xs)
  (foldl + 0 
  )
  ) ((lambda (x) (* x x)) 2)


(define (ll xs)
  (if (empty? xs)
  0
  (+ (ll(cdr xs)) 1)))


(ll '( 1 1 1 1 1 1))

(define (lll xs acc)
  (if (empty? xs)
  acc
  (lll (cdr xs) (+ 1 acc))))

(lll '(1 23 4) 0)
