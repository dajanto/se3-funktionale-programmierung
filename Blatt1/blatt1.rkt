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
(define (my-acos x)
  (define y (degrees->radians x)) 
  (define newTan (/ (sin y) (cos y)))
  ;(radians->degrees (atan newTan))
  )
