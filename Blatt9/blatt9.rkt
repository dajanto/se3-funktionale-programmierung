#lang swindle

(require swindle/setf
         swindle/misc)

; 1.1
; Definiere eine Klasse "Video" mit mindestens folgenden Attributen: #eindeutigem Schlüssel#, #Name des Erstellers#, #Erscheinungsjahr#, #Titel der Veröffentlichung#
; Je nach Art des Videos (Film, Serie, YouTube-Video) sind noch zusätzliche Attribute notwendig. -> Vererbung?
; 1. Film: Attr: Produktionsgesellschaft, Regisseur, Genre, FSK
; 2. Serie: Attr: alles was Film hat und noch: Name der Plattform, Nummer der Folge
; 3. YT-Video: Attr: Name des Kanals, Link zum Video, Erscheinungsmonat 

; Video-Klasse
(defclass* video ()
  (schluessel
   :accessor schluesselAcc
   :reader get-schluessel
   :initarg :schluessel
   :initvalue 0
   :type <number>
   :documentation "Der eindeutige Schlüssel des Elements"
   )
  (ersteller
   :accessor erstellerAcc
   :reader get-ersteller
   :initarg :ersteller
   :initvalue ""
   :type <string>
   :documentation "Der Ersteller des Videos"
   )
  (erscheinungsjahr
   :accessor erscheinungsjahrAcc
   :reader get-erscheinungsjahr
   :initarg :erscheinungsjahr
   :initvalue 0
   :type <number>
   :documentation "Das Erscheinungsjahr des Videos"
   )
  (titel
   :accessor titelAcc
   :reader get-titel
   :initarg :titel
   :initvalue ""
   :type <string>
   :documentation "Der Titel des Videos"
   )
  )

; Film-Klasse
(defclass* film (video)
  (produktionsgesellschaft
   :accessor produktionsgesellschaftAcc
   :reader get-produktionsgesellschaft
   :initarg :produktionsgesellschaft
   :initvalue ""
   :type <string>
   :documentation "Die Produktionsgesellschaft des Films"
   )
  (regisseur
   :accessor regisseurAcc
   :reader get-regisseur
   :initarg :regisseur
   :initvalue ""
   :type <string>
   :documentation "Der Regisseur des Films"
   )
  (genre
   :accessor genreAcc
   :reader get-genre
   :initarg :genre
   :initvalue ""
   :type <string>
   :documentation "Das Genre des Films"
   )
  (fsk
   :accessor fskAcc
   :reader get-fsk
   :initarg :fsk
   :initvalue 0
   :type <number>
   :documentation "Die FSK des Films"
   )
  )

; Serien-Klasse
(defclass* serie (film)
  (plattform
   :accessor plattformAcc
   :reader get-plattform
   :initarg :plattform
   :initvalue ""
   :type <string>
   :documentation "Die Plattform auf der die Serie gezeigt wird"
   )
  (episode
   :accessor episodeAcc
   :reader get-episode
   :initarg :episode
   :initvalue 0
   :type <number>
   :documentation "Die Nummer der aktuellen Episode"
   )
  )

; YouTube-Video-Klasse
(defclass* youtube_video (video)
  (kanal
   :accessor kanalAcc
   :reader get-kanal
   :initarg :kanal
   :initvalue ""
   :type <string>
   :documentation "Der Name des Kanals von dem das YT Video stammt"
   )
  (link
   :accessor linkAcc
   :reader get-link
   :initarg :link
   :initvalue ""
   :type <string>
   :documentation "Der Link zum Video"
   )
  (erscheinungsmonat
   :accessor erscheinungsmonatAcc
   :reader get-erscheinungsmonat
   :initarg :erscheinungsmonat
   :initvalue 0
   :type <number>
   :documentation "Der Erscheinungsmonat des Youtubevideos"
   )
  )

; Beispielvideos:
(define _film
  (make film
        :schluessel 1
        :ersteller "Chris Bender"
        :erscheinungsjahr 2020
        :titel "Disneys Mulan"
        :produktionsgesellschaft "Walt Disney Pictures"
        :regisseur "Niki Caro"
        :genre "Abenteuer"
        :fsk 13
        )
  )

