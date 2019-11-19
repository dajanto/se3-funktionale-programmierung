#lang racket

; Aufgabe 1 Internationale Buchstabiertafel 

; 1.1 Datenstruktur 
(define buchstabiertafel (hash
                          #\A 'Alfa	
                          #\B 'Bravo	
                          #\C 'Charlie	
                          #\D 'Delta)	
  )

; Erklärung:
; 
; 
; 

; 1.2 Codierungsfunktion
(define (buchstabeAbbilden buchstabe)
  (hash-ref buchstabiertafel buchstabe)
  )

; 1.4 Buchstabieren 



; Aufgabe 2 Internationales Flaggenalphabet

; 2.1 Datenstruktur 

; 2.2 Codierungsfunktion

; 2.3 Buchstabieren 
