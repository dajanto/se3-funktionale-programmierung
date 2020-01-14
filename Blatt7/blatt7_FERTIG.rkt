#lang racket
(require racket/trace)
(require 2htdp/image)
(require 2htdp/universe)

; Aufgabe 1

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

; ########################################################################
; ############################# Aufgabe 2 ################################
; ########################################################################


; Das Spielfeld ist eine 2D-Matrix, wo 0 'tot' und 1 'am leben' repräsentiert.
; es werden vectoren genutzt, weil diese unabhängig ihre länge eine konstante Zugriffszeit besitzen.
(define (erstelleSpielfeld m n) (for/vector ([i (range m)]) (make-vector n 0)))

; Get für die Zelle in einem 2D-Matrix.
(define (gibZelle spielfeld x y) (vector-ref (vector-ref spielfeld x) y))

; Set für die Zelle in einem 2D-Matrix.
(define (setzeZelle spielfeld x y wert) (vector-set! (vector-ref spielfeld x) y wert))

(define (in-range? low high val)
  (and 
    (<= low val)
    (< val high)))

; Aufgabe 2.2

(define (draw-row row)
  (apply beside
   (vector->list(vector-map (lambda(i)
          (if (eq? i 0)
              (square 10 "outline" "black")
              (square 10 "solid" "black")
              )
          ) row
   )
  )
   )
  )

(define (zeichneSpielfeld spielfeld)
  (apply above
   (vector->list (vector-map draw-row spielfeld)
                 )
  )
  )

; Aufgabe 2.3

; Lebt die Zelle?
(define (zelleLebend spielfeld x y)
  (if (and (in-range? 0 30 x)
           (in-range? 0 30 y))
      (gibZelle spielfeld x y)
      0)
  )

; Bestimme Nachbarn und tue die Werte in einer Liste
(define (bestimmeNachbarn spielfeld x y)
 
  (let* ([n1 (zelleLebend spielfeld (- x 1) (- y 1))]
         [n2 (zelleLebend spielfeld (- x 1) y)]
         [n3 (zelleLebend spielfeld (- x 1) (+ y 1))]
         [n4 (zelleLebend spielfeld x (- y 1))]
         [n5 (zelleLebend spielfeld x (+ y 1))]
         [n6 (zelleLebend spielfeld (+ x 1) (+ y 1))]
         [n7 (zelleLebend spielfeld (+ x 1) y)]
         [n8 (zelleLebend spielfeld (+ x 1) (- y 1))])
    (list n1 n2 n3 n4 n5 n6 n7 n8)))

; Anzahl Nachbarn anahnd der Liste zaehlen
(define (anzahlNachbarn spielfeld x y) (count positive? (bestimmeNachbarn spielfeld x y)))

; Folgezustand einer Zelle
(define (updateZelle spielfeld x y)
    (case (anzahlNachbarn spielfeld x y)
      [(0 1 4 5 6 7 8) 0]
      [(2) (gibZelle spielfeld x y)]
      [(3) 1]
      )
  )

; Folgezustand des gesamten Spielfeldes
(define (updateSpielfeld spielfeld)
  (let ([newSpielfeld (erstelleSpielfeld 30 30)])
  (for  ([x (range 30)])
    (for ([y (range 30)])
         (setzeZelle newSpielfeld x y (updateZelle spielfeld x y))
         )
    )
    newSpielfeld
    )
  )



; Aufgabe 2.4

; Test Spielfeld
(define (test_spielfeld)
   (let ([spielfeld (erstelleSpielfeld 30 30)])
     (setzeZelle spielfeld 1 1 1)
     (setzeZelle spielfeld 2 1 1)
     (setzeZelle spielfeld 3 1 1)

     (setzeZelle spielfeld 10 10 1)
     (setzeZelle spielfeld 11 9 1)
     (setzeZelle spielfeld 12 10 1)

     (setzeZelle spielfeld 9 11 1)
     (setzeZelle spielfeld 9 12 1)
     (setzeZelle spielfeld 9 13 1)
     (setzeZelle spielfeld 9 14 1)
     (setzeZelle spielfeld 9 15 1)
    

     (setzeZelle spielfeld 13 11 1)
     (setzeZelle spielfeld 13 12 1)
     (setzeZelle spielfeld 13 13 1)
     (setzeZelle spielfeld 13 14 1)
     (setzeZelle spielfeld 13 15 1)
   

     (setzeZelle spielfeld 10 16 1)
     (setzeZelle spielfeld 11 15 1)
     (setzeZelle spielfeld 12 16 1)
     
     spielfeld
     )
  )

(define RunGame
  (big-bang (test_spielfeld) [on-tick updateSpielfeld 0.25] [on-draw zeichneSpielfeld] )
  )