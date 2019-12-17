#lang racket
(require racket/trace)
(require 2htdp/image)
(require 2htdp/universe)

; Aufgabe 2.1

; Allgemein rekursiv

(define (zaehlenA zahl liste)
  
  (cond
    [(empty? liste) 0]
    [[equal? (car liste) zahl] (add1 (zaehlenA zahl (cdr liste)))]
    [else (zaehlenA zahl (cdr liste))] 
    ))  

; Endrekursiv

(define (zaehlenB zahl liste [anzahl 0])
  
  (cond
    [(empty? liste) anzahl]
    [else (+ (test zahl liste) anzahl)
          (zaehlenA zahl (cdr liste))]))

(define (test unsere_Zahl unsere_Liste)
  (cond
    [[equal? (car unsere_Liste) unsere_Zahl]  1]
    [else 0]))


; Mit Funktion höherer Ordnung

(define (zaehlenC zahl1 liste)
  (count positive? (map (lambda (unser_listenelement)

                          (cond
                            [[equal? unser_listenelement zahl1]  1]
                            [else 0]))
  
                        liste)))

; Aufgabe 2.2.1

; Spielfeld-Dimensionen
(define rows 30)
(define columns 30)

(define (spielfeldErstellen rows columns)
  (make-vector rows (make-vector columns)
))

(define spielfeld (spielfeldErstellen rows columns))
spielfeld

; Aufgabe 2.2.2
(define (zeichne x)

  (cond
    [(= x 0) (square 10 "outline" "yellow")]
    [(= x 1) (square 10 "outline" "red")]))

; Gib Zelleninhalt zurück
(define (gibZelle x y)
  (vector-ref (vector-ref spielfeld x) y))

; Setzt Zelleninhalt
(define (setzeZelle x y wert)

  ; Erstelle Vector mit Wert an Stelle y und setze an Position x ein
  ; TODO Spielfeld-Zeile benutzen, nicht einen neuen erstellen (Werte werden immer überschrieben) 
  (define vectorINJ (make-vector columns))
  (vector-set! vectorINJ y wert)
  (vector-set! spielfeld x vectorINJ)
  )

; Tests
(setzeZelle 0 0 1)
(setzeZelle 0 2 1)

; Spielfeld ausgeben
spielfeld

; Bestimme 3, 5 oder 8 Nachbarn und tue die Werte in einer Liste
(define (bestimmeNachbarn x y)

  (let* ([n1 (gibZelle (- x 1) (- y 1))]
         [n2 (gibZelle (- x 1) y)]
         [n3 (gibZelle (- x 1) (+ y 1))]
         [n4 (gibZelle x (- y 1))]
         [n5 (gibZelle x (+ y 1))]
         [n6 (gibZelle (+ x 1) (+ y 1))]
         [n7 (gibZelle (+ x 1) y)]
         [n8 (gibZelle (+ x 1) (- y 1))])
    (list n1 n2 n3 n4 n5 n6 n7 n8)))

; Aufgabe 2.2.3
(define (totOderLebendig x y)

  (define anzahlNachbarn (count positive? (bestimmeNachbarn x y)))

  (cond
    ; Tote Zelle mit drei Nachbarn wird neu geboren
    [(and (= anzahlNachbarn 3) (= (gibZelle x y) 0)) (setzeZelle 1)]
    ; Lebende Zelle mit weniger als zwei lebenden Nachbarn stirbt an Einsamkeit
    [(and (< anzahlNachbarn 2) (= (gibZelle x y) 1)) (setzeZelle 0)]
    ; Lebende Zelle mit mehr als drei lebenden Nachbarn stirbt an Überbevölkerung
    [(and (> anzahlNachbarn 3) (= (gibZelle x y) 1)) (setzeZelle 0)]
    ))


; Aufgabe 2.2.4
(define (simulation x)
  ; TODO
  x
  )

; Spielfeld von Vektoren in Vektor zu Listen in Vektor
(define listenSpielfeld (vector->list spielfeld))

; Macht aus Liste von Vektoren Liste von Listen
(define (vektorenAlsListe liste)
 
  (if(empty? liste)
     '()
     (cons
      (vector->list (car liste)) (vektorenAlsListe (cdr liste))))
  )

; Spielfeld anzeigen
;(display (map zeichne (flatten (vektorenAlsListe listenSpielfeld))))
