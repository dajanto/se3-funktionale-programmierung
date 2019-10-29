#lang racket

; 1.1 Bogenmaß und Grad
(define (degrees->radians degrees)
  ; Gradzahlen -> Bogenmaß
  (* degrees (/ pi 180))
  )

(define (radians->degrees radians)
  ; Bogenmaß -> Gradzahl
  (* radians (/ 180 pi))
  )

; 1.2 Umkehrfunktion
; TODO Nicht alle Results stimmen
(define (my-acos cosinus)
  ; cosinus (degrees) zu radians
  (define cosinusRadians (degrees->radians cosinus)) 
  ; tangens berechnen
  (define tangensRadians (/ (sin cosinusRadians) (cos cosinusRadians)))
  ; tangens an atan übergeben und somit acos erhalten
  (atan tangensRadians)
  )

; 1.3 Kilometer und Seemeilen
(define (nm->km nm)
  (define km (* 1.852 nm))
  km
  )

; 2.1 Großkreisentfernung
(define (distanzAB a b)
  a
  )

; Oslo->Hongkong
; San Francisco_>Honolulu
; Osterinsel->Lima

; 2.2 Anfangskurs

; 2.3 Himmelsrichtungen