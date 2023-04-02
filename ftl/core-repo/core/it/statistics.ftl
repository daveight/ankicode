# The date a card will be ready to review
statistics-due-date = Scadenza
# The count of cards waiting to be reviewed
statistics-due-count = Programmate
# Shown in the Due column of the Browse screen when the card is a new card
statistics-due-for-new-card = Nuova #{ $number }

## eg 16.8s (3.6 cards/minute)

statistics-cards-per-min = { $cards-per-minute } carte/minuto
statistics-average-answer-time = { $average-seconds }s ({ statistics-cards-per-min })

## A span of time studying took place in, for example
## "(studied 30 cards) in 3 minutes"

statistics-in-time-span-seconds =
    { $amount ->
        [one] in { $amount } secondo
       *[other] in { $amount } secondi
    }
statistics-in-time-span-minutes =
    { $amount ->
        [one] in { $amount } minuto
       *[other] in { $amount } minuti
    }
statistics-in-time-span-hours =
    { $amount ->
        [one] in { $amount } ora
       *[other] in { $amount } ore
    }
statistics-in-time-span-days =
    { $amount ->
        [one] in { $amount } giorno
       *[other] in { $amount } giorni
    }
statistics-in-time-span-months =
    { $amount ->
        [one] in { $amount } mese
       *[other] in { $amount } mesi
    }
statistics-in-time-span-years =
    { $amount ->
        [one] in { $amount } anno
       *[other] in { $amount } anni
    }
statistics-cards =
    { $cards ->
        [one] { $cards } carta
       *[other] { $cards } carte
    }
# a count of how many cards have been answered, eg "Total: 34 reviews"
statistics-reviews =
    { $reviews ->
        [one] { $reviews } ripetizione
       *[other] { $reviews } ripetizioni
    }
# Shown at the bottom of the deck list, and in the statistics screen.
# eg "Studied 3 cards in 13 seconds today (4.33s/card)."
# The { statistics-in-time-span-seconds } part should be pasted in from the English
# version unmodified.
statistics-studied-today =
    Studiato { statistics-cards } { $unit ->
        [seconds] { statistics-in-time-span-seconds }
        [minutes] { statistics-in-time-span-minutes }
        [hours] { statistics-in-time-span-hours }
        [days] { statistics-in-time-span-days }
        [months] { statistics-in-time-span-months }
       *[years] { statistics-in-time-span-years }
    } oggi ({ $secs-per-card }s/carta)
statistics-today-title = Oggi
statistics-today-again-count = Carte fallite:
statistics-today-type-counts = Impara: { $learnCount }, Ripeti: { $reviewCount }, Reimpara: { $relearnCount }, Filtrate: { $filteredCount }
statistics-today-no-cards = Oggi non è stata studiata nessuna carta.
statistics-today-no-mature-cards = Nessuna carta matura studiata oggi.
statistics-today-correct-mature = Carte mature corrette: { $correct }/{ $total } ({ $percent }%)
statistics-counts-total-cards = Carte totali
statistics-counts-new-cards = Nuove
statistics-counts-young-cards = Giovani
statistics-counts-mature-cards = Mature
statistics-counts-suspended-cards = Sospese
statistics-counts-buried-cards = Seppellite
statistics-counts-filtered-cards = Filtrate
statistics-counts-learning-cards = In apprendimento
statistics-counts-relearning-cards = In reapprendimento
statistics-counts-title = Carte
statistics-counts-separate-suspended-buried-cards = Separa le carte sospese/seppellite
statistics-range-all-time = vita del mazzo
statistics-range-1-year-history = ultimi 12 mesi
statistics-range-all-history = tutto
statistics-range-deck = mazzo
statistics-range-collection = collezione
statistics-range-search = Cerca
statistics-card-ease-title = Facilità della carta
statistics-card-ease-subtitle = Più bassa è la facilità, più frequentemente la carta apparirà.
# eg "3 cards with 150-170% ease"
statistics-card-ease-tooltip =
    { $cards ->
        [one] { $cards } carta con { $percent } di facilità
       *[other] { $cards } carte con { $percent } di facilità
    }
