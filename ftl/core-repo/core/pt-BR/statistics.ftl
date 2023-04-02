# The date a card will be ready to review
statistics-due-date = A Revisar
# The count of cards waiting to be reviewed
statistics-due-count = A Revisar
# Shown in the Due column of the Browse screen when the card is a new card
statistics-due-for-new-card = Novo #{ $number }

## eg 16.8s (3.6 cards/minute)

statistics-cards-per-min = { $cards-per-minute } cartões/minuto
statistics-average-answer-time = { $average-seconds }s ({ statistics-cards-per-min })

## A span of time studying took place in, for example
## "(studied 30 cards) in 3 minutes"

statistics-in-time-span-seconds =
    { $amount ->
        [one] em { $amount } segundo
       *[other] em { $amount } segundos
    }
statistics-in-time-span-minutes =
    { $amount ->
        [one] em { $amount } minuto
       *[other] em { $amount } minutos
    }
statistics-in-time-span-hours =
    { $amount ->
        [one] em { $amount } hora
       *[other] em { $amount } horas
    }
statistics-in-time-span-days =
    { $amount ->
        [one] em { $amount } dia
       *[other] em { $amount } dias
    }
statistics-in-time-span-months =
    { $amount ->
        [one] em { $amount } mês
       *[other] em { $amount } meses
    }
statistics-in-time-span-years =
    { $amount ->
        [one] em { $amount } ano
       *[other] em { $amount } anos
    }
statistics-cards =
    { $cards ->
        [one] { $cards } cartão
       *[other] { $cards } cartões
    }
# a count of how many cards have been answered, eg "Total: 34 reviews"
statistics-reviews =
    { $reviews ->
        [one] { $reviews } revisão
       *[other] { $reviews } revisões
    }
# Shown at the bottom of the deck list, and in the statistics screen.
# eg "Studied 3 cards in 13 seconds today (4.33s/card)."
# The { statistics-in-time-span-seconds } part should be pasted in from the English
# version unmodified.
statistics-studied-today =
    Estudado(s) { statistics-cards } { $unit ->
        [seconds] { statistics-in-time-span-seconds }
        [minutes] { statistics-in-time-span-minutes }
        [hours] { statistics-in-time-span-hours }
        [days] { statistics-in-time-span-days }
        [months] { statistics-in-time-span-months }
       *[years] { statistics-in-time-span-years }
    } hoje ({ $secs-per-card }s/card)
statistics-today-title = Hoje
statistics-today-again-count = Contagem de repetições:
statistics-today-type-counts = Aprendidos: { $learnCount }, Revisados: { $reviewCount }, Reaprendidos: { $relearnCount }, Filtrados: { $filteredCount }
statistics-today-no-cards = Nenhum cartão foi estudada hoje
statistics-today-no-mature-cards = Nenhum cartão antigo foi estudado hoje.
statistics-today-correct-mature = Resposta correta de cartões antigos: { $correct }/{ $total } ({ $percent }%)
statistics-counts-total-cards = Total de cartões
statistics-counts-new-cards = Novos
statistics-counts-young-cards = Recentes
statistics-counts-mature-cards = Maduros
statistics-counts-suspended-cards = Suspensos
statistics-counts-buried-cards = Ocultos
statistics-counts-filtered-cards = Filtrados
statistics-counts-learning-cards = Aprendendo
statistics-counts-relearning-cards = Reaprendendo
statistics-counts-title = Contagem de Cartões
statistics-counts-separate-suspended-buried-cards = Separar cartões suspensos/ocultos
statistics-range-all-time = sempre
statistics-range-1-year-history = últimos 12 meses
statistics-range-all-history = todo histórico
statistics-range-deck = baralho
statistics-range-collection = coleção
statistics-range-search = Procurar
statistics-card-ease-title = Facilidade do Cartão
statistics-card-ease-subtitle = Quanto menor a facilidade, mais frequentemente o cartão aparecerá.
# eg "3 cards with 150-170% ease"
statistics-card-ease-tooltip =
    { $cards ->
        [one] Um cartão com { $percent } de facilidade
       *[other] { $cards } cartões com { $percent } de facilidade
    }
