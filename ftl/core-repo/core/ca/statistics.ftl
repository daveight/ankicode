# The date a card will be ready to review
statistics-due-date = Planificades
# The count of cards waiting to be reviewed
statistics-due-count = Pendents
# Shown in the Due column of the Browse screen when the card is a new card
statistics-due-for-new-card =
    { $number ->
        [one] Nova #{ $number }
       *[other] Noves #{ $number }
    }

## eg 16.8s (3.6 cards/minute)

statistics-cards-per-min = { $cards-per-minute } targetes per minut
statistics-average-answer-time = { $average-seconds }s ({ statistics-cards-per-min })

## A span of time studying took place in, for example
## "(studied 30 cards) in 3 minutes"

statistics-in-time-span-seconds =
    { $amount ->
        [one] en { $amount } segon
       *[other] en { $amount } segons
    }
statistics-in-time-span-minutes =
    { $amount ->
        [one] en { $amount } minut
       *[other] en { $amount } minuts
    }
statistics-in-time-span-hours =
    { $amount ->
        [one] en { $amount } hora
       *[other] en { $amount } hores
    }
statistics-in-time-span-days =
    { $amount ->
        [one] en { $amount } dia
       *[other] en { $amount } dies
    }
statistics-in-time-span-months =
    { $amount ->
        [one] en { $amount } mes
       *[other] en { $amount } mesos
    }
statistics-in-time-span-years =
    { $amount ->
        [one] en { $amount } any
       *[other] en { $amount } anys
    }
statistics-cards =
    { $cards ->
        [one] { $cards } targeta
       *[other] { $cards } targetes
    }
# a count of how many cards have been answered, eg "Total: 34 reviews"
statistics-reviews =
    { $reviews ->
        [one] { $reviews } repàs
       *[other] { $reviews } repassos
    }
# Shown at the bottom of the deck list, and in the statistics screen.
# eg "Studied 3 cards in 13 seconds today (4.33s/card)."
# The { statistics-in-time-span-seconds } part should be pasted in from the English
# version unmodified.
statistics-studied-today =
    Avui heu estudiat { statistics-cards } { $unit ->
        [seconds] { statistics-in-time-span-seconds }
        [minutes] { statistics-in-time-span-minutes }
        [hours] { statistics-in-time-span-hours }
        [days] { statistics-in-time-span-days }
        [months] { statistics-in-time-span-months }
       *[years] { statistics-in-time-span-years }
    } ({ $secs-per-card } segons per targeta)
statistics-today-title = Avui
statistics-today-again-count = Oblidades:
statistics-today-type-counts = Apreses: { $learnCount }, Repassades: { $reviewCount }, Tornades a aprendre: { $relearnCount }, Filtrades: { $filteredCount }
statistics-today-no-cards = Avui no heu estudiat cap targeta.
statistics-today-no-mature-cards = Avui no heu estudiat cap targeta madura.
statistics-today-correct-mature = Respostes correcotes en les targetes madures: { $correct }/{ $total } ({ $percent }%)
statistics-counts-total-cards = Nombre total de targetes
statistics-counts-new-cards = Noves
statistics-counts-young-cards = Joves
statistics-counts-mature-cards = Madures
statistics-counts-suspended-cards = Suspeses
statistics-counts-buried-cards = Enterrades
statistics-counts-filtered-cards = Filtrades
statistics-counts-learning-cards = Aprenent
statistics-counts-relearning-cards = Reaprenent
statistics-counts-title = Recompte de targetes
statistics-counts-separate-suspended-buried-cards = Separa les targetes suspeses/enterrades
statistics-range-all-time = vida de la baralla
statistics-range-1-year-history = últims 12 mesos
statistics-range-all-history = tot l'historial
statistics-range-deck = baralla
statistics-range-collection = col·lecció
statistics-range-search = Cercar
statistics-card-ease-title = Facilitat de la targeta
statistics-card-ease-subtitle = Com més baixa sigui la facilitat, més freqüentment apareixerà la targeta.
# eg "3 cards with 150-170% ease"
statistics-card-ease-tooltip =
    { $cards ->
        [one] 1 targeta amb { $percent } facilitat
       *[other] { $cards } targetes amb { $percent } facilitat
    }
