#lang racket

(require se3-bib/butterfly-module)


; Aufgabe 1

; Analyse und Grobentwurf

; Ziel
; Bei Angabe von zwei dominanten Merkmalen x Kinder erzeugen und beschreiben
; Rezessive Merkmale werden zufällig, aber in Abhängigkeit der Dominanzregeln ausgewählt 
; Anzeigen mit (show-butterfly)

; Benötigte Funktionen
; Funktion zur Generierung der Kinder (mendeln)
; Funktion zur Darstellung 
; Testaufrufe mit vorhandenen Funktionen

; Datenstrukturen
; 

; Tests
(show-butterfly 'red 'dots 'straight 'hexagon)
(show-butterfly 'yellow 'star 'straight 'ellipse)
(show-butterfly 'blue 'star 'curly 'rhomb)


; Aufgabe 2
