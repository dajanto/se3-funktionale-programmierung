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

; Vorliegende Teilprobleme
; Entscheidung und Strukrierung dominanter Merkmale
; Generierung der Kinder auf Basis der Elternmerkmale

; Benötigte Funktionen
; Repräsentation aller Merkmale als Datenstruktur
; Funktion zur Generierung der Kinder ("mendeln")
; Funktion zur Darstellung der Familie (Eltern, Kinder)
; Funktion zur Dominanzüberprüfung zweier Merkmale
; Testaufrufe mit vorhandenen Funktionen

; Datenstrukturen
; Speicherung von Merkmal-Kategorien (Musterung, Flügelfarbe, Fühlerform, Flügelform)

; Implementation und Erprobung

; Alle möglichen Musterungen
(define musterung (list 'sterne 'punkte 'streifen)
)

; Alle möglichen Flügelfarben
(define fluegelfarbe (list 'red 'gelb 'gruen 'blau)
)

; Alle möglichen Fühlerformen
(define fuehlerform (list 'gerade 'gekruemmt 'geschweift)
)

; Alle möglichen Flügelformen
(define fluegelform (list 'rhombisch 'elliptisch 'hexagonal)
)

; Generiere <kinderanzahl> Kinder auf Basis der Elternmerkmale
(define (mendeln merkmalA merkmalB kinderanzahl)
  (list merkmalA)
  )


; Prüfe, ob Merkmal a dominanter b
(define (dominanteMerkmalePruefen a b)
  1)


; Wähle rezessive Mermake zufällig aus
(define (waehleRezessiveMerkmale)
  1
)

; Stelle Eltern und gemendelte Kinder dar
(define zeigeFamilie 
  1
  )

; Testaufrufe
(show-butterfly 'red 'dots 'straight 'hexagon)
(show-butterfly 'yellow 'star 'straight 'ellipse)
(show-butterfly 'blue 'star 'curly 'rhomb)

; Aufgabe 2
