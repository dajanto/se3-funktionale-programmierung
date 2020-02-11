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
; Innere Reduktion: Terme werden von innen nach außen reduziert
; Äußere Reduktion: Terme werden von außen nach innen reduziert

; Die äußere Reduktion ist unvorteilhaft, wenn ein Parameter mehrfach benötigt wird,
; da er so mehrfach ausgewertet wird
(define (hoch4 x) (* x x x x))
; (Antwort auf die Aufgabe mit entsprechender Begründung)

; Die innere Reduktion ist unvorteilhaft, wenn die Argumente gar nicht zur Berechnung
; des Resultats benötigt werden
(define (konstant x y z) 1337)

; b)

; if und cond sind Special Form Expressions, da hier eine andere Reihenfolge der Auswertung passieren muss
; um die passende Semantik zu gewährleisten. Es muss erst die Bedingung geprüft werden, dadurch wird ja erst
; gewiss, welche Rumpfterme ausgeführt werden sollen. 

; Zwei weitere Special Form Operators sind
; - quote (verhindert das Auswerten)
; - define


; c)
; Zur Syntax von Racket
(define *a* 10)
(define *b* '*a*)
(define (merke x) (lambda () x))
;(define (test x)
;  (let ((x (+ x *a*))))
;  (+ x 2))

;1. 10
;2. '*a*
;3. 20
;4. #f
;5. division by zero
;6. procedure
;7. 5
;8. let bad syntax (vom Autor gewollt?)


; 1.3

; Formen der Rekursion

; Lineare Rekursion 
; Endrekursion
; Allgemein rekursiv
; Direkt/Indirekt 
; Baumartig
; Geschachtelt


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
