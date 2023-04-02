# The date a card will be ready to review
statistics-due-date = Due
# The count of cards waiting to be reviewed
statistics-due-count = À réviser
# Shown in the Due column of the Browse screen when the card is a new card
statistics-due-for-new-card = Nouvelle n°{ $number }

## eg 16.8s (3.6 cards/minute)

statistics-cards-per-min =
    { $cards-per-minute ->
        [one] { $cards-per-minute } carte/minute
       *[other] { $cards-per-minute } cartes/minute
    }
statistics-average-answer-time = { $average-seconds }s ({ statistics-cards-per-min })

## A span of time studying took place in, for example
## "(studied 30 cards) in 3 minutes"

statistics-in-time-span-seconds =
    { $amount ->
        [one] en { $amount } seconde
       *[other] en { $amount } secondes
    }
statistics-in-time-span-minutes =
    { $amount ->
        [one] en { $amount } minute
       *[other] en { $amount } minutes
    }
statistics-in-time-span-hours =
    { $amount ->
        [one] en { $amount } heure
       *[other] en { $amount } heures
    }
statistics-in-time-span-days =
    { $amount ->
        [one] en { $amount } jour
       *[other] en { $amount } jours
    }
statistics-in-time-span-months =
    { $amount ->
        [one] en { $amount } mois
       *[other] en { $amount } mois
    }
statistics-in-time-span-years =
    { $amount ->
        [one] en { $amount } année
       *[other] en { $amount } années
    }
statistics-cards =
    { $cards ->
        [one] { $cards } carte étudiée
       *[other] { $cards } cartes étudiées
    }
# a count of how many cards have been answered, eg "Total: 34 reviews"
statistics-reviews =
    { $reviews ->
        [one] { $reviews } révision
       *[other] { $reviews } révisions
    }
# Shown at the bottom of the deck list, and in the statistics screen.
# eg "Studied 3 cards in 13 seconds today (4.33s/card)."
# The { statistics-in-time-span-seconds } part should be pasted in from the English
# version unmodified.
statistics-studied-today =
    { statistics-cards }
    { $unit ->
        [seconds] { statistics-in-time-span-seconds }
        [minutes] { statistics-in-time-span-minutes }
        [hours] { statistics-in-time-span-hours }
        [days] { statistics-in-time-span-days }
        [months] { statistics-in-time-span-months }
       *[years] { statistics-in-time-span-years }
    } aujourd'hui
    ({ $secs-per-card }s/carte)
statistics-today-title = Aujourd’hui
statistics-today-again-count = Oublis :
statistics-today-type-counts = Apprises : { $learnCount }, Revues : { $reviewCount }, Réapprises : { $relearnCount }, Filtrées : { $filteredCount }
statistics-today-no-cards = Aucune carte étudiée aujourd'hui.
statistics-today-no-mature-cards = Aucune carte mature n'a été étudiée aujourd'hui.
statistics-today-correct-mature = Réponses exactes sur les cartes matures : { $correct }/{ $total } ({ $percent }%)
statistics-counts-total-cards = Nombre total de cartes
statistics-counts-new-cards = Inédites
statistics-counts-young-cards = Récentes
statistics-counts-mature-cards = Matures
statistics-counts-suspended-cards = Suspendues
statistics-counts-buried-cards = Enfouies
statistics-counts-filtered-cards = Filtrées
statistics-counts-learning-cards = À repasser
statistics-counts-relearning-cards = Réapprentissage
statistics-counts-title = Nombre de cartes
statistics-counts-separate-suspended-buried-cards = Séparer les cartes suspendues/enfouies
statistics-range-all-time = vie du paquet
statistics-range-1-year-history = 12 derniers mois
statistics-range-all-history = tout l'historique
statistics-range-deck = paquet
statistics-range-collection = collection
statistics-range-search = Chercher
statistics-card-ease-title = Facilité de la carte
statistics-card-ease-subtitle = Moins une carte est facile, plus souvent elle apparaîtra.
# eg "3 cards with 150-170% ease"
statistics-card-ease-tooltip =
    { $cards ->
        [one] 1 carte avec { $percent } de facilité.
       *[other] { $cards } cartes avec { $percent } de facilité.
    }
