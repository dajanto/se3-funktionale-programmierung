#lang swindle

 (require swindle/setf
          swindle/misc)


; Aufgabe 1:

; 1.1)
; Definiere eine Klasse "Video" mit mindestens folgenden Attributen: #eindeutigem Schlüssel#, #Name des Erstellers#, #Erscheinungsjahr#, #Titel der Veröffentlichung#
; Je nach Art des Videos (Film, Serie, YouTube-Video) sind noch zusätzliche Attribute notwendig. -> Vererbung?
; 1. Film: Attr: Produktionsgesellschaft, Regisseur, Genre, FSK
; 2. Serie: Attr: alles was Film hat und noch: Name der Plattform, Nummer der Folge
; 3. YT-Video: Attr: Name des Kanals, Link zum Video, Erscheinungsmonat 

; Video Klasse

(defclass* video ()
  (schluessel
   :reader get-schluessel
   :initarg :schluessel
   :initvalue 0
   :type <number>
   :documentation "Der eindeutuge Schlüssel des Elements"
   )
  (ersteller
   :reader get-ersteller
   :initarg :ersteller
   :initvalue ""
   :type <string>
   :documentation "Der Ersteller des Videos"
   )
  (erscheinungsjahr
   :reader get-erscheinungsjahr
   :initarg :erscheinungsjahr
   :initvalue 0
   :type <number>
   :documentation "Das Erscheinungsjahr des Videos"
   )
  (titel
   :reader get-titel
   :initarg :titel
   :initvalue ""
   :type <string>
   :documentation "Der Titel des Videos"
   )
  )

; Film Klasse

(defclass* film (video)
  (produktionsgesellschafft
   :reader get-produktionsgesellschafft
   :initarg :produktionsgesellschafft
   :initvalue ""
   :type <string>
   :documentation "Die Produktionsgesellschafft des Films"
   )
  (regisseur
   :reader get-regisseur
   :initarg :regisseur
   :initvalue ""
   :type <string>
   :documentation "Der Regisseur des Films"
   )
  (genre
   :reader get-genre
   :initarg :genre
   :initvalue ""
   :type <string>
   :documentation "Das Genre des Films"
   )
  (fsk
   :reader get-fsk
   :initarg :fsk
   :initvalue 0
   :type <number>
   :documentation "Die FSK des Films"
   )
  )

; Serie Klasse

(defclass* serie (film)
  (plattform
   :reader get-plattform
   :initarg :plattform
   :initvalue ""
   :type <string>
   :documentation "Die Plattform auf der die Serie gezeigt wird"
   )
  (episode
   :reader get-episode
   :initarg :episode
   :initvalue 0
   :type <number>
   :documentation "Die Nummer der aktuellen Episode"
   )
  )

; Youtube-Video Klasse

(defclass* youtube_video (video)
  (kanal
   :reader get-kanal
   :initarg :kanal
   :initvalue ""
   :type <string>
   :documentation "Der Name des Kanals von dem das YT Video stammt"
   )
  (link
   :reader get-link
   :initarg :link
   :initvalue ""
   :type <string>
   :documentation "Der Link zum Video"
   )
  (erscheinungsmonat
   :reader get-erscheinungsmonat
   :initarg :erscheinungsmonat
   :initvalue 0
   :type <number>
   :documentation "Der Erscheinungsmonat des Youtubevideos"
   )
  )

; Beispiel Videos:

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
        :palttform "ABC"
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

; 1.2)

; TODO: Funktionen zu Ende implementieren

; Generische Funktion und klassenbasierte Methoden:

(defgeneric cite ((vi video) Zitat)
  )

; Zitierfunktion für einen Film

(defmethod cite ((f film))
  )

; Zitierfunktion für eine Serie

(defmethod cite ((s serie))
  )

; Zitierfunktion für ein Youtube-Video

(defmethod cite ((y youtube_video))
  )