statistics-future-due-title = Previsioni
statistics-future-due-subtitle = Numero di ripetizioni che scadranno in futuro.
statistics-added-title = Carte Aggiunte
statistics-added-subtitle = Numero di carte nuove che hai aggiunto.
statistics-reviews-count-subtitle = Numero di domande alle quali hai risposto.
statistics-reviews-time-subtitle = Tempo impiegato per rispondere alle domande.
statistics-answer-buttons-title = Pulsanti di risposta
# eg Button: 4
statistics-answer-buttons-button-number = Pulsante
# eg Times pressed: 123
statistics-answer-buttons-button-pressed = Numero di volte premuto
statistics-answer-buttons-subtitle = Numero di volte che hai premuto ogni pulsante.
statistics-reviews-title = Ripetizioni
statistics-reviews-time-checkbox = Durata
statistics-in-days-single =
    { $days ->
        [0] Oggi
        [1] Domani
        [one] In { $days } giorno
       *[other] In { $days } giorni
    }
statistics-in-days-range = In { $daysStart }-{ $daysEnd } giorni
statistics-days-ago-single =
    { $days ->
        [1] Ieri
       *[other] { $days } giorni fa
    }
statistics-days-ago-range = { $daysStart }-{ $daysEnd } giorni fa
statistics-running-total = Totale accumulato
statistics-cards-due =
    { $cards ->
        [one] { $cards } carta in programma
       *[other] { $cards } carte in programma
    }
statistics-backlog-checkbox = Arretrato
statistics-intervals-title = Intervalli
statistics-intervals-subtitle = Differimento della ripresentazione delle ripetizioni.
statistics-intervals-day-range =
    { $cards ->
        [one] { $cards } carta con un intervallo di { $daysStart }-{ $daysEnd } giorni
       *[other] { $cards } carte con un intervallo di { $daysStart }-{ $daysEnd } giorni
    }
statistics-intervals-day-single =
    { $cards ->
        [one] { $cards } carta con un intervallo di { $day } giorni
       *[other] { $cards } carte con un intervallo di { $day } giorni
    }
# hour range, eg "From 14:00-15:00"
statistics-hours-range = Da { $hourStart }:00~{ $hourEnd }:00
statistics-hours-correct = { $correct }/{ $total } corrette ({ $percent }%)
statistics-hours-title = Suddivisione per ora del giorno
statistics-hours-subtitle = Successo delle ripetizioni per ora del giorno
# shown when graph is empty
statistics-no-data = NESSUN DATO
statistics-calendar-title = Calendario

## An amount of elapsed time, used in the graphs to show the amount of
## time spent studying. For example, English would show "5s" for 5 seconds,
## "13.5m" for 13.5 minutes, and so on.
##
## Please try to keep the text short, as longer text may get cut off.

statistics-elapsed-time-seconds = { $amount }s
statistics-elapsed-time-minutes = { $amount }m
statistics-elapsed-time-hours = { $amount }h
statistics-elapsed-time-days = { $amount }g
statistics-elapsed-time-months = { $amount }me
statistics-elapsed-time-years = { $amount }a

##

statistics-average-for-days-studied = Media per i giorni di studio
statistics-total = Totale
statistics-days-studied = Giorni di studio
statistics-average-answer-time-label = Tempo medio di risposta
statistics-average = Media
statistics-average-interval = Intervallo medio
statistics-due-tomorrow = Da ripetere domani
# eg 5 of 15 (33.3%)
statistics-amount-of-total-with-percentage = { $amount } di { $total } ({ $percent }%)
statistics-average-over-period = Se avessi studiato ogni giorno
statistics-reviews-per-day =
    { $count ->
        [one] { $count } ripetizione/giorno
       *[other] { $count } ripetizioni/giorno
    }
statistics-minutes-per-day =
    { $count ->
        [one] { $count } minuto/giorno
       *[other] { $count } minuti/giorno
    }
statistics-cards-per-day =
    { $count ->
        [one] { $count } carta/giorno
       *[other] { $count } carte/giorno
    }
statistics-average-ease = Facilità media
statistics-save-pdf = Salva pdf
statistics-saved = Salvato.
statistics-stats = statistiche
