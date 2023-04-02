# The date a card will be ready to review
statistics-due-date = תאריך יעד
# The count of cards waiting to be reviewed
statistics-due-count = מתוזמנים
# Shown in the Due column of the Browse screen when the card is a new card
statistics-due-for-new-card = חדש #{ $number }

## eg 16.8s (3.6 cards/minute)

statistics-cards-per-min = { $cards-per-minute } כרטיסים/דקה
statistics-average-answer-time = { $average-seconds }שניות ({ statistics-cards-per-min })

## A span of time studying took place in, for example
## "(studied 30 cards) in 3 minutes"

statistics-in-time-span-seconds =
    { $amount ->
        [one] תוך { $amount } שניה
        [two] תוך { $amount } שניות
        [many] תוך { $amount } שניות
       *[other] תוך { $amount } שניות
    }
statistics-in-time-span-minutes =
    { $amount ->
        [one] תוך { $amount } דקה
        [two] תוך { $amount } דקות
        [many] תוך { $amount } דקות
       *[other] תוך { $amount } דקות
    }
statistics-in-time-span-hours =
    { $amount ->
        [one] תוך { $amount } שעה
        [two] תוך { $amount } שעות
        [many] תוך { $amount } שעות
       *[other] תוך { $amount } שעות
    }
statistics-in-time-span-days =
    { $amount ->
        [one] תוך { $amount } יום
        [two] תוך { $amount } ימים
        [many] תוך { $amount } ימים
       *[other] תוך { $amount } ימים
    }
statistics-in-time-span-months =
    { $amount ->
        [one] תוך { $amount } חודש
        [two] תוך { $amount } חודשים
        [many] תוך { $amount } חודשים
       *[other] תוך { $amount } חודשים
    }
statistics-in-time-span-years =
    { $amount ->
        [one] תוך { $amount } שנה
        [two] תוך { $amount } שנים
        [many] תוך { $amount } שנים
       *[other] תוך { $amount } שנים
    }
statistics-cards =
    { $cards ->
        [one] { $cards } כרטיס
        [two] { $cards } כרטיסים
        [many] { $cards } כרטיסים
       *[other] { $cards } כרטיסים
    }
# a count of how many cards have been answered, eg "Total: 34 reviews"
statistics-reviews =
    { $reviews ->
        [one] { $reviews } חזרה
        [two] { $reviews } חזרות
        [many] { $reviews } חזרות
       *[other] { $reviews } חזרות
    }
# Shown at the bottom of the deck list, and in the statistics screen.
# eg "Studied 3 cards in 13 seconds today (4.33s/card)."
# The { statistics-in-time-span-seconds } part should be pasted in from the English
# version unmodified.
statistics-studied-today =
    נלמדו { statistics-cards }
    { $unit ->
        [seconds] { statistics-in-time-span-seconds }
        [minutes] { statistics-in-time-span-minutes }
        [hours] { statistics-in-time-span-hours }
        [days] { statistics-in-time-span-days }
        [months] { statistics-in-time-span-months }
       *[years] { statistics-in-time-span-years }
    } היום
# eg, "Time taken to review card: 5s"
statistics-seconds-taken = { $seconds } שניות
statistics-today-title = היום
statistics-today-again-count = מנין השגיאות:
statistics-today-type-counts = לימוד:{ $learnCount }, חזרות: { $reviewCount }, לימוד מחדש: { $relearnCount }, מסוננים: { $filteredCount }
statistics-today-no-cards = לא נלמדו כרטיסים היום.
statistics-today-no-mature-cards = לא נלמדו כרטיסים בוגרים היום.
statistics-today-correct-mature = תשובות נכונות בכרטיסים בוגרים: { $correct }/{ $total } ({ $percent }%)
statistics-counts-total-cards = סך-הכל כרטיסים
statistics-counts-new-cards = חדשים
statistics-counts-young-cards = צעירים
statistics-counts-mature-cards = בוגרים
statistics-counts-suspended-cards = מושהים
statistics-counts-buried-cards = מוטמנים
statistics-counts-filtered-cards = מסונן
statistics-counts-learning-cards = נלמדים
statistics-counts-relearning-cards = נלמדים מחדש
statistics-counts-title = מניין הכרטיסים
statistics-counts-separate-suspended-buried-cards = הפרד בין כרטיסים מושהים למוטמנים.
statistics-range-all-time = משך חיי חפיסה
statistics-range-1-year-history = בשנה האחרונה
statistics-range-all-history = מאז ומתמיד
statistics-range-deck = חפיסה
statistics-range-collection = אוסף
statistics-range-search = חיפוש
statistics-card-ease-title = קלות הכרטיס
statistics-card-ease-subtitle = ככל שהקלות נמוכה יותר, כך גוברת התדירות שהכרטיס יופיע.
# eg "3 cards with 150-170% ease"
statistics-card-ease-tooltip =
    { $cards ->
        [one] כרטיס 1 עם קלות { $percent }
       *[other] { $cards } כרטיסים עם קלות { $percent }
    }