(define _serie
  (make serie
        :schluessel 2
        :ersteller "Paul Germain"
        :erscheinungsjahr 1997
        :titel "Disneys Große Pause"
        :produktionsgesellschaft "Walt Disney Televison Animation"
        :regisseur "Joe Ansolabehere"
        :genre "Dramedy"
        :fsk 0
        :plattform "ABC"
        :episode 1
        )
  )

(define _youtube_video
  (make youtube_video
        :schluessel 3
        :ersteller "Brayden Holness"
        :erscheinungsjahr 2019
        :titel "Spending Over $1,000 to RENEW my Annual Pass for Walt Disney World."
        :kanal "Mickey Views - All Things Disney News"
        :link "https://www.youtube.com/watch?v=TDnBjVGv5eQ"
        :erscheinungsmonat 6
        )
  )


; 1.2

; Generische Funktion und klassenbasierte Methoden:
(defgeneric* cite ((vi video)))

; Zitierfunktion für einen Film
(defmethod cite ((fi film))
  (string-append (produktionsgesellschaftAcc fi)
                 ", " 
                 (regisseurAcc fi)
                 ", " 
                 (genreAcc fi)
                 ", " 
                 (number->string(fskAcc fi))))
              
; Zitierfunktion für eine Serie
(defmethod cite ((s serie))
  (string-append (plattformAcc s)
                 ", " 
                 (number->string(episodeAcc s))))

; Zitierfunktion für ein YouTube-Video
(defmethod cite ((y youtube_video))
  (string-append (kanalAcc y)
                 ", " 
                 (linkAcc y)
                 ", " 
                 (number->string(erscheinungsmonatAcc y))))


; 2.1

; Eine CLOS-Klasse von Tieren für Lebensräume

; Landtiere
; - Arboreal
; - Saxicolous
; - Arenicolous
; - Troglofauna

; Meerestiere

; Flugfähige Lufttiere

(defclass* tiere ()
  (lebensraum
   :accessor lebensraumAcc
   :reader get-lebensraum
   :initarg :lebensraum
   :initvalue ""
   :type <string>
   :documentation "Der Lebensraum des Tiers"
   )
  (maximalgeschwindigkeit
   :accessor maximalgeschwindigkeitAcc
   :reader get-maximalgeschwindigkeit
   :initarg :maximalgeschwindigkeit
   :initvalue 0
   :type <number>
   :documentation "Der Maximalgeschwindigkeit des Tiers"
   )
  (gefaehrlichkeit
   :accessor gefaehrlichkeitAcc
   :reader get-gefaehrlichkeit
   :initarg :gefaehrlichkeit
   :initvalue 1
   :type <number>
   :documentation "Der Gefaehrlichkeit für den Menschen"
   )
  (verbrauch
   :accessor verbrauchAcc
   :reader get-verbrauch
   :initarg :verbrauch
   :initvalue 1
   :type <number>
   :documentation "Der Verbrauch des Tiers"
   )
  (lebenserwartung
   :accessor lebenserwartungAcc
   :reader get-lebenserwartung
   :initarg :lebenserwartung
   :initvalue 1
   :type <number>
   :documentation "Die Lebenserwartung des Tiers"
   )
  
  )

(defclass land (tiere)
  
  )

(defclass wasser (tiere)
  
  )

(defclass luft (land)
  
  )



(defclass* baum (land)
  
  )

(defclass* stein (land)
  
  )

(defclass* hoehle (land)
  
  )

(defclass* sand (land)
  
  )

(defclass* amphibie (land wasser)
  
  )



(defclass* flugfaehiges_landtier (luft land)
  
  )

(defclass* fantasie_fisch (wasser luft)
  
  )

(defclass* libellen (wasser luft land)
  
  )


; 2.2

(define _land
  (make land
        :lebensraum "asdf"
        :maximalgeschwindigkeit 1337
        :gefaehrlichkeit 50
        :verbrauch 70
        :lebenserwartung 100))

