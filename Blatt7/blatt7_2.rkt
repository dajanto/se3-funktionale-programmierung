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
(define rows 32)
(define columns 32)

(define (spielfeldErstellen rows columns)
  ;(make-vector rows (make-vector columns)

(build-vector rows (lambda (y) (make-vector columns 0))))

(define spielfeld (spielfeldErstellen rows columns))
;spielfeld



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

  (vector-set! (vector-ref spielfeld x) y wert)
  )

; Tests
(setzeZelle 1 3 1)
(setzeZelle 1 4 1)
(setzeZelle 1 5 1)
(setzeZelle 1 6 1)
(setzeZelle 1 7 1)
(setzeZelle 1 8 1)
(setzeZelle 1 2 1)
(setzeZelle 0 1 1)
(setzeZelle 1 1 1)
(setzeZelle 2 1 1)
(setzeZelle 3 1 1)
(setzeZelle 4 1 2)
(setzeZelle 5 1 3)
(setzeZelle 6 1 4)
(setzeZelle 7 1 5)
(setzeZelle 8 1 6)




; Spielfeld ausgeben
;spielfeld

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
(cond
  [(and (= x 0) (= y 0)) (totOderLebendig (+ x 1) (+ y 1))]
  [(and (= x 0) (= y 31)) (totOderLebendig (+ x 1) (- y 1))]
  [(and (= x 31) (= y 0)) (totOderLebendig (- x 1) (+ y 1))]
  [(and (= x 31) (= y 31)) (totOderLebendig (- x 1) (- y 1))]
  [else (totOderLebendig2 x y)]))
; Aufgabe 2.2.3
(define (totOderLebendig2 x y)

  (define anzahlNachbarn (count positive? (bestimmeNachbarn x y)))
  (cond
    ; Tote Zelle mit drei Nachbarn wird neu geboren
    [(and (= anzahlNachbarn 3) (= (gibZelle x y) 0)) (setzeZelle x y 1)]
    ; Lebende Zelle mit weniger als zwei lebenden Nachbarn stirbt an Einsamkeit
    [(and (< anzahlNachbarn 2) (= (gibZelle x y) 1)) (setzeZelle x y 0)]
    ; Lebende Zelle mit mehr als drei lebenden Nachbarn stirbt an Überbevölkerung
    [(and (> anzahlNachbarn 3) (= (gibZelle x y) 1)) (setzeZelle x y 0)]
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
(define (zeichneSpielfeld startSpielfeld)
  (display (map zeichne (flatten (vektorenAlsListe listenSpielfeld)))))

;Spielfeld updaten
(define (updateSpielfeld spielfeld)
  (for* ([i '(1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30)]
         [j '(1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30)])
    (totOderLebendig i j))
  spielfeld)

;(trace updateSpielfeld)


spielfeld

(println "and after update:")

(updateSpielfeld spielfeld)



;(big-bang spielfeld
;     [to-draw updateSpielfeld]
;     [on-tick updateSpielfeld])