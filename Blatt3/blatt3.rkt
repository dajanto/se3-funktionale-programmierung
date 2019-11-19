#lang racket

; Aufgabe 1 Internationale Buchstabiertafel 

; 1.1 Datenstruktur 
(define buchstabiertafel (hash
                          #\A 'Alfa	
                          #\B 'Bravo	
                          #\C 'Charlie	
                          #\D 'Delta
                          #\, 'Decimal
                          #\. 'Stop
                          ))

; Erklärung:
; 
; 
; 

; 1.2 Codierungsfunktion
(define (buchstabeAbbilden buchstabe)
  (hash-ref buchstabiertafel buchstabe)
  )

; 1.3 Zusatz
(define (alleBuchstabenAbbilden buchstabe)
  
  (define charInt (char->integer buchstabe))
  
  (cond
    [(and (>= charInt 65)
          (<= charInt 90)) (buchstabeAbbilden buchstabe)]
    [(and (>= charInt 97)
          (<= charInt 122)) (buchstabeAbbilden (integer->char (-(char->integer buchstabe) 32)))]
    [(= charInt 44) (buchstabeAbbilden buchstabe)]
    [(= charInt 46) (buchstabeAbbilden buchstabe)]))


; 1.4 Buchstabieren 
(define (buchstabieren string)

  (define liste (string->list string))
 
  (cond
    [(empty? liste)]
    [else (list (alleBuchstabenAbbilden (car liste)))
          (buchstabieren (list->string(cdr liste)))])
  )


; Aufgabe 2 Internationales Flaggenalphabet

; 2.1 Datenstruktur 

; 2.2 Codierungsfunktion

; 2.3 Buchstabieren 
