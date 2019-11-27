#lang racket


; Aufgabe 1 Internationale Buchstabiertafel


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
  (hash-ref buchstabiertafel buchstabe))

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
    [(= charInt 46) (buchstabeAbbilden buchstabe)]
    [else buchstabe]))


; 1.4 Buchstabieren 
(define (buchstabieren string)

  (define liste (string->list string))
  (cond
    [(empty? liste) '()]
    [else  (cons (buchstabeAbbilden(car liste))
           (buchstabieren (list->string(cdr liste))))])
  )

;(if (empty? list)
;    '()
;    (cons (+ 1 (car list)) (function (cdr list))))       <---- die bessere Lösung
;                                                         <---- cons verbindet die beiden Teile der Liste die man getrennt hat



; Aufgabe 1 Auswertung von Ausdrücken

; Eingaben:
; (max(min 2(- 2 5))0)
; '(+ (- 2 13)2)
; (cadr '(Alle Jahre wieder))
; (cddr '(kommt (das Weihnachtsfest)))
; (cons 'Listen '(ganz einfach und))
; (cons 'Paare 'auch)
; (equal? (list 'Racket 'Prolog 'Java) '(Racket Prolog Java))
; (eq? (list 'Racket 'Prolog 'Java) (cons 'Racket '(Prolog Java)))


; Aufgabe 2 Textgenerierung

; 2.1
; Backus-Naur-Form

;0 <Seenot> ::= <Überschrift> <Standortangabe> <Art des Unfalls> <Angaben zur Hilfeleistung> <Peilzeichen> <Unterschrift> <OVER>
;1 <Überschrift> ::= <Notzeichen> <Notzeichen> <Notzeichen> "DELTA ECHO" 3 * <Schiffsname> <Rufzeichen> <NotzeichenEnde>
;2 <Standortangabe> ::= <Text_mit_Zahlen>
;3 <Art des Unfalls> ::= <Text>
;4 <Angaben zur Hilfeleistung> ::= <Text>
;5 <Peilzeichen> ::= "--"
;6 <Unterschrift> ::= <Schiffsname> <Rufzeichen>
;7 <OVER> ::= "OVER"

; Auflösungen
; <Notzeichen> ::= "MAYDAY"
; <NotzeichenEnde> ::= "MAYDAY" <Schiffsname> <SchiffsnameBuchstabiert> <Rufzeichen>
; <Schiffsname> ::= <Wort>
; <SchiffsnameBuchstabiert> ::= [Alpha,Bravo,Charlie,...,Zulu]
; <Rufzeichen> ::= [Alpha,Bravo,Charlie,...,Zulu] [Alpha,Bravo,Charlie,...,Zulu] [Alpha,Bravo,Charlie,...,Zulu] [Alpha,Bravo,Charlie,...,Zulu]
; <RufzeichenBuchstabiert> ::= [Alpha,Bravo,Charlie,...,Zulu]

; 2.2
(define (Notmeldung schiffsname rufzeichen standortangabe notfall)
  (list 'MAYDAY 'MAYDAY 'MAYDAY '(DELTA ECHO) schiffsname schiffsname schiffsname (buchstabieren rufzeichen)
        'MAYDAY schiffsname (buchstabieren schiffsname) (buchstabieren rufzeichen) standortangabe notfall '-- schiffsname (buchstabieren rufzeichen)
        'OVER))

; 2.3
; USE (display (Notmeldung ....))!!!!
; (Notmeldung "BABETTE" "DEJY" "NOTFALLPOSITION UNGEFÄHR 10 SM NORDÖSTLICH LEUCHTTURM KIEL"
; "NOTFALLZEIT 1000 UTC SCHWERER WASSEREINBRUCH WIR SINKEN KEINE VERLETZTEN VIER MANN GEHEN IN DIE RETTUNGSINSEL
; SCHNELLE HILFE ERFORDERLICH ICH SENDE DEN TRÄGER")

; (Notmeldung "AMIRA" "AMRY" "Position 57°46’N, 006°31’E" "nach Kenterung in schwerer See sinkt:
; 9 Mann an Bord, das Schiff ist 15m lang, grüner Rumpf. Notfallzeit 0640 UTC")

; (Notmeldung "NAUTILUS" "DEJY" "Notfallposition ungefaehr 10 Seemeilen östlich Point Nemo 48° 52’
; 31,75” S, 123° 23’ 33,07“ W"
; "Riesenkrake hat das Schiff umschlungen, ein grosses Leck im Rumpf. Weitere Angaben: 20 Personen an
;  Bord, treiben antriebslos an der Wasseroberfläche")


; Aufgabe 3 Funktionen vs. Spezialformen
; mündlich
