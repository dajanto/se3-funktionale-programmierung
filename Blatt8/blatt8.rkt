#lang racket

#|
  SE3 Funktionale Programmierung
  WiSe 2019/20, Uni Hamburg
  
  Gruppe H
  Aufgabenblatt 08

  Vorstellung am 08.01.2020


  Aufgabe 1)
  ----------------------------------------------------------------------

  1.

  Funktionen höherer Ordnung sind Funktionen, welche Funktionen 
  als Argumente erhalten, oder als Wert zurückgeben

  2.
  (a) test-vergleiche ist eine Funktion höherer Ordnung, da als Paramter  
  eine Funktion übergeben werden muss.

  (b) mul-lists ist keine Funktion höherer Ordnung, da keine Funktion als Paramter
  übergeben wird und auch keine Funktion als Wert zurückgegeben wird.

  (c) plus ist keine Funktion höherer Ordnung, da als Parameter zwei Zahlen übergeben
  werden und lambda eine annonyme, lokale Funktion ist.

  (d) ermittle-vergleichsoperation ist eine Funktion höherer Ordnung, da  
  eine Vergleichsoperation als Wert zurückgegeben wird.

  (e) schweinchen-in-der-mitte ist eine Funktion höherer Ordnung, weil eine
  eine Funktion als Paramter übergeben werden muss.

  3.

  Zunächst wird bei dem vorgegebenen Funktionsaufruf die Zahl 4 an die Funktion f gebunden.
  Die Zahlen 1 und 3 die bei dem Aufruf erst hinter der Klammer kommen, definieren für den
  schon gebunden Wert 4 die Umgebung. 

  4.

  (foldl (curry + 3) 1 '(2 3 5)) -> 20, weil zunächst (curry + 3)
  aufgelöst wird zu einer Closure, die sich wie + verhält, aber 
  zunächst noch nicht den zweiten Paramter für die Addition braucht.
  dieser wird nach und nach aus der Liste genommen.
  Anschließend wird foldl ausgeführt und verwendet die Elemente der Liste
  als Argumente für die Closure. 1 wird als letztes Argument verwendet. 


  (map even? '(4 587 74 69 969 97 459 4)) gibt (#t #f #t #f #f #f #f #t) zurück
  die Funktion map bekommt die Liste und eine Funktion als Paramter und wendet auf jedes Element
  der Liste die Funktion an. 

  (filter number? '(#f (2) 3 (()) 4 -7 "c")) gibt '(3 4 -7) zurück.
  Die Funktion Filter bekommt ebenfalls eine Liste und eine Funktion
  übergeben und filtert mittels der Funktion Werte aus der Liste heraus
  und übergibt die Restliste. 

  ((curry filter (compose test-vergleich (curry ermittle-vergleichsoperation 1 1))) '(5682 48 24915 -45 -6 48 11))
  gibt eine Fehlermeldung zurück, da compose nicht zwei Funktionen übergeben bekommt, sondern eine Boolean. 

|#

; Aufgabe 2)
; --------------------------------------------------------------------------------------------------

; Liste mit natürlichen Zahlen zum Testen.
(define xs '(1 2 3 6 7 8 21 22))

; 1)
; Lamdda nutzen um zu eine Funktion zu Erstellen ,die 2 Zahlen quadriert und
; map wendet ein procedure auf alle Elemente einer Liste an
(map(lambda (x) (* x x))  xs)

; 2)
; Filter erzeugt eine Teilliste, wenn die procedure true wiedergiebt.
(filter 
 (lambda (x)
   (or (= 0 (modulo x 7)) (= 0 (modulo x 3))))
 xs)

; 3)
; Foldl wendet ein procedure auf alle Elemente einer Liste an (wie map),
; aber vereinigt die Ergebnisse durch summieren.
(foldl +
       0
       (filter 
        (lambda (x)
          (and [even? x]
               [> x 6])
          )
        xs))


; Aufgabe 3.1
; ---------------------------------------------------

#|
Die Repräsentation der möglichen Eigenschaften einer Karte implementieren wir
als vier verscheidene Listen, die jeweils alle möglichen Ausprägung einer
Eigenschaft enthalten.
|#
( define counts '(1 2 3) )
( define patterns '(waves oval rectangle) )
( define modes '(outline solid hatched) )
( define colors '(red green blue) )

#|
Eine einzelne Karte implementieren wir ebenfalls als eine List, die ihre Eigen-
schaften in folgender Reihenfolge enthält: Anzahl, Form, Füllmuster, Farbe.
|#
( define sample-card1 '(3 waves hatched green) )
( define sample-card2 '(2 waves solid red))
( define sample-card3 '(1 waves outline blue))


; Wir definieren 3 sets zum Testen.
( define set (list sample-card1 sample-card2 sample-card3) )  ; Alle unterschiedlich
( define set2 (list sample-card1 sample-card1 sample-card1) ) ; Alle gleich 
( define no-set (list sample-card1 sample-card2 sample-card1) ) ; Enthält Duplikate (ist kein set)



; Aufgabe 3.2
; --------------------------------------------------------

(require se3-bib/setkarten-module)

; Erzeugt ein Deck mit 81 Set Karten, bei dem eine Karte jeder möglichen
; Kombination vorhanden ist
( define ( create-deck )
   (for*/list ( [i counts]
                [j patterns]
                [k modes]
                [l colors]
                )
      (list i j k l)
     )
   )

; Hilfsfunktion
; Zeigt eine Set-Karte an mit der angegbeben Funktion
( define ( show-card card )
   ( apply show-set-card card )
   )

; Zeichne eine Liste von Karten 
( define ( visualize-cards cards )
   ( map show-card cards )
   )


; Aufgabe 3.3
; ------------------------------------------------------


; Hilfsfunktion
; Überprüft ob eine Liste nur die gleichen (equal?) Elemente beinhaltet
( define (all-the-same? list)
   ; Sind genug Daten (Paare) vorhanden, um vergleichen zu können?
  (if
   (and (pair? list) (pair? (cdr list)))
   ; Ist das vordereste und das nächste Element identisch?
    (if
     (equal? (car list) (cadr list))
     (all-the-same? (cdr list)) ; Rekursiv durch die Liste arbeiten
     #f ; Nein? Dann sind nicht alle Elemente identisch
     )
    
    #t
   )
)


; Hilfsfunktion
; Überprüpft ob eine Liste nur unterschiedliche Elemente beinhaltet
( define (all-different? list)
   ; Ist dies eine List?
   (if
    (pair? list)
    
    ; Kann ich das vordereste Element  in der Liste finden (member?) ?
    (if
     (member (car list) (cdr list))
     #f
     (all-different? (cdr list)) ; Rekursiv durch die Liste arbeiten
     )
    
     #t
    )
   )


; Überprüpft ob die übergebenen Karten ein Set sind
( define ( is-a-set? cards )
   ; Sind es wirklich 3 Karten?
   (if
    (= 3 (length cards))
   
    ; Sind da noch genug Eigenschaften.
    ; Bei leerer Liste (durch rekursiven Vorgang) muss dies ein Set sein
    (if 
     (> 1 (length (car cards)))
     #t
     
     ; Sonst muss gelten, dass die aktuellen Eigenschaften alle
     ; identisch ODER unterschiedlich sein müssen
     ; UND die restlichen Eigenschaften auch ein Set bilden.
     (and      
       (or
         (all-the-same?  (map car cards))
         (all-different? (map car cards))
        )
        (is-a-set? (map cdr cards))
      )
     
     ; Sind da noch genug Eigenschaften. (REST)
     )
    
   ; Sind es wirklich 3 Karten? (REST)
    #f
   )
)
   
(display "Ergibt die Kombination set1 ein SET?")
(is-a-set? set)
(display "Ergibt die Kombination set2 ein SET?")
(is-a-set? set2)
(display "Ergibt die Kombination set3 ein SET?")
(is-a-set? no-set)
