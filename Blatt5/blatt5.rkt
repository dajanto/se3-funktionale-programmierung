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

; Alle möglichen Musterungen sortiert nach Dominanz
(define musterung (list 'sterne 'punkte 'streifen)
)

; Alle möglichen Flügelfarben sortiert nach Dominanz
(define fluegelfarbe (list 'red 'gruen 'blau 'gelb)
)

; Alle möglichen Fühlerformen sortiert nach Dominanz
(define fuehlerform (list 'gekruemmt 'gerade 'geschweift)
)

; Alle möglichen Flügelformen sortiert nach Dominanz
(define fluegelform (list 'elliptisch 'hexagonal 'rhombisch)
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
