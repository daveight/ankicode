# The date a card will be ready to review
statistics-due-date = Чакаюць
# The count of cards waiting to be reviewed
statistics-due-count = Чакаюць
# Shown in the Due column of the Browse screen when the card is a new card
statistics-due-for-new-card = Новая №{ $number }

## eg 16.8s (3.6 cards/minute)

statistics-cards-per-min =
    { $cards-per-minute ->
        [one] { $cards-per-minute } картка ў хвіліну
        [few] { $cards-per-minute } карткі ў хвіліну
        [many] { $cards-per-minute } картак у хвіліну
       *[other] { $cards-per-minute } картак у хвіліну
    }
statistics-average-answer-time = { $average-seconds } с ({ statistics-cards-per-min })

## A span of time studying took place in, for example
## "(studied 30 cards) in 3 minutes"

statistics-in-time-span-seconds =
    { $amount ->
        [one] за { $amount } секунду
        [few] за { $amount } секунды
        [many] за { $amount } секунд
       *[other] за { $amount } секунд
    }
statistics-in-time-span-minutes =
    { $amount ->
        [one] за { $amount } хвіліну
        [few] за { $amount } хвіліны
        [many] за { $amount } хвілін
       *[other] за { $amount } хвілін
    }
statistics-in-time-span-hours =
    { $amount ->
        [one] за { $amount } гадзіну
        [few] за { $amount } гадзіны
        [many] за { $amount } гадзін
       *[other] за { $amount } гадзін
    }
statistics-in-time-span-days =
    { $amount ->
        [one] за { $amount } дзень
        [few] за { $amount } дні
        [many] за { $amount } дзён
       *[other] за { $amount } дзён
    }
statistics-in-time-span-months =
    { $amount ->
        [one] за { $amount } месяц
        [few] за { $amount } месяцы
        [many] за { $amount } месяцаў
       *[other] за { $amount } месяцаў
    }
statistics-in-time-span-years =
    { $amount ->
        [one] за { $amount } год
        [few] за { $amount } гады
        [many] за { $amount } гадоў
       *[other] за { $amount } гадоў
    }
statistics-cards =
    { $cards ->
        [one] { $cards } картка
        [few] { $cards } карткі
        [many] { $cards } картак
       *[other] { $cards } картак
    }
# a count of how many cards have been answered, eg "Total: 34 reviews"
statistics-reviews =
    { $reviews ->
        [one] { $reviews } перагляд
        [few] { $reviews } перагляды
        [many] { $reviews } пераглядаў
       *[other] { $reviews } пераглядаў
    }
# Shown at the bottom of the deck list, and in the statistics screen.
# eg "Studied 3 cards in 13 seconds today (4.33s/card)."
# The { statistics-in-time-span-seconds } part should be pasted in from the English
# version unmodified.
statistics-studied-today =
    Сёння вывучана { statistics-cards } { $unit ->
        [seconds] { statistics-in-time-span-seconds }
        [minutes] { statistics-in-time-span-minutes }
        [hours] { statistics-in-time-span-hours }
        [days] { statistics-in-time-span-days }
        [months] { statistics-in-time-span-months }
       *[years] { statistics-in-time-span-years }
    } ({ $secs-per-card } с/картку)
statistics-today-title = Сёння
statistics-today-again-count = Колькасць забытых картак:
statistics-today-type-counts = Вывучаюцца: { $learnCount }, на перагляд: { $reviewCount }, на паўторнае вывучэнне: { $relearnCount }, фільтраваных: { $filteredCount }
statistics-today-no-cards = Сёння карткі не праглядаліся.
statistics-today-no-mature-cards = Сталыя карткі сёння не праглядаліся.
statistics-today-correct-mature = Правільных адказаў да сталых картак: { $correct }/{ $total } ({ $percent }%)
statistics-counts-total-cards = Усяго картак
statistics-counts-new-cards = Новыя
statistics-counts-young-cards = Маладыя карткі
statistics-counts-mature-cards = Сталыя карткі
statistics-counts-suspended-cards = Прыпыненыя
statistics-counts-buried-cards = Адкладзеныя
statistics-counts-filtered-cards = Фільтраваныя
statistics-counts-learning-cards = Вывучаюцца
statistics-counts-relearning-cards = Вывучаюцца паўторна
statistics-counts-title = Колькасць картак
statistics-counts-separate-suspended-buried-cards = Раздзяляць прыпыненыя/адкладзеныя карткі
statistics-range-all-time = агулам
statistics-range-1-year-history = апошнія 12 месяцаў
statistics-range-all-history = уся гісторыя
statistics-range-deck = калода
statistics-range-collection = калекцыя
statistics-range-search = Пошук
statistics-card-ease-title = Лёгкасць карткі
statistics-card-ease-subtitle = Чым ніжэй лёгкасці, тым часцей будзе з’яўляцца картка.
# eg "3 cards with 150-170% ease"
statistics-card-ease-tooltip =
    { $cards ->
        [one] картка
        [few] карткі
        [many] картак
       *[other] картак
    } з лёгкасцю ў { $percent }
