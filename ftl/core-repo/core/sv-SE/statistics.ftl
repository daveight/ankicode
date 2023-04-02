statistics-due-date = Aktuella
statistics-due-count = Aktuella
statistics-cards-per-min = { $cards-per-minute } kort/minut
statistics-in-time-span-seconds =
    { $amount ->
        [one] en { $amount } sekund
       *[other] en { $amount } sekunder
    }
statistics-in-time-span-minutes =
    { $amount ->
        [one] en { $amount } minut
       *[other] en { $amount } minuter
    }
statistics-in-time-span-hours =
    { $amount ->
        [one] en { $amount } timme
       *[other] en { $amount } timmar
    }
statistics-in-time-span-days =
    { $amount ->
        [one] en { $amount } dag
       *[other] en { $amount } dagar
    }
statistics-in-time-span-months =
    { $amount ->
        [one] en { $amount } månad
       *[other] en { $amount } månader
    }
statistics-in-time-span-years =
    { $amount ->
        [one] en { $amount } år
       *[other] en { $amount } år
    }
statistics-studied-today =
    Studerade { statistics-cards } { $unit ->
        [seconds] { statistics-in-time-span-seconds }
        [minutes] { statistics-in-time-span-minutes }
        [hours] { statistics-in-time-span-hours }
        [days] { statistics-in-time-span-days }
        [months] { statistics-in-time-span-months }
       *[years] { statistics-in-time-span-years }
    } idag ({ $secs-per-card }s/kort)
statistics-cards =
    { $cards ->
        [one] { $cards } kort
       *[other] { $cards } kort
    }
statistics-reviews =
    { $reviews ->
        [one] { $reviews } repetition
       *[other] { $reviews } repetitioner
    }
statistics-today-title = Idag
statistics-today-again-count = Felaktiga svar:
statistics-today-type-counts = Att lära: { $learnCount }, Repetera: { $reviewCount }, Att lära om: { $relearnCount }, Filtrerade: { $filteredCount }
statistics-today-no-mature-cards = Inga mogna kort studerades idag.
statistics-today-correct-mature = Korrekta svar på mogna kort: { $correct }/{ $total } ({ $percent }%)
statistics-counts-total-cards = Totalt antal kort
statistics-counts-new-cards = Nya
statistics-counts-young-cards = Unga
statistics-counts-mature-cards = Mogna
statistics-counts-suspended-cards = Uteslutet
statistics-counts-buried-cards = Gömt
statistics-range-all-time = kortlekens liv
statistics-range-deck = kortlek
statistics-range-collection = samling
statistics-range-search = Sök
statistics-future-due-title = Prognos
statistics-reviews-title = Repetitioner
statistics-intervals-title = Intervaller
statistics-answer-buttons-title = Svarsknappar
statistics-hours-title = Sammanställning per timme
statistics-added-title = Tillagda
statistics-axis-label-answer-count = Svar
statistics-axis-label-card-count = Kort
statistics-axis-label-review-time = Repetitionstid
statistics-future-due-subtitle = Hur många repetitioner som du måste göra senare.
statistics-added-subtitle = Antalet nya kort du lagt till.
statistics-reviews-count-subtitle = Antalet repetitioner du gjort.
statistics-reviews-time-subtitle = Hur lång tid det tagit att repetera korten.
statistics-intervals-subtitle = Tid tills du får repetera ett kort igen.
statistics-answer-buttons-subtitle = Antalet gånger du tryckt på varje knapp.
statistics-hours-subtitle = Hur ofta du svarar rätt beroende på tidpunkt på dagen.
statistics-counts-learning-cards = Nya
statistics-reviews-time-checkbox = Tid
statistics-average-for-days-studied = Genomsnitt för dagar med studier
statistics-total = Totalt
statistics-days-studied = Dagar med studier
statistics-average-answer-time-label = Genomsnittlig svarstid
statistics-average = Genomsnitt
statistics-average-interval = Genomsnittligt intervall
statistics-longest-interval = Längsta intervall
statistics-due-tomorrow = Schemalagda imorgon
statistics-average-over-period = Om du skulle studera varje dag
statistics-average-ease = Genomsnittlig lätthet
statistics-save-pdf = Spara PDF
statistics-stats = statistik
