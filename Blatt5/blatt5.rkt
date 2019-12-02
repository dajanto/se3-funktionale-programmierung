#lang racket

(require se3-bib/butterfly-module)


; Aufgabe 1

; Schmetterling -> Ein dominantes und ein rezessives Merkmal

; Dominanzregeln
; Sterne > Punkte, Streifen
; rot > grün, blau, gelb
; grün > gelb, blau
; blau > gelb
; Gekrümmt > gerade, geschweift
; Gerade > geschweift
; Elliptisch > hexagonal, rhombisch
; Hexagonal > rhombisch
; Analyse und Grobentwurf

; Ziel
; Bei Angabe von zwei dominanten Merkmalen x Kinder erzeugen und beschreiben
; Rezessive Merkmale werden zufällig, aber in Abhängigkeit der Dominanzregeln ausgewählt 
; Anzeigen mit (show-butterfly)

; Benötigte Funktionen
; Funktion zur Generierung der Kinder ("mendeln")
; Funktion zur Darstellung 
; Funktion zur Dominanzüberprüfung zweier Merkmale
; Testaufrufe mit vorhandenen Funktionen

; Datenstrukturen
; Speicherung von Merkmal-Kategorien (Musterung, Flügelfarbe, Fühlerform, Flügelform)

; Implementation und Erprobung

(define musterung (list 'sterne 'punkte 'streifen)
)

(define fluegelfarbe (list 'red 'gelb 'gruen 'blau)
)

(define fuehlerform (list 'gerade 'gekruemmt 'geschweift)
)

(define fluegelform (list 'rhombisch 'elliptisch 'hexagonal)
)

(define (mendeln merkmalA merkmalB kinderanzahl)
  (list merkmalA)
  )

(define zeigeSchmetterling
  (show-butterfly 'red 'dots 'straight 'hexagon)
  )

; Testaufrufe
(show-butterfly 'red 'dots 'straight 'hexagon)
(show-butterfly 'yellow 'star 'straight 'ellipse)
(show-butterfly 'blue 'star 'curly 'rhomb)

; Aufgabe 2