(define _luft
  (make luft
        :lebensraum "asdfqwer"
        :maximalgeschwindigkeit 13137
        :gefaehrlichkeit 5061
        :verbrauch 7023
        :lebenserwartung 10077))

(define _wasser
  (make wasser
        :lebensraum "asdffghj"
        :maximalgeschwindigkeit 1338
        :gefaehrlichkeit 505
        :verbrauch 701
        :lebenserwartung 1100))

; Generische Methoden
( defgeneric gib-lebensraum ((t tier)) :combination generic-append-combination)
( defgeneric gib-maxSpeed ((t tier)) :combination generic-min-combination)
( defgeneric gib-gefaehrlichkeit ((t tier)) :combination generic-max-combination)
( defgeneric gib-verbrauch ((t tier)) :combination generic-max-combination)
( defgeneric gib-lebenserwartung ((t tier)) :combination generic-min-combination)

; 2.3

;Methoden für das Attribut Maximalgeschwindigkeit
(defmethod gib-maxSpeed ((la land))
  (get-maximalgeschwindigkeit la))

(defmethod gib-maxSpeed ((wa wasser))
  (get-maximalgeschwindigkeit wa))

(defmethod gib-maxSpeed ((lu luft))
  (get-maximalgeschwindigkeit lu))

(defmethod gib-maxSpeed ((ba baum))
  (get-maximalgeschwindigkeit ba))

(defmethod gib-maxSpeed ((st stein))
  (get-maximalgeschwindigkeit st))

(defmethod gib-maxSpeed ((hoe hoehle))
  (get-maximalgeschwindigkeit hoe))

(defmethod gib-maxSpeed ((sa sand))
  (get-maximalgeschwindigkeit sa))

(defmethod gib-maxSpeed ((am amphibie))
  (get-maximalgeschwindigkeit am))

(defmethod gib-maxSpeed ((flula flugfaehiges_landtier))
  (get-maximalgeschwindigkeit flula))


(defmethod gib-maxSpeed ((fafi fantasie_fisch))
  (get-maximalgeschwindigkeit fafi))

(defmethod gib-maxSpeed ((li libellen))
  (get-maximalgeschwindigkeit li))


;Methoden für das Attribut Verbrauch
(defmethod gib-verbrauch ((la land))
  (get-verbrauch la))

(defmethod gib-verbrauch ((wa wasser))
  (get-verbrauch wa))

(defmethod gib-verbrauch ((lu luft))
  (get-verbrauch lu))

(defmethod gib-verbrauch ((ba baum))
  (get-verbrauch ba))

(defmethod gib-verbrauch ((st stein))
  (get-verbrauch st))

(defmethod gib-verbrauch ((hoe hoehle))
  (get-verbrauch hoe))

(defmethod gib-verbrauch ((sa sand))
  (get-verbrauch sa))

(defmethod gib-verbrauch ((am amphibie))
  (get-verbrauch am))

(defmethod gib-verbrauch ((flula flugfaehiges_landtier))
  (get-verbrauch flula))


(defmethod gib-verbrauch ((fafi fantasie_fisch))
  (get-verbrauch fafi))

(defmethod gib-verbrauch ((li libellen))
  (get-verbrauch li))


(displayln (gib-maxSpeed _land))
(displayln (gib-verbrauch _land))


(displayln (gib-maxSpeed _wasser))
(displayln (gib-verbrauch _wasser))

(displayln (gib-maxSpeed _luft))
(displayln (gib-verbrauch _luft))


#|

In CLOS existiert zu jeder Klasse eine Klassenpräzedenzsliste. Dadurch wird die
Objektorientierung ermöglicht. Es ist wichtig, die Klassen von denen geerbt wird
in der richtige Reihenfolge zu definieren, ansonst gibt es einen Fehler, da CLOS
dann die Vererbungsstruktur nicht richtig aufbauen kann. Durch diese Vererbungs-
struktur wird dann auch die Reihenfolge der Abarbeitung der Methoden festgelegt.
Zuerst wird die Methode der Klasse mit der höchsten Präzendenz ausgeführt und dann
falls eine combination-Regel existiert, auch die anderen tieferliegenden Klassen
berücksichtigt.

|#
