#lang racket
(require racket/trace)
; Probeklausur

; 1.1

; a)
; Ein normaler arithmetischer Ausdruck in Präfix-Notation.

; b)
; Derselbe arithmetische Ausdruck als Symbol mit quote definiert.

; c)
; car gibt den ersten Wert einer Liste zurück, Antwort ist also auto.

; d)
; cdr gibt den Rest einer Liste zurück, schneidet also den Head ab und das Result ist demnach (bus).

; e)
; Es wird sqrt auf jedes Element der übergebenden Liste angewendet, Result ist also '(1 3 2 5)

; f)
; Mit Hilfe von curry lassen sich Operationsargumente so lange akkumulieren, bis alle Argumente beisammen sind und
; die Procedure angewendet werden kann. Dann kommt auch ein tatsächliches Ergebnis heraus und keine Procedure.
; In diesem Fall handelt es sich um eine binäre Operation, das heißt, es wird keine Procedure wiedergegeben,
; sondern es kommt ein Ergebnis heraus. Ergebnis ist false, da (< 6 2) nicht wahr ist.

; g)
; Am Ende der foldl-Operation wird mit 0 multipliziert, das Ergebnis ist also 0.

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

; if und cond sind Special Form Operators, da hier eine andere Reihenfolge der Auswertung passieren muss
; um die passende Semantik zu gewährleisten. Es muss erst die Bedingung geprüft werden, dadurch wird ja erst
; gewiss, welche Rumpfterme ausgeführt werden sollen. Special Form Operators leiten eine Special Form Expression ein. 

; Zwei weitere Special Form Operators sind
; - quote
; - define
; - if/cond
; - set


; c)
; Zur Syntax von Racket
(define *a* 10)
(define *b* '*a*)
(define (merke x) (lambda () x))
;(define (test x)
;  (let ((x (+ x *a*))))
;  (+ x 2))

;1. 10
;2. contract violation
;3. 20
;4. #f
;5. division by zero
;6. procedure
;7. 5
;8. let bad syntax (vom Autor gewollt?)


; 1.3

; Formen der Rekursion
 
(define (alle-neune xs)
  (cond ((null? xs) 0)
        ((= 9 (car xs)) (+ 1 (alle-neune (cdr xs))))
        (else (alle-neune (cdr xs)))))


(define (alle-zehne xs wieviele)
  (cond ((null? xs) wieviele)
        ((= 10 (car xs))
         (alle-zehne (cdr xs) (+ 1 wieviele)))
        (else (alle-zehne (cdr xs) wieviele))))

;(define (anzahl-atome xs)
;  (cond ((null? xs) 0)
;        ((atom? xs) 1)
;        (else (+ (anzahl-atome (car xs))
;                 (anzahl-atome (cdr xs))))))


; alle-neune
;

; alle-zehne
;
; anzahl-atome
;



; Lineare Rekursion 
; Endrekursion
; Allgemein rekursiv
; Direkt/Indirekt 
; Baumartig
; Geschachtelt

; 1.4

; a)
; Listen eignen sich gut für einen rekursiven Aufruf, da man mit Hilfe von cons, car und cdr
; diese manipulieren kann.

; b)
; Testliste gemäß Aufgabe
(define testliste '((1 3 4) (Auto Bus) () (3 4 5 6)))

; TODO Rekursionsart bestimmen und ggf. weitere Implementieren
(define (laengen xss)
  (if (empty? xss)
      '()
      (cons
       (length (car xss))
       (laengen (cdr xss))
       )
      )
  )

(trace laengen)

; Linear-rekursive Implementation


; Endrekursive Implementation

; Implementation mittels Funktion höherer Ordnung
(define (laengenHO xss)
  (map (curry length) xss)
  )
         
; c)
; Woran erkennt man eine endrekursive Funktion?
; Das Ergebnis muss nicht mehr mit anderen Termen verknüpft werden und
; oftmals wird ein Akkumulator verwendet, der die Zwischenergebnisse sammelt.

; Extra:
; Woran erkennt man eine linear-rekursive Funktion?
; Eine Funktionsdefinition, die sich auf de rechten Seite der Gleichung in jeder
; Fallunterscheidung selbst nur einmal verwendet.




; 1.5

(define testpaarliste '((1 . 3) (2 . 4) (3 . 5)))

; a)

(define (xliste xss)
  (map (curry car) xss)
  )
(xliste testpaarliste)

; b)

(define (yliste xss)
  (map (curry cdr) xss)
  )
(yliste testpaarliste)

; c)

(define (xsumme xss)
  (foldl + 0 (xliste xss))
  )
;(xsumme testpaarliste)

; d)

(define (x*y-summeH xss)
  ; Summe fehlt noch
  (if (empty? xss)
      '()
      (cons
       (* (caar xss) (cdar xss))
       (x*y-summeH (cdr xss))))
  )

;(x*y-summeH testpaarliste)

; TODO Funktion höherer Ordnung verwenden
;(define (x*y-summe xss)
  ;(foldl (lambda(x y) (* (car x) (car y)) 0 (xliste xss) (yliste xss))))

;(x*y-summe testpaarliste)


; e)
(define (x**2-summe xss)
  (foldl + 0 
         (map (lambda (x) (* x x))
              (xliste xss)))
  )

;(x**2-summe testpaarliste)

; f)

; Zusatzaufgabe


; 1.6
; a)
; b)
; c)