statistics-future-due-title = Прагноз
statistics-future-due-subtitle = Колькасць пераглядаў чаканых у будучыні.
statistics-added-title = Дададзена
statistics-added-subtitle = Колькасць новых дададзеных вамі картак.
statistics-reviews-count-subtitle = Колькасць пытанняў, на якія вы адказалі.
statistics-reviews-time-subtitle = Час адказу на пытанне.
statistics-answer-buttons-title = Кнопкі адказу
# eg Button: 4
statistics-answer-buttons-button-number = Кнопка
# eg Times pressed: 123
statistics-answer-buttons-button-pressed = Колькасць націсканняў
statistics-answer-buttons-subtitle = Колькасць націсканняў вамі кожнай кнопкі.
statistics-reviews-title = На перагляд
statistics-reviews-time-checkbox = Час
statistics-in-days-single =
    { $days ->
        [0] Сёння
        [1] Заўтра
        [one] За { $days } дзень
        [few] За { $days } дні
        [many] За { $days } дзён
       *[other] За { $days } дзён
    }
statistics-in-days-range = За { $daysStart }-{ $daysEnd } дзён
statistics-days-ago-single =
    { $days ->
        [1] Учора
        [one] { $days } дзень таму
        [few] { $days } дні таму
        [many] { $days } дзён таму
       *[other] { $days } дзён таму
    }
statistics-days-ago-range = { $daysStart }-{ $daysEnd } дзён таму
statistics-running-total = Прамежкавы вынік
statistics-cards-due =
    { $cards ->
        [one] { $cards } картка
        [few] { $cards } карткі
        [many] { $cards } картак
       *[other] { $cards } картак
    } чакае
statistics-backlog-checkbox = Адставанне
statistics-intervals-title = Інтэрвалы пераглядаў
# hour range, eg "From 14:00-15:00"
statistics-hours-range = З { $hourStart }:00~{ $hourEnd }:00
statistics-hours-correct = { $correct }/{ $total } правільных ({ $percent }%)
statistics-hours-title = Разбіўка па гадзінах
statistics-hours-subtitle = Пераглядзець ацэнку паспяховасці для кожнай гадзіны дня.
# shown when graph is empty
statistics-no-data = НЯМА ДАНЫХ
statistics-calendar-title = Каляндар

## An amount of elapsed time, used in the graphs to show the amount of
## time spent studying. For example, English would show "5s" for 5 seconds,
## "13.5m" for 13.5 minutes, and so on.
##
## Please try to keep the text short, as longer text may get cut off.

statistics-elapsed-time-seconds = { $amount } с
statistics-elapsed-time-minutes = { $amount } хв
statistics-elapsed-time-hours = { $amount } гадз
statistics-elapsed-time-days = { $amount } д.
statistics-elapsed-time-months = { $amount } мес.
statistics-elapsed-time-years = { $amount } г.

##

statistics-average-for-days-studied = Сярэдняе за дні навучання
statistics-total = Усяго
statistics-days-studied = Дзён навучання
statistics-average-answer-time-label = Сярэдні час адказу
statistics-average = Сярэдняе
statistics-average-interval = Сярэдні інтэрвал
statistics-due-tomorrow = На заўтра
# eg 5 of 15 (33.3%)
statistics-amount-of-total-with-percentage = { $amount } з { $total } ({ $percent }%)
statistics-average-over-period = Сярэдняе за перыяд
statistics-reviews-per-day =
    { $count ->
        [one] { $count } перагляд у
        [few] { $count } перагляды ў
        [many] { $count } пераглядаў у
       *[other] { $count } пераглядаў у
    } дзень
statistics-minutes-per-day =
    { $count ->
        [one] { $count } хвіліна ў
        [few] { $count } хвіліны ў
        [many] { $count } хвілін у
       *[other] { $count } хвілін у
    } дзень
statistics-cards-per-day =
    { $count ->
        [one] { $count } картка ў
        [few] { $count } карткі ў
        [many] { $count } картак у
       *[other] { $count } картак у
    } дзень
statistics-average-ease = Сярэдняя лёгкасць
statistics-save-pdf = Захаваць PDF
statistics-saved = Захавана.
statistics-stats = статыстыка
