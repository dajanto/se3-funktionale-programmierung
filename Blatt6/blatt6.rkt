#lang racket


;Definitionen 
;
;Linear-Rekursiv: Eine Funktionsdefinition, die sich auf der rechten Seite der
;definierenden Gleichung in jeder Fallunterscheidung selbst nur einmal verwendet.
;
;Baumrekursiv: Eine rekursive Definition ist baumartig wenn in der Definition in
;einer Fallunterscheidung mehrfach auf die Definition Bezug genommen wird.
;
;Geschachtelt: Eine Rekursion ist geschachtelt, wenn die Funktion in der rekursiven
;Verwendung selbst als Argument mitgegeben wird.
;
;Indirekt: Eine rekursive Definiton heißt indirekt oder verschränkt, wenn zwei oder
;mehrere Definitionen sich wechselseitig rekursiv verwenden.
;
;Endrekursiv: Rekursive Funktionen, bei denen das Ergebnis der Rekursion nicht mehr
;mit anderen Termen verknüpft werden muß.

(require 2htdp/image)

; Größe des Bildes
( define scene-width 800 )
( define scene-height 600 )

; Hintergrund des Bildes
( define my-scene ( empty-scene scene-width scene-height "darkblue" ) )

; Wird verwendet um die einzelnen Objekte auf dem Bild zu platzieren.
( define orientation-scene ( rectangle scene-width scene-height "solid" ( color 0 0 0 0 ) ) )

; Hier wird eine Schneelandschaft erzeugt, die aus mehreren Ellipsen besteht.
( define snow-landscape
   ( underlay
     ( place-image (ellipse 1500 200 "solid" (color 180 180 180)) 200 600 orientation-scene )
     ( place-image (ellipse 1600 550 "solid" (color 250 250 250)) 400 800 orientation-scene )
     )
   )

(define (baum2)
  (above/align
  "center"
  (star-polygon 20 5 2 "solid" "gold")
  (ellipse 10 25 "solid" "darkgreen")
  (ellipse 25 15 "solid" "darkolivegreen")
  (ellipse 40 20 "solid" "olivedrab")
  (ellipse 70 30 "solid" "darkgreen")
  (rectangle 10 20 "solid" "brown")))

(define (kerze)
  (above/align
   "center"
   (ellipse 10 25 "solid" "orange")
   (rectangle 10 20 "solid" "brown")))

(define (stern)
  (star-polygon 10 5 2 "solid" "gold"))
   


( define (trees2 x)
   ( let (
          [ tree2 ( place-image
                   (baum2)
                   (random scene-width)
                   (inexact->exact (* scene-height 0.80))
                   orientation-scene ) ]
          )
      ( if (zero? x)
           tree2
             ( underlay ; Bäume übereinander legen
             tree2
             ( trees2 (sub1 x) )
             )
           )
      )
   )

( define (kerzen2 n)
   ( let (
          [ kerze2 ( place-image
                   (kerze)
                   (random scene-width)
                   (inexact->exact (* scene-height 0.93))
                   orientation-scene ) ]
          )
      ( if (zero? n)
           kerze2
           ( underlay ;
             kerze2
             ( kerzen2 (sub1 n) )
             )
           )
      )
   )

( define (sterne2 y)
   ( let (
          [ stern2 ( place-image
                   (stern)
                   (random scene-width)
                   (random (- scene-height 120))
                   orientation-scene ) ]
          )
      ( if (zero? y)
           stern2
           ( underlay 
             stern2
             ( sterne2 (sub1 y) )
             )
           )
      )
   )


; Generiert 10 Bäume
( define zeigeBäume
   ( trees2 4 )
   )

(define zeigeKerzen
  ( kerzen2 4))

(define zeigeSterne
  ( sterne2 20 ))




; Zeigt das Bild
( define ( create-scene )
   ( underlay
     my-scene
     snow-landscape
     zeigeBäume
     zeigeKerzen
     zeigeSterne
     )
   )

; Testaufruf
(create-scene)

