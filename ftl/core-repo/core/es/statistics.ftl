# The date a card will be ready to review
statistics-due-date = Programadas
# The count of cards waiting to be reviewed
statistics-due-count = Programadas
# Shown in the Due column of the Browse screen when the card is a new card
statistics-due-for-new-card =
    { $number ->
        [one] Nueva #{ $number }
       *[other] Nuevas #{ $number }
    }

## eg 16.8s (3.6 cards/minute)

statistics-cards-per-min = { $cards-per-minute } tarjetas/minuto
statistics-average-answer-time = { $average-seconds }s ({ statistics-cards-per-min })

## A span of time studying took place in, for example
## "(studied 30 cards) in 3 minutes"

statistics-in-time-span-seconds =
    { $amount ->
        [one] en { $amount } segundo
       *[other] en { $amount } segundos
    }
statistics-in-time-span-minutes =
    { $amount ->
        [one] en { $amount } minuto
       *[other] en { $amount } minutos
    }
statistics-in-time-span-hours =
    { $amount ->
        [one] en { $amount } horas
       *[other] en { $amount } horas
    }
statistics-in-time-span-days =
    { $amount ->
        [one] en { $amount } día
       *[other] en { $amount } dias
    }
statistics-in-time-span-months =
    { $amount ->
        [one] en { $amount } mes
       *[other] en { $amount } meses
    }
statistics-in-time-span-years =
    { $amount ->
        [one] en { $amount } año
       *[other] en { $amount } años
    }
statistics-cards =
    { $cards ->
        [one] { $cards } tarjeta
       *[other] { $cards } tarjetas
    }
# a count of how many cards have been answered, eg "Total: 34 reviews"
statistics-reviews =
    { $reviews ->
        [one] { $reviews } repaso
       *[other] { $reviews } repasos
    }
# Shown at the bottom of the deck list, and in the statistics screen.
# eg "Studied 3 cards in 13 seconds today (4.33s/card)."
# The { statistics-in-time-span-seconds } part should be pasted in from the English
# version unmodified.
statistics-studied-today =
    Estudiadas { statistics-cards } { $unit ->
        [seconds] { statistics-in-time-span-seconds }
        [minutes] { statistics-in-time-span-minutes }
        [hours] { statistics-in-time-span-hours }
        [days] { statistics-in-time-span-days }
        [months] { statistics-in-time-span-months }
       *[years] { statistics-in-time-span-years }
    } hoy ({ $secs-per-card }s/tarjeta)
statistics-today-title = Hoy
statistics-today-again-count = Total de otra vez:
statistics-today-type-counts = Aprender: { $learnCount }, Repasar: { $reviewCount }, Reaprender: { $relearnCount }, Filtradas: { $filteredCount }
statistics-today-no-cards = Hoy no has estudiado ninguna tarjeta.
statistics-today-no-mature-cards = Hoy no se estudiaron tarjetas maduras.
statistics-today-correct-mature = Respuestas correctas en las tarjetas maduras: { $correct }/{ $total } ({ $percent }%)
statistics-counts-total-cards = Tarjetas totales
statistics-counts-new-cards = Nuevas
statistics-counts-young-cards = Jóvenes
statistics-counts-mature-cards = Maduras
statistics-counts-suspended-cards = Suspendidas
statistics-counts-buried-cards = Enterrados
statistics-counts-filtered-cards = Filtrado
statistics-counts-learning-cards = Aprendiendo
statistics-counts-relearning-cards = Reaprendiendo
statistics-counts-title = Conteo de Tarjetas
statistics-counts-separate-suspended-buried-cards = Separar tarjetas suspendidas/enterradas
statistics-range-all-time = vida del mazo
statistics-range-1-year-history = últimos 12 meses
statistics-range-all-history = todo el historial
statistics-range-deck = mazo
statistics-range-collection = colección
statistics-range-search = Buscar
statistics-card-ease-title = Facilidad de la Tarjeta
statistics-card-ease-subtitle = Cómo más baja sea la facilidad, más frequentemente aparecerá la tarjeta.
# eg "3 cards with 150-170% ease"
statistics-card-ease-tooltip =
    { $cards ->
        [one] 1 tarjeta con { $percent } facilidad
       *[other] { $cards } tarjetas con { $percent } facilidad
    }
