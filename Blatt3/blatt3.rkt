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
(define (klein->groß buchstabe)
  (cond
    [(and (>= (char->integer buchstabe) 65)
          (<= (char->integer buchstabe) 90)) (buchstabeAbbilden buchstabe)]
    [(and (>= (char->integer buchstabe) 97)
          (<= (char->integer buchstabe) 122)) (buchstabeAbbilden (integer->char (-(char->integer buchstabe) 32)))]
    [(= (char->integer buchstabe) 44) (buchstabeAbbilden buchstabe)]
    [(= (char->integer buchstabe) 46) (buchstabeAbbilden buchstabe)]))


; 1.4 Buchstabieren 



; Aufgabe 2 Internationales Flaggenalphabet

; 2.1 Datenstruktur 

; 2.2 Codierungsfunktion

; 2.3 Buchstabieren 
