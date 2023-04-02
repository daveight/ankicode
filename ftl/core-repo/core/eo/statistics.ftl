statistics-due-date = Limdato
statistics-due-count = Limdato
statistics-cards-per-min = { $cards-per-minute } kartoj/minuto
statistics-in-time-span-seconds =
    { $amount ->
        [one] en { $amount } sekundo
       *[other] en { $amount } sekundoj
    }
statistics-in-time-span-minutes =
    { $amount ->
        [one] en { $amount } minuto
       *[other] en { $amount } minutoj
    }
statistics-in-time-span-hours =
    { $amount ->
        [one] en { $amount } horo
       *[other] en { $amount } horoj
    }
statistics-in-time-span-days =
    { $amount ->
        [one] en { $amount } tago
       *[other] en { $amount } tagoj
    }
statistics-in-time-span-months =
    { $amount ->
        [one] en { $amount } monato
       *[other] en { $amount } monatoj
    }
statistics-in-time-span-years =
    { $amount ->
        [one] en { $amount } jaro
       *[other] en { $amount } jaroj
    }
statistics-studied-today =
    Vi hodiaŭ lernis { statistics-cards } { $unit ->
        [seconds] { statistics-in-time-span-seconds }
        [minutes] { statistics-in-time-span-minutes }
        [hours] { statistics-in-time-span-hours }
        [days] { statistics-in-time-span-days }
        [months] { statistics-in-time-span-months }
       *[years] { statistics-in-time-span-years }
    } ({ $secs-per-card }s/karto)
statistics-cards =
    { $cards ->
        [one] { $cards } karto
       *[other] { $cards } kartoj
    }
statistics-reviews =
    { $reviews ->
        [one] { $reviews } ripeto
       *[other] { $reviews } ripetoj
    }
statistics-today-title = Hodiaŭ
statistics-today-again-count = Denove-nombro:
statistics-today-type-counts = Por lerni: { $learnCount }, ripeti: { $reviewCount }, relerni: { $relearnCount }, filtrilaĵo: { $filteredCount }
statistics-today-no-cards = Hodiaŭ vi lernis neniujn kartojn.
statistics-today-no-mature-cards = Hodiaŭ vi lernis neniujn maljunajn kartojn.
statistics-today-correct-mature = Ĝustaj respondoj ĉe maljunaj kartoj: { $correct }/{ $total } ({ $percent }%)
statistics-counts-total-cards = Kartoj entute
statistics-counts-new-cards = Nova
statistics-counts-young-cards = Juna
statistics-counts-mature-cards = Maljuna
statistics-counts-suspended-cards = Daŭre kaŝita
statistics-counts-buried-cards = kaŝita por tago
statistics-range-all-time = Ekde kreo
statistics-range-deck = kartaro
statistics-range-collection = kolekto
statistics-range-search = Serĉi
statistics-future-due-title = Prognozo
statistics-reviews-title = Ripetoj
statistics-intervals-title = Intertempoj
statistics-answer-buttons-title = Respondobutonoj
statistics-hours-title = Hora disigo
statistics-added-title = Aldonita
statistics-axis-label-answer-count = Respondoj
statistics-axis-label-card-count = Kartoj
statistics-axis-label-review-time = Tempo de ripeto
statistics-future-due-subtitle = La nombro de ripetoj, kiuj estas lernendaj en la estonto.
statistics-added-subtitle = La nombro de novaj kartoj, kiujn vi aldonis.
statistics-reviews-count-subtitle = Nombro de demandoj, kiujn vi respondis.
statistics-reviews-time-subtitle = La tempo, kiu pasis por respondi la demandojn.
statistics-intervals-subtitle = Intertempoj ĝis ripetoj denove montriĝas.
statistics-answer-buttons-subtitle = Nombro de fojoj kiam vi premis specifajn butonojn.
statistics-hours-subtitle = Sukceso-proporcio al horoj de la tago
statistics-counts-learning-cards = Lernado
statistics-reviews-time-checkbox = Tempo
statistics-average-for-days-studied = Meznombro por lerntagoj
statistics-total = Sumo
statistics-days-studied = Tagoj de lernado
statistics-average-answer-time-label = Mezuma respondotempo
statistics-average = Meznombro
statistics-average-interval = Mezuma intertempo
statistics-longest-interval = Plej longa intertempo
statistics-due-tomorrow = Lernenda morgaŭ
statistics-average-over-period = Se vi lernus ĉiutage
statistics-average-ease = Mezuma facileco
statistics-save-pdf = Konservi kiel PDF
statistics-saved = Konservita.
statistics-stats = statistikoj