statistics-future-due-title = Charge de travail
statistics-future-due-subtitle = Prévision du nombre de cartes à réviser selon leur jour d’échéance et leur statut.
statistics-added-title = Ajoutées
statistics-added-subtitle = Le nombre de nouvelles cartes que vous avez ajoutées.
statistics-reviews-count-subtitle = La part et le nombre de révisions selon le statut de la carte.
statistics-reviews-time-subtitle = Le temps passé à répondre selon le jour et selon le statut de la carte.
statistics-answer-buttons-title = Boutons de réponse
# eg Button: 4
statistics-answer-buttons-button-number = Bouton
# eg Times pressed: 123
statistics-answer-buttons-button-pressed = Nombre d'appuis
statistics-answer-buttons-subtitle = Le choix des divers boutons en fonction de l’ancienneté de la carte.
statistics-reviews-title = Révisions
statistics-reviews-time-checkbox = Durée
statistics-in-days-single =
    { $days ->
        [0] Aujourd'hui
        [1] Demain
        [one] Dans { $days } jours
       *[other] Dans { $days } jours
    }
statistics-in-days-range = Dans { $daysStart }-{ $daysEnd } jours
statistics-days-ago-single =
    { $days ->
        [1] Hier
        [one] il y a { $days } jours
       *[other] il y a { $days } jours
    }
statistics-days-ago-range = Il y a { $daysStart }-{ $daysEnd } jours
statistics-running-total = Total cumulé
statistics-cards-due =
    { $cards ->
        [one] 1 carte  expirée
       *[other] { $cards } cartes  expirées
    }
statistics-backlog-checkbox = cumul
statistics-intervals-title = Intervalles
statistics-intervals-subtitle = Le nombre de cartes en fonction de leur intervalle de révision.
statistics-intervals-day-range =
    { $cards ->
        [one] 1 carte avec un intervalle de { $daysStart }~{ $daysEnd } jours
       *[other] { $cards } cartes avec un intervalle de { $daysStart }~{ $daysEnd } jours
    }
statistics-intervals-day-single =
    { $cards ->
        [one] 1 carte avec un intervalle de { $day } jours
       *[other] { $cards } cartes avec un intervalle de { $day } jours
    }
# hour range, eg "From 14:00-15:00"
statistics-hours-range = De { $hourStart }:00~{ $hourEnd }:00
statistics-hours-correct = { $correct }/{ $total } correctes ({ $percent }%)
statistics-hours-title = Répartition horaire
statistics-hours-subtitle = Taux de révisions réussies en fonction de l’heure du jour.
# shown when graph is empty
statistics-no-data = PAS DE DONNEE
statistics-calendar-title = Calendrier

## An amount of elapsed time, used in the graphs to show the amount of
## time spent studying. For example, English would show "5s" for 5 seconds,
## "13.5m" for 13.5 minutes, and so on.
##
## Please try to keep the text short, as longer text may get cut off.

statistics-elapsed-time-seconds = { $amount }s
statistics-elapsed-time-minutes = { $amount }m
statistics-elapsed-time-hours = { $amount }h
statistics-elapsed-time-days = { $amount }d
statistics-elapsed-time-months = { $amount }mois
statistics-elapsed-time-years = { $amount }année

##

statistics-average-for-days-studied = Moyenne (par jour travaillé)
statistics-total = Total
statistics-days-studied = Jours travaillés
statistics-average-answer-time-label = Durée de réponse moyenne
statistics-average = Moyenne
statistics-average-interval = Intervalle moyen
statistics-due-tomorrow = Prévues pour demain
# eg 5 of 15 (33.3%)
statistics-amount-of-total-with-percentage = { $amount } sur { $total } ({ $percent }%)
statistics-average-over-period = Moyenne (tous jours confondus)
statistics-reviews-per-day =
    { $count ->
        [one] { $count } révision/jour
       *[other] { $count } révisions/jour
    }
statistics-minutes-per-day =
    { $count ->
        [one] { $count } minute/jour
       *[other] { $count } minutes/jour
    }
statistics-cards-per-day =
    { $count ->
        [one] { $count } carte/jour
       *[other] { $count } cartes/jour
    }
statistics-average-ease = Facilité moyenne
statistics-save-pdf = Enregistrer en PDF
statistics-saved = Enregistré
statistics-stats = statistiques
