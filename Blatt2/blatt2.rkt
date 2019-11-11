#lang racket
(define wuff 'Flocki)
(define Hund wuff)
(define Wolf 'wuff)

(define (welcherNameGiltWo PersonA PersonB)
  (let ((PersonA 'Zaphod)
        (PersonC PersonA))
    PersonC))

(define xs1 '(0 2 3 wuff Hund))
(define xs3 (list wuff Hund))
(define xs2 (cons Hund wuff))

; Aufgabe 1 Symbole und Werte, Umgebungen
; Siehe .txt

; Aufgabe 2 Rechnen mit exakten Zahlen

; 2.1 Die Fakultät einer Zahl

; 2.2 Potenzen von Rationalzahlen

; 2.3 Die Eulerzahl

; 2.4 PI

; Aufgabe 3 Typprädikate