statistics-future-due-title = Pronóstico
statistics-future-due-subtitle = El número de repasos programados en el futuro.
statistics-added-title = Añadidas
statistics-added-subtitle = El número de tarjetas nuevas que has añadido.
statistics-reviews-count-subtitle = El número de preguntas que has respondido.
statistics-reviews-time-subtitle = El tiempo que has tardado en responder a las preguntas.
statistics-answer-buttons-title = Botones de respuesta
# eg Button: 4
statistics-answer-buttons-button-number = Botón
# eg Times pressed: 123
statistics-answer-buttons-button-pressed = Veces presionado
statistics-answer-buttons-subtitle = El número de veces que has presionado cada botón.
statistics-reviews-title = Repasos
statistics-reviews-time-checkbox = Tiempo
statistics-in-days-single =
    { $days ->
        [0] Hoy
        [1] Mañana
       *[other] En { $days } dias
    }
statistics-in-days-range = En { $daysStart }-{ $daysEnd } dias
statistics-days-ago-single =
    { $days ->
        [1] Ayer
       *[other] { $days }  atrás
    }
statistics-days-ago-range = { $daysStart }-{ $daysEnd } dias atrás
statistics-running-total = Total acumulado
statistics-cards-due =
    { $cards ->
        [one] 1 tarjeta vencida
       *[other] { $cards } tarjetas vencidas
    }
statistics-backlog-checkbox = Acumulación
statistics-intervals-title = Intervalos
statistics-intervals-subtitle = Intervalos antes de que vuelvan a aparecer las tarjetas de revisión
statistics-intervals-day-range =
    { $cards ->
        [one] 1 tarjeta con un interval de { $daysStart }~{ $daysEnd } dias
       *[other] { $cards } tarjetas con un interval de  { $daysStart }~{ $daysEnd } dias
    }
statistics-intervals-day-single =
    { $cards ->
        [one] 1 tarjeta con un interval de  { $day } dias
       *[other] { $cards } tarjetas con un interval de { $day } dias
    }
# hour range, eg "From 14:00-15:00"
statistics-hours-range = Desde { $hourStart }:00~{ $hourEnd }:00
statistics-hours-correct = { $correct }/{ $total } correcto ({ $percent }%)
statistics-hours-title = Distribución horaria
statistics-hours-subtitle = Porcentaje de repasos correctos a lo largo del día.
# shown when graph is empty
statistics-no-data = SIN DATOS
statistics-calendar-title = Calendario

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

statistics-average-for-days-studied = Promedio en los días estudiados
statistics-total = Total
statistics-days-studied = Días estudiados
statistics-average-answer-time-label = Tiempo de respuesta promedio
statistics-average = Promedio
statistics-average-interval = Intervalo promedio
statistics-due-tomorrow = Programadas para mañana
# eg 5 of 15 (33.3%)
statistics-amount-of-total-with-percentage = { $amount } de { $total } ({ $percent }%)
statistics-average-over-period = Si hubieses estudiado todos los días
statistics-reviews-per-day =
    { $count ->
        [one] { $count } revisión/día
       *[other] { $count } revisiones/día
    }
statistics-minutes-per-day =
    { $count ->
        [one] { $count } minuto/día
       *[other] { $count } minutos/día
    }
statistics-cards-per-day =
    { $count ->
        [one] { $count } tarjeta/día
       *[other] { $count } tarjetas/día
    }
statistics-average-ease = Facilidad promedio
statistics-save-pdf = Guardar PDF
statistics-saved = Guardado.
statistics-stats = estadísticas
