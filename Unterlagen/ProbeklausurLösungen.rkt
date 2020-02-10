#lang racket

; Probeklausur

; 1.1

; a)
; Ein normaler arithmetischer Ausdruck in Präfix-Notation.

; b)
; Derselbe arithmetische Ausdruck als Symbol mit quote definiert.

; c)
; car gibt den ersten Wert einer Liste zurück, Antwort ist also auto.

; d)
; cdr gibt den Rest einer Liste zurück, schneidet also den Head ab und das Result ist demnach bus.

; e)
; Es wird sqrt auf jedes Element der übergebenden Liste angewendet, Result ist also '(1 3 2 5)

; f)
; Mit Hilfe von curry lassen sich Operationsargumente so lange akkumulieren, bis alle Argumente beisammen sind und
; die Procedure angewendet werden kann. Dann kommt auch ein tatsächliches Ergebnis heraus und keine Procedure.
; In diesem Fall handelt es sich um eine binäre Operation, das heißt, es wird keine Procedure wiedergegeben,
; sondern es kommt ein Ergebnis heraus. Ergebnis ist false, da (< 6 2) nicht wahr ist.

; g)
; (foldl cons '() '(1 2 6 0 1))
; Result bei foldl: '(1 0 6 2 1)
; Result bei foldr: '(1 2 6 0 1)
; Liste mit cons aufgebaut:(cons 1 (cons 2 (cons 3 (cons 4 '()))))
; foldl funktioniert ca. wie map mit dem Unterschied, dass bei foldl der Wert gemäß der Procedure weiterverwendet wird.
; In diesem Fall wird mit cons eine Liste gebaut (Letztes Element ist die leere Liste).

; 1.2
; a)
; b)
; c)


; 1.3

; 1.4
; a)
; b)
; c)

; 1.5
; a)
; b)
; c)
; d)
; e)
; f)

; 1.6
; a)
; b)
; c)
