#lang racket

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

; 2.3



; Aufgabe 3 Funktionen vs. Spezialformen
