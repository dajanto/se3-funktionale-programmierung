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

; Implementation:
; ------------------------------------------------------------

; Merkmale als Liste von Listen
(define merkmalsListen
  (list
    (list 'red 'green 'blue 'yellow )
    (list 'star 'dots 'stripes )
    (list 'curly 'straight 'curved )
    (list 'ellipse 'hexagon 'rhomb )
  )
)
; Zufaellige Auswahl aus einer Liste
(define (randomPick list)
  (list-ref list (random (length list))))

; Bestimmt Dominanz
; (first-element '(a b c) '(c b)) -> 'b
(define (first-element list1 list2)
  (if
   (empty? list1)
   '()
   (if
    (list? (member (car list1) list2))
    (car list1)
    (first-element (cdr list1) list2))))

(define (zeichneMendel mutterDominant vaterDominant)
  (let*
      ( ; Zufaellig ein rezessives Eigenschaft von der Mutter auswaehlen
        [mutterRez (map randomPick (map member mutterDominant merkmalsListen))]
        ; Zufaellig ein rezessives Eigenschaft vom Vater auswaehlen
        [vaterRez (map randomPick (map member vaterDominant merkmalsListen))]
        ; Waehle eine Eigenschaft zwischen Dominant und Rezessive aus (von der Mutter)
        [mutterMischen (map randomPick (map list mutterDominant mutterRez))]
        ; Waehle eine Eigenschaft zwischen Dominant und Rezessive aus (vom Vater)
        [vaterMischen (map randomPick (map list vaterDominant vaterRez))]
        ; Erstelle Kind basierend auf Mendel-Regeln
        [kind (map first-element merkmalsListen (map list mutterMischen vaterMischen))])
    (display (show-butterfly (car kind) (cadr kind) (caddr kind) (cadddr kind)))))

; Zeichne n Butterflies
(define (mendel mutterDominant vaterDominant n)
  (zeichneMendel mutterDominant vaterDominant)
  (if
   (> n 1)
   (mendel mutterDominant vaterDominant (sub1 n))
   (display "\n")
  )
)

; Erprobung :
; ------------------------------------------------------------------------------
(mendel 
 (list 'red 'star 'curly 'ellipse ) 
 (list 'red 'star 'curly 'ellipse ) 
 100
)

(mendel 
 (list 'green 'stripes 'curved 'hexagon ) 
 (list 'green 'stripes 'curved 'hexagon )
 3
)

(mendel 
 (list 'blue 'stripes 'curved 'hexagon ) 
 (list 'red 'star 'curly 'ellipse ) 
 3
)

(mendel 
 (list 'red 'star 'curly 'ellipse ) 
 (list 'yellow 'dots 'straight 'rhomb )
 3
)

        

