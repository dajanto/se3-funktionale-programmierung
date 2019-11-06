#lang racket
(define wuff 'Flocki)
(define Hund wuff)
(define Wolf 'wuff)

(define (welcherNameGiltWo PersonaA PersonB)
  (let ((PersonA 'Zaphod)
      (PersonC PersonaA))
    PersonC))

(define xs1 '(0 2 3 wuff Hund))
(define xs3 (list wuff Hund))
(define xs2 (cons Hund wuff))