statistics-future-due-title = Previsió
statistics-future-due-subtitle = Nombre de repassos futurs programats.
statistics-added-title = Afegides
statistics-added-subtitle = Nombre de targetes noves que heu afegit.
statistics-reviews-count-subtitle = Nombre de preguntes que heu respost.
statistics-reviews-time-subtitle = Temps que heu trigat a respondre les preguntes.
statistics-answer-buttons-title = Botons de resposta
# eg Button: 4
statistics-answer-buttons-button-number = Botó
# eg Times pressed: 123
statistics-answer-buttons-button-pressed = Vegades que l'heu premut
statistics-answer-buttons-subtitle = Nombre de vegades que heu premut cada botó.
statistics-reviews-title = Repassos
statistics-reviews-time-checkbox = Durada
statistics-in-days-single =
    { $days ->
        [0] Avui
        [1] Demà
       *[other] En { $days } dies
    }
statistics-in-days-range = En { $daysStart }-{ $daysEnd } dies
statistics-days-ago-single =
    { $days ->
        [1] Ahir
       *[other] { $days }  enrere
    }
statistics-days-ago-range = Fa { $daysStart }-{ $daysEnd } dies
statistics-running-total = Total acumulat
statistics-cards-due =
    { $cards ->
        [one] Una targeta pendent
       *[other] { $cards } targetes pendents
    }
statistics-backlog-checkbox = Acumulació
statistics-intervals-title = Intervals
statistics-intervals-subtitle = Nombre de targetes en funció del seu interval de repàs.
statistics-intervals-day-range =
    { $cards ->
        [one] 1 targeta amb un interval de { $daysStart }~{ $daysEnd } dies
       *[other] { $cards } targetes amb un interval de { $daysStart }~{ $daysEnd } dies
    }
statistics-intervals-day-single =
    { $cards ->
        [one] 1 targeta amb un interval de  { $day } dies
       *[other] { $cards } targetes amb un interval de { $day } dies
    }
# hour range, eg "From 14:00-15:00"
statistics-hours-range = Des de { $hourStart }:00~{ $hourEnd }:00
statistics-hours-correct = { $correct }/{ $total } correctes ({ $percent }%)
statistics-hours-title = Distribució horària
statistics-hours-subtitle = Percentatge de repassos correctes al llarg del dia.
# shown when graph is empty
statistics-no-data = SENSE DADES
statistics-calendar-title = Calendari

## An amount of elapsed time, used in the graphs to show the amount of
## time spent studying. For example, English would show "5s" for 5 seconds,
## "13.5m" for 13.5 minutes, and so on.
##
## Please try to keep the text short, as longer text may get cut off.

statistics-elapsed-time-seconds = { $amount }s
statistics-elapsed-time-minutes = { $amount }m
statistics-elapsed-time-hours = { $amount }h
statistics-elapsed-time-days = { $amount }d
statistics-elapsed-time-months = { $amount }me
statistics-elapsed-time-years = { $amount }a

##

statistics-average-for-days-studied = Mitjana per dia estudiat
statistics-total = Total
statistics-days-studied = Dies que heu estudiat
statistics-average-answer-time-label = Temps de resposta mitjà
statistics-average = Mitjana
statistics-average-interval = Interval mitjà
statistics-due-tomorrow = Programades per a demà
# eg 5 of 15 (33.3%)
statistics-amount-of-total-with-percentage = { $amount } de { $total } ({ $percent }%)
statistics-average-over-period = Mitjana si haguéssiu estudiat tots els dies
statistics-reviews-per-day =
    { $count ->
        [one] { $count } repàs/dia
       *[other] { $count } repassos/dia
    }
statistics-minutes-per-day =
    { $count ->
        [one] { $count } minut/dia
       *[other] { $count } minuts/dia
    }
statistics-cards-per-day =
    { $count ->
        [one] { $count } targeta/dia
       *[other] { $count } targetes/dia
    }
statistics-average-ease = Facilitat mitjana
statistics-save-pdf = Guarda en PDF
statistics-saved = Guardat.
statistics-stats = estadístiques
