#lang racket
(require se3-bib/flaggen-module)

; Aufgabe 1 Internationale Buchstabiertafel

(require se3-bib/flaggen-module)

; 1.1 Datenstruktur 
(define buchstabiertafel (hash
                          #\A 'Alfa	
                          #\B 'Bravo	
                          #\C 'Charlie	
                          #\D 'Delta
                          #\E 'Echo
                          #\F 'Foxtrott
                          #\G 'Golf
                          #\H 'Hotel
                          #\I 'India
                          #\J 'Juliett
                          #\K 'Kilo
                          #\L 'Lima
                          #\M 'Mike
                          #\N 'November
                          #\O 'Oscar
                          #\P 'Papa
                          #\Q 'Quebec
                          #\R 'Romeo
                          #\S 'Sierra
                          #\T 'Tango
                          #\U 'Uniform
                          #\V 'Viktor
                          #\W 'Whiskey
                          #\X 'X-ray
                          #\Y 'Yankee
                          #\Z 'Zulu
                          #\0 'Nadazero
                          #\1 'Unaone
                          #\2 'Bissotwo
                          #\3 'Terrathree
                          #\4 'Kartefour
                          #\5 'Pandafive
                          #\6 'Soxisix
                          #\7 'Setteseven
                          #\8 'Oktoeight
                          #\9 'Novenine
                          #\, 'Decimal
                          #\. 'Stop
                          ))


; Es gibt keine gute Alternative zur Hashtable, wenn es um eine 1:1 Zuordnung geht (Buchstabe, Schlüssel). 
; Bei z.B. einer Liste mit Tupeln wäre es schwieriger den passenden Schlüssel zu einem Buchstaben anzufordern.


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
          (<= charInt 122)) (buchstabeAbbilden (integer->char (- (char->integer buchstabe)
                                                                 32)))]
    [(= charInt 44) (buchstabeAbbilden buchstabe)]
    [(= charInt 46) (buchstabeAbbilden buchstabe)]))


; 1.4 Buchstabieren 
(define (buchstabieren string)

  (define liste (string->list string))
  (cond
    [(empty? liste) '()]
    [else  (write (alleBuchstabenAbbilden(car liste)))
           (buchstabieren (list->string(cdr liste)))])
  )

;Aufgabe 2 Internationales Flaggenalphabet

; 2.1 Datenstruktur
(define Flaggenalfabet(hash
         "A" A
         "B" B
         "C" C
         "D" D
         "E" E
         "F" F
         "G" G
         "H" H
         "I" I
         "J" J
         "K" K
         "L" L
         "M" M
         "N" N
         "O" O
         "P" P
         "Q" Q
         "R" R
         "S" S
         "T" T
         "U" U
         "V" V
         "W" W
         "X" X
         "Y" Y
         "Z" Z
         "0" Z0
         "1" Z1
         "2" Z2
         "3" Z3
         "4" Z4
         "5" Z5
         "6" Z6
         "7" Z7
         "8" Z8
         "9" Z9)
  )
; 2.2 Codierungsfunktion

(define (FlaggenAbbilden value)
  (hash-ref Flaggenalfabet value))

; 2.3 Buchstabieren

(define (buchstabieren2 str)
  (for-each Codierungsfunktion (string->list str)))
