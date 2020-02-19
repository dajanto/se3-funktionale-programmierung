#lang racket

; 1
; Evals

; 2

; '(+ 3 (- 6 7)

; auto

; (bus)

; '(1 3 2 5)

; #f

; 0 

; 2
; Reduktionsstrategien

; Vorteilhaft für innere Reduktion:
(define (hoch4 x) (* x x x x))

; Vorteilhaft für äußere Reduktion:
(define (gibMirKonstante x) 1337)

; Äußere Reduktion ist dann sinnvoll, wenn das x z.B. nicht so oft benutzt wird in der Funktion gibMirKonstante. Bei hoch4 würde das x sehr oft ausgewertet werden deutlich öfter, als mit innerer Reduktion.

; if und cond sind Special Form Operators. Sie leiten eine Special Form Expression ein und sorgen dafür, dass die Ausdrücke anders ausgewertet werden als herkömmlich. Bei if muss z.B. die Bedingung zuerst ausgewertet werden, um zu entscheiden, welcher Rumpf ausgeführt wird. Weitere Special Form Expressions sind quote, set, and, or, define.

; a ist 10. 
; a und b können nicht addiert werden, da b das Symbol von a ist. 
; Wenn hingegen eval benutzt wird kommt 20 heraus.
; a ist nicht größer 10, also ist and widerlegt. 
; durch 0 darf nicht geteilt werden. 
; bei merke wird eine Lambda-Funktion zurückgegeben.
; Hingegen merke mit Klammern versehen beschert das gewünschte Ergebnis.
; test 4 ergibt 16, da a 10 ist und x 4. Auf die lokale Variable wird dann noch 2 addiert.


; Rekursionsarten

; Linear
; Nur ein Ausdruck pro Fallunterscheidung

; End
; Akkumulator wird in manchen Fällen verwendet, Ergebnis muss am Ende nicht mer mit anderen Termen verknüpft werden

; Baum
; In einer Fallunterscheidung mehr als ein rekursiver Aufruf

; Schachtel
; Innerhalb eines rekuriven Aufrufs ein weiterer rekursiver Aufruf als Argument übergeben

; Indirekt
; Mehrere Funktionen rufen sich wechselseitig auf

; Direkt
; Gegenteil von indirekter Rekursion?

(define testliste '((1 2 3) (Auto Bus) () (3 1 1 1 1)))

(define (linear xss)
  (if (empty? xss)
     '()
     (cons (length (car xss)) (linear (cdr xss)))))

(linear testliste)


(define (end xss akku)
  (if (empty? xss)
     akku
      (end (cdr xss) (cons (length (car xss)) akku))))

(end testliste 0)

(define (hoho xss)
  (map length xss)
  )
(hoho testliste )





























(define paarliste '((1 . 2) (2 . 4) (3 . 5)))

(define (xliste xss)
(map car xss)
  )

(xliste paarliste)


(define (yliste xss)

  (map cdr xss))

(yliste paarliste)



(define (xsumme xss)
(foldl + 0 (xliste xss)))
(xsumme paarliste)

(define (xysumme xss)
  (foldl + 0 (map * (xliste xss) (yliste xss)))
  )
(xysumme paarliste)


(define (x2summe xss)
 (foldl + 0 (map (lambda(x) (* x x)) (xliste xss)))
  )
(x2summe paarliste)









