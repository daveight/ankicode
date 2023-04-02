# The date a card will be ready to review
statistics-due-date = Esedékes
# The count of cards waiting to be reviewed
statistics-due-count = Esedékes
# Shown in the Due column of the Browse screen when the card is a new card
statistics-due-for-new-card = Új #{ $number }

## eg 16.8s (3.6 cards/minute)

statistics-cards-per-min = { $cards-per-minute } kártya/perc
statistics-average-answer-time = { $average-seconds }mp ({ statistics-cards-per-min })

## A span of time studying took place in, for example
## "(studied 30 cards) in 3 minutes"

statistics-in-time-span-seconds =
    { $amount ->
        [one] { $amount } másodperc alatt
       *[other] { $amount } másodperc alatt
    }
statistics-in-time-span-minutes =
    { $amount ->
        [one] { $amount } perc alatt
       *[other] { $amount } perc alatt
    }
statistics-in-time-span-hours =
    { $amount ->
        [one] { $amount } óra alatt
       *[other] { $amount } óra alatt
    }
statistics-in-time-span-days =
    { $amount ->
        [one] { $amount } nap alatt
       *[other] { $amount } nap alatt
    }
statistics-in-time-span-months =
    { $amount ->
        [one] { $amount } hónap alatt
       *[other] { $amount } hónap alatt
    }
statistics-in-time-span-years =
    { $amount ->
        [one] { $amount } év alatt
       *[other] { $amount } év alatt
    }
statistics-cards =
    { $cards ->
        [one] { $cards } kártyát
       *[other] { $cards } kártyát
    }
# a count of how many cards have been answered, eg "Total: 34 reviews"
statistics-reviews =
    { $reviews ->
        [one] { $reviews } ismétlés
       *[other] { $reviews } ismétlés
    }
# Shown at the bottom of the deck list, and in the statistics screen.
# eg "Studied 3 cards in 13 seconds today (4.33s/card)."
# The { statistics-in-time-span-seconds } part should be pasted in from the English
# version unmodified.
statistics-studied-today =
    { statistics-cards } kártyát tanult
    { $unit ->
        [seconds] { statistics-in-time-span-seconds }
        [minutes] { statistics-in-time-span-minutes }
        [hours] { statistics-in-time-span-hours }
        [days] { statistics-in-time-span-days }
        [months] { statistics-in-time-span-months }
       *[years] { statistics-in-time-span-years }
    }alatt a mai napon
    ({ $secs-per-card } mp/kártya)
statistics-today-title = Ma
statistics-today-again-count = „Újra” válaszok száma:
statistics-today-type-counts = Tanulás: { $learnCount }, ismétlés: { $reviewCount }, újratanulás: { $relearnCount }, szűrtek száma: { $filteredCount }
statistics-today-no-cards = Ma még nem tanultál.
statistics-today-no-mature-cards = Ma még egyetlen veterán kártyát sem tanultál.
statistics-today-correct-mature = Helyes válaszok a veterán kártyákra: { $correct }/{ $total } ({ $percent }%)
statistics-counts-total-cards = Kártyák összesen
statistics-counts-new-cards = Új
statistics-counts-young-cards = Friss
statistics-counts-mature-cards = Veterán
statistics-counts-suspended-cards = Felfüggesztve
statistics-counts-buried-cards = Elmentve
statistics-range-all-time = csomag élettartama
statistics-range-deck = csomag
statistics-range-collection = gyűjtemény
statistics-range-search = Keresés
statistics-future-due-title = Előrejelzés
statistics-reviews-title = Ismétlések
statistics-intervals-title = Időközök
statistics-answer-buttons-title = Válaszgombok
statistics-hours-title = Óránkénti lebontás
statistics-added-title = Hozzáadva
statistics-axis-label-answer-count = Válaszok
statistics-axis-label-card-count = Kártyák
statistics-axis-label-review-time = Ismétlésre fordított idő
statistics-future-due-subtitle = A továbbiakban esedékes ismétlések száma
statistics-added-subtitle = Az általad hozzáadott új kártyák száma.
statistics-reviews-count-subtitle = Megválaszolt kérdések száma
statistics-reviews-time-subtitle = A kérdések megválaszolásával eltöltött idő
statistics-intervals-subtitle = A következő ismétlésig hátralevő idő
statistics-answer-buttons-subtitle = Az egyes gombok lenyomásának száma
statistics-hours-subtitle = Ismétlés sikerességének aránya a nap egyes óráiban
statistics-counts-learning-cards = Tanulás
statistics-reviews-time-checkbox = Idő
statistics-average-for-days-studied = Átlagos időráfordítás a tanulással töltött napokon
statistics-total = Összesen
statistics-days-studied = Tanulással töltött napok
statistics-average-answer-time-label = Átlagos válaszadási idő
statistics-average = Átlagos
statistics-average-interval = Átlagos időköz
statistics-longest-interval = Leghosszabb időköz
statistics-due-tomorrow = Holnap esedékes
statistics-average-over-period = Ha mindennap tanulna
statistics-average-ease = Átlagos könnyűség
statistics-save-pdf = Mentés PDF-ként
statistics-saved = Mentve.
statistics-stats = statisztikák
