#lang Racket

; Aufgabe 2.3
; Bereiche sind immer 22,5 grad (360/16)
(define (Grad->Himmelsrichtung grad)
  (cond
        [(<= grad 11.25) 'N]
        [(<= grad 33.75) 'NNO]
        [(<= grad 56.25) 'NO]
        [(<= grad 78.75) 'ONO]
        [(<= grad 101.25) 'O]
        [(<= grad 123.75) 'OSO]
        [(<= grad 146.25) 'SO]
        [(<= grad 168.75) 'SSO]
        [(<= grad 191.25) 'S]
        [(<= grad 213.75) 'SSW]
        [(<= grad 236.25) 'SW]
        [(<= grad 258.75) 'WSW]
        [(<= grad 281.25) 'W]
        [(<= grad 303.75) 'WNW]
        [(<= grad 326.25) 'NW]
        [(<= grad 348.75) 'NNW]
        [(and(> grad 348.75)(<= grad 360.0))'N]
        [else "ERROR"]))

; HR->grad, eingabe muss ein Symbol sein
(define (Himmelsrichtung->grad HR)
  (cond [(symbol=? HR 'N ) 0.0]
        [(symbol=? HR 'NNO ) 22.5]
        [(symbol=? HR 'NO ) 45.0]
        [(symbol=? HR 'ONO ) 67.5]
        [(symbol=? HR 'O ) 90.0]
        [(symbol=? HR 'OSO ) 112.5]
        [(symbol=? HR 'SO ) 135.0]
        [(symbol=? HR 'SSO ) 157.5]
        [(symbol=? HR 'S ) 180.0]
        [(symbol=? HR 'SSW ) 202.5]
        [(symbol=? HR 'SW ) 225.0]
        [(symbol=? HR 'WSW ) 247.5]
        [(symbol=? HR 'W ) 270.0]
        [(symbol=? HR 'WNW ) 292.5]
        [(symbol=? HR 'NW ) 315.0]
        [(symbol=? HR 'NNW ) 337.5]
        [else "ERROR"]))

	

