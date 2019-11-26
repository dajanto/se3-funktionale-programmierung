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

;1 <Überschrift> ::= <Notzeichen> <Notzeichen> <Notzeichen> "DELTA ECHO" <Schiffsname> <Schiffsname> <Schiffsname> <Rufzeichen> <NotzeichenEnde>
;2 <Standortangabe> ::= [a-zA-Z]
;3 <Art des Unfalls> ::= [a-zA-Z]
;4 <Angaben zur Hilfeleistung> ::= [a-zA-Z]
;5 <Peilzeichen> ::= (Sendetaste für 10-15 Sekunden drücken)
;6 <Unterschrift> ::= <Schiffsname> <RufzeichenBuchstabiert>
;7 <OVER> ::= "OVER"

; Auflösungen
; <Notzeichen> ::= "MAYDAY"
; <NotzeichenEnde> ::= "MAYDAY" <Schiffsname> <SchiffsnameBuchstabiert> <RufzeichenBuchstabiert>
; <Schiffsname> ::= [a-zA-Z]
; <SchiffsnameBuchstabiert> ::= [Alpha,Bravo,Charlie,...,Zulu]
; <Rufzeichen> ::= [Alpha,Bravo,Charlie,...,Zulu] [Alpha,Bravo,Charlie,...,Zulu] [Alpha,Bravo,Charlie,...,Zulu] [Alpha,Bravo,Charlie,...,Zulu]
; <RufzeichenBuchstabiert> ::= [Alpha,Bravo,Charlie,...,Zulu]

; 2.2

; 2.3



; Aufgabe 3 Funktionen vs. Spezialformen
