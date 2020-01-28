#lang lazy

(require (lib "prologInScheme.ss" "se3-bib" "prolog"))


;Aufgabe 1.2 


; ( schueler name ID lieblingsfach )
(<- ( schueler "Max" 0 4 ) )
(<- ( schueler "Laura" 1 2 ) )
(<- ( schueler "Timo" 2 0 ) )
(<- ( schueler "Gustav" 3 0 ) )
(<- ( schueler "Marie" 4 1 ) )
; ( note schuelerID fach note )
(<- ( note 1 4 2 ) )
(<- ( note 2 0 1 ) )
(<- ( note 4 3 4 ) )
(<- ( note 3 4 2 ) )
(<- ( note 4 1 1 ) )
; ( fach  ID Fach  )
(<- ( fach 0 "Mathe" ) )
(<- ( fach 1 "Deutsch" ) )
(<- ( fach 2 "Englisch" ) )
(<- ( fach 3 "Physik" ) )
(<- ( fach 4 "Chemie" ) )

;1. Welche Schüler (Namen) haben eine 2 in Chemie?
;(?- (fach ?fachID "Chemie") (note ?sID ?fachID 2) (schueler ?name ?sID ?))

;2. Wie viele Schüler haben eine 2 in Chemie?
;(?- (fach ?fachID "Chemie") (findall ?SID (note ?SID ?fachID 2) ?X) (length ?X ?Anzahl))

;3. Welche Schüler (Namen) haben dasselbe Lieblingsfach?
;(?- (schueler ?Name ? ?Fach) (schueler ?Name2 ? ?Fach) (not = ?Name ?Name2))

;4. Welche Schüler haben in irgendeinem Fach eine Note schlechter 3?
;(?- (note ?SID ? ?Note) (not = ?Note 3) (not = ?Note 2) (not = ?Note 1) (schueler ?Name ?SID ?))



; Aufgabe 2

; Stream der natürlichen Zahlen (wichtig: Lazy Racket benutzen, sonst entsteht hier
; endlos Schleife (Rekursive Listendefinition)
(define (natsAbN n)
  (cons n (natsAbN (+ 1 n)))
  )

; Stream, der alle durch 3 bzw. durch 5 teilbaren Zahlen durch flip bzw. flap ersetzt
(define (flipStream stream)
  (let
      (
       ; Das aktuelle Element überprüpfen
       [currentElement 
        (cond
          ; Ist es durch 3 teilbar, dann 'flip'
          [(= (remainder (car stream) 3) 0) "flip"]
          ; Ist es durch 3 teilbar, dann 'flap'
          [(= (remainder (car stream) 5) 0) "flap"]
          ; Sonst normal das aktuelle Element ausgeben
          [else (car stream)]
          )
        ]
       )
    ; Stream rekursiv für alle folgenden Elemente definieren
    (cons currentElement (flipStream (cdr stream)))
    )
  )
; Den Stream definieren
(define flipflap (flipStream (natsAbN 1)))
(!! (take 40 flipflap))


; Implementation
(define (harm n)
  (cond 
    [(= n 1) (+ 1)]
    [else (+ (/ 1 n)
          (harm (- n 1)))]
    )
  )

; Implementation
(define (memori fn)
  (letrec
      ([table '()]
       [store (lambda (arg val)
                (set! table 
                      (cons (cons arg val) table)
                      ) val)]
       [retrieve
        (lambda (arg)
          (let ((val-pair (assoc arg table)))
            (if 
             val-pair 
             (cdr val-pair)
             #f
             )
            )
          )
        ]
       [ensure-val
        (lambda (x)
          (let ([stored-val (retrieve x)])
            (if
             stored-val
             stored-val
             (store x (fn x))
             )
            )
          )]
       )
    ensure-val
    )
  )

(define memo-harm (memori harm))
(set! harm (memori harm))


(memo-harm 30)