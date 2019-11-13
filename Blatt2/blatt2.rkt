#lang racket
(define wuff 'Flocki)
(define Hund wuff)
(define Wolf 'wuff)

(define (welcherNameGiltWo PersonA PersonB)
  (let ((PersonA 'Zaphod)
        (PersonC PersonA))
    PersonC))

(define xs1 '(0 2 3 wuff Hund))
(define xs3 (list wuff Hund))
(define xs2 (cons Hund wuff))

; Aufgabe 1 Symbole und Werte, Umgebungen
; Siehe .txt

; Aufgabe 2 Rechnen mit exakten Zahlen

; 2.1 Die Fakultät einer Zahl

(define (factorial n)
  (cond
    [(= n 0) 1]
    [(> n 0) (* n 
                (factorial (- n 1)))]))

; 2.2 Potenzen von Rationalzahlen

(define (power r n)
  (cond
    [(= n 0) 1]
    [(even? n) (sqr (power r (/ n 2)))]
    [(odd? n) (* r 
                 (power r (- n 1)))]))


; 2.3 Die Eulerzahl

; EINGABE MUSS X = 0 SEIN!
; Laufzeit: ~5s
; Ergebnis: ~2,5961


(define (euler [x 0])
  (cond
    [(< (/ 1 (factorial x)) (/ 1 (power 10 1000))) 0]
    [(>= (/ 1 (factorial x)) (/ 1 (power 10 1000))) 
                                                       (+ (/ 1 (factorial x)) 
                                                          (euler(+ x 1)))]))

; 2.4 PI

(define (piCalc [z 1] [v -1])
  ; z = 1
  ; pi = 4(1 - 1/3 + 1/5 - 1/7 + ...)
  ; TODO
  (cond
    [(>= z 10000) 0]
    [(< z 10000) (+ (/ 1 z) (* v (piCalc(+ z 2) (* v -1))))]
                      
    )
  )


; Aufgabe 3 Typprädikate
; typ-of Funktion
; Prädikate müssen noch eingegeben werden 
(define (typ-of eingabe)
  (cond
    [(boolean? eingabe) 'boolean]
    [(list? eingabe) 'list]
    [(pair? eingabe) 'pair]
    [(string? eingabe) 'string]
    [(vector? eingabe) 'vector]
    [(char? eingabe) 'char]
    [(number? eingabe) 'number]
    [(procedure? eingabe) 'procedure]
    [(symbol? eingabe) 'symbol]))



  