statistics-future-due-title = תחזית
statistics-future-due-subtitle = מספר החזרות המתוכננות בעתיד.
statistics-added-title = נוספו
statistics-added-subtitle = מספר הכרטיסים החדשים שהוספת.
statistics-reviews-count-subtitle = מספר השאלות שענית עליהן.
statistics-reviews-time-subtitle = הזמן שלקח לך לענות על השאלות.
statistics-answer-buttons-title = כפתורי תשובה
# eg Button: 4
statistics-answer-buttons-button-number = לחצן
# eg Times pressed: 123
statistics-answer-buttons-button-pressed = מספר לחיצות
statistics-answer-buttons-subtitle = מספר הפעמים שלחצת על כל לחצן.
statistics-reviews-title = חזרות
statistics-reviews-time-checkbox = זמן
statistics-in-days-single =
    { $days ->
        [0] היום
        [1] מחר
        [one] בעוד { $days } יום
       *[other] בעוד { $days } ימים
    }
statistics-in-days-range = בעוד { $daysStart }-{ $daysEnd } ימים
statistics-days-ago-single =
    { $days ->
        [1] אתמול
        [one] לפני { $days } יום
       *[other] לפני { $days } ימים
    }
statistics-days-ago-range = לפני { $daysStart }-{ $daysEnd } ימים
statistics-running-total = סה"כ רץ
statistics-cards-due =
    { $cards ->
        [one] 1 כרטיס מתוזמן
       *[other] { $cards } כרטיסים מתוזמנים
    }
statistics-backlog-checkbox = מצטבר
statistics-intervals-title = מרווחי זמן
statistics-intervals-subtitle = הזמן שעובר עד שחזרות מופיעות שנית.
statistics-intervals-day-range =
    { $cards ->
        [one] 1 כרטיס עם מרווח זמן של { $daysStart }~{ $daysEnd } ימים
       *[other] { $cards } כרטיסים עם מרווח זמן של { $daysStart }~{ $daysEnd } ימים
    }
statistics-intervals-day-single =
    { $cards ->
        [one] 1 כרטיס עם { $day } יום מרווח זמן
       *[other] { $cards } כרטיסים עם { $day } יום מרווח זמן
    }
# hour range, eg "From 14:00-15:00"
statistics-hours-range = מ- { $hourStart }:00~{ $hourEnd }:00
statistics-hours-correct = { $correct }/{ $total } נכונים ({ $percent }%)
statistics-hours-title = פילוח שעתי
statistics-hours-subtitle = ניקוד הצלחה בחזרות לכל שעה ביום.
# shown when graph is empty
statistics-no-data = אין נתונים
statistics-calendar-title = לוח שנה

## An amount of elapsed time, used in the graphs to show the amount of
## time spent studying. For example, English would show "5s" for 5 seconds,
## "13.5m" for 13.5 minutes, and so on.
##
## Please try to keep the text short, as longer text may get cut off.

statistics-elapsed-time-seconds = { $amount } שניות
statistics-elapsed-time-minutes = { $amount } ד'
statistics-elapsed-time-hours = { $amount }שע'
statistics-elapsed-time-days = { $amount } ימים
statistics-elapsed-time-months = { $amount }ח'
statistics-elapsed-time-years = { $amount } שנ'

##

statistics-average-for-days-studied = ממוצע עבור ימים שנלמדו
statistics-total = סך-הכל
statistics-days-studied = ימי לימוד
statistics-average-answer-time-label = זמן תשובה ממוצע
statistics-average = ממוצע
statistics-average-interval = מרווח ממוצע
statistics-longest-interval = מרווח הזמן הארוך ביותר
statistics-due-tomorrow = מתוזמן למחר
# eg 5 of 15 (33.3%)
statistics-amount-of-total-with-percentage = { $amount } מתוך { $total } ({ $percent }%)
statistics-average-over-period = אם למדת כל יום
statistics-reviews-per-day =
    { $count ->
        [one] { $count } חזרה ליום
       *[other] { $count } חזרות ליום
    }
statistics-minutes-per-day =
    { $count ->
        [one] { $count } דקה ליום
       *[other] { $count } דקות ליום
    }
statistics-cards-per-day =
    { $count ->
        [one] { $count } כרטיס ליום
       *[other] { $count } כרטיסים ליום
    }
statistics-average-ease = קלות ממוצעת
statistics-save-pdf = שמור כ-PDF
statistics-saved = נשמר.
statistics-stats = סטטיסטיקה