statistics-future-due-title = Previsão
statistics-future-due-subtitle = O número de revisões agendadas para o futuro.
statistics-added-title = Adicionado
statistics-added-subtitle = O número de novos cartões que você adicionou.
statistics-reviews-count-subtitle = O número de questões que você já respondeu.
statistics-reviews-time-subtitle = O tempo gasto para responder às questões.
statistics-answer-buttons-title = Botões de resposta
# eg Button: 4
statistics-answer-buttons-button-number = Botão
# eg Times pressed: 123
statistics-answer-buttons-button-pressed = Vezes pressionadas
statistics-answer-buttons-subtitle = O número de vezes que você escolheu cada botão.
statistics-reviews-title = Revisões
statistics-reviews-time-checkbox = Tempo
statistics-in-days-single =
    { $days ->
        [0] Hoje
        [1] Amanhã
        [one] Em { $days } dia
       *[other] Em { $days } dias
    }
statistics-in-days-range = Em { $daysStart }-{ $daysEnd } dias
statistics-days-ago-single =
    { $days ->
        [1] Ontem
        [one] { $days } dia atrás
       *[other] { $days } dias atrás
    }
statistics-days-ago-range = { $daysStart }-{ $daysEnd } dias atrás
statistics-running-total = Total acumulado
statistics-cards-due =
    { $cards ->
        [one] Um cartão de revisão
       *[other] { $cards } cartões de revisão
    }
statistics-backlog-checkbox = Acumulado
statistics-intervals-title = Intervalos
statistics-intervals-subtitle = Intervalos entre as revisões.
statistics-intervals-day-range =
    { $cards ->
        [one] Um cartão com um intervalo de { $daysStart }~{ $daysEnd } dias
       *[other] { $cards } cartões com um intervalo de { $daysStart }~{ $daysEnd } dias
    }
statistics-intervals-day-single =
    { $cards ->
        [one] Um cartão com um intervalo de { $day } dia(s)
       *[other] { $cards } cartões com um intervalo de { $day } dia(s)
    }
# hour range, eg "From 14:00-15:00"
statistics-hours-range = De { $hourStart }:00~{ $hourEnd }:00
statistics-hours-correct = { $correct }/{ $total } correto ({ $percent }%)
statistics-hours-title = Distribuição por hora
statistics-hours-subtitle = Rever a taxa de sucesso para cada hora do dia.
# shown when graph is empty
statistics-no-data = SEM DADOS
statistics-calendar-title = Calendário

## An amount of elapsed time, used in the graphs to show the amount of
## time spent studying. For example, English would show "5s" for 5 seconds,
## "13.5m" for 13.5 minutes, and so on.
##
## Please try to keep the text short, as longer text may get cut off.

statistics-elapsed-time-seconds = { $amount }s
statistics-elapsed-time-minutes = { $amount }m
statistics-elapsed-time-hours = { $amount }h
statistics-elapsed-time-days = { $amount }d
statistics-elapsed-time-months = { $amount }m.
statistics-elapsed-time-years = { $amount }a

##

statistics-average-for-days-studied = Média dos dias estudados
statistics-total = Total
statistics-days-studied = Dias estudados
statistics-average-answer-time-label = Tempo médio de resposta
statistics-average = Média
statistics-average-interval = Intervalo médio
statistics-due-tomorrow = A Revisar amanhã
# eg 5 of 15 (33.3%)
statistics-amount-of-total-with-percentage = { $amount } de { $total } ({ $percent }%)
statistics-average-over-period = Se você estudou todos os dias
statistics-reviews-per-day =
    { $count ->
        [one] { $count } revisão/dia
       *[other] { $count } revisões/dia
    }
statistics-minutes-per-day =
    { $count ->
        [one] { $count } minuto/dia
       *[other] { $count } minutos/dia
    }
statistics-cards-per-day =
    { $count ->
        [one] { $count } cartão/dia
       *[other] { $count } cartões/dia
    }
statistics-average-ease = Dificuldade média
statistics-save-pdf = Salvar PDF
statistics-saved = Salvo.
statistics-stats = estatísticas
