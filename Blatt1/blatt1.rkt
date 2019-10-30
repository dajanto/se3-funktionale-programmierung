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
(define (my-acos cosinusRadians)
  ; tangens berechnen
  (define tangensRadians (/ (sqrt (- 1
                                     (sqr cosinusRadians)))
                            cosinusRadians))
  ; tangens an atan übergeben und somit acos erhalten
  (atan tangensRadians)
  )

; 1.3 Kilometer und Seemeilen
(define (nm->km nm)
  (define km (* 1.852 nm))
  km
  )

; 2.1 Großkreisentfernung
(define (distanzAB breiteA breiteB laengeA laengeB)
  ; TODO Stil
  (define z (+ (* (sin (degrees->radians breiteA)) (sin (degrees->radians breiteB)))
               (* (cos (degrees->radians breiteA)) (cos (degrees->radians breiteB)) (cos (- (degrees->radians laengeA) (degrees->radians laengeB))))))
    (nm->km
       (* 60 (radians->degrees (my-acos z))))
    )

  ; Oslo->Hongkong
  ; (distanzAB 59.93 22.20 10.75 114.10)
  ; 8589.41

  ; San Francisco->Honolulu
  ; (distanzAB 37.75 21.32 -122.45 -157.83)
  ; 3844.68

  ; Osterinsel -> Lima
  ; (distanzAB -27.1 -12.1 -109.4 -77.05)
  ; 3757.62

  ; 2.2 Anfangskurs

  ; 2.3 Himmelsrichtungen