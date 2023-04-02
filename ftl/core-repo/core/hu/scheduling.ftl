## The next time a card will be shown, in a short form that will fit
## on the answer buttons. For example, English shows "4d" to
## represent the card will be due in 4 days, "3m" for 3 minutes, and
## "5mo" for 5 months.

scheduling-answer-button-time-seconds = { $amount } mp
scheduling-answer-button-time-minutes = { $amount } p
scheduling-answer-button-time-hours = { $amount } ó
scheduling-answer-button-time-days = { $amount } n
scheduling-answer-button-time-months = { $amount } hó
scheduling-answer-button-time-years = { $amount } év

## A span of time, such as the delay until a card is shown again, the
## amount of time taken to answer a card, and so on. It is used by itself,
## such as in the Interval column of the browse screen,
## and labels like "Total Time" in the card info screen.

scheduling-time-span-seconds =
    { $amount ->
        [one] { $amount } mp
       *[other] { $amount } mp
    }
scheduling-time-span-minutes =
    { $amount ->
        [one] { $amount } perc
       *[other] { $amount } perc
    }
scheduling-time-span-hours =
    { $amount ->
        [one] { $amount } óra
       *[other] { $amount } óra
    }
scheduling-time-span-days =
    { $amount ->
        [one] { $amount } nap
       *[other] { $amount } nap
    }
scheduling-time-span-months =
    { $amount ->
        [one] { $amount } hónap
       *[other] { $amount } hónap
    }
scheduling-time-span-years =
    { $amount ->
        [one] { $amount } év
       *[other] { $amount } év
    }

## Shown in the "Congratulations!" message after study finishes.

# eg "The next learning card will be ready in 5 minutes."
scheduling-next-learn-due =
    A következő kártyája { $unit ->
        [seconds]
            { $amount ->
                [one] { $amount } másodperc
               *[other] { $amount } másodperc
            }
        [minutes]
            { $amount ->
                [one] { $amount } perc
               *[other] { $amount } perc
            }
       *[hours]
            { $amount ->
                [one] { $amount } óra
               *[other] { $amount } óra
            }
    } múlva esedékes.
scheduling-learn-remaining =
    { $remaining ->
        [one] A mai napra van még egy kártyája
       *[other] A mai napra még { $remaining } kártyája van.
    }
scheduling-congratulations-finished = Gratulálok! Mára Ön végzett ezzel a paklival.
scheduling-today-review-limit-reached =
    A mai ismétlési limitet elérte, de vannak még ismételendő kártyák.
    Az optimális memorizálás érdekében érdemes lehet a beállítások között
    megnövelnie a napi limitet.
scheduling-today-new-limit-reached =
    Van még új kártya, de elérte a napi limitet. Növelheti a limitet
    a beállításoknál, de kérjük, tartsa szem előtt, hogy minél több
    új kártyát vezet be, annál megterhelőbb lesz a rövid távú ismétlés.
scheduling-buried-cards-were-delayed = Egyes kapcsolódó vagy félretett kártyákat későbbre halasztottunk.
scheduling-always-include-question-side-when-replaying = Mindig tartalmazzon kérdési oldalt hang lejátszásakor
scheduling-at-least-one-step-is-required = Legalább egy lépés szükséges
scheduling-automatically-play-audio = Hang automatikus lejátszása
scheduling-bury-related-new-cards-until-the = Kapcsolódó új kártyák félretevése másnapig
scheduling-bury-related-reviews-until-the-next = Kapcsolódó ismétlések félretevése másnapig
scheduling-days = nap
scheduling-description = Leírás
scheduling-description-to-show-on-overview-screen = A jelenlegi pakliról az áttekintő képernyőn megjelenő leírás:
scheduling-easy-bonus = Könnyű válasznál adott bónusz
scheduling-easy-interval = Könnyű válasz időköze
scheduling-end = (vége)
scheduling-general = Általános
scheduling-graduating-interval = Előrelépési időköz
scheduling-hard-interval = Nehéz válasz időköze
scheduling-ignore-answer-times-longer-than = Ennél hosszabb válaszidő figyelmen kívül hagyása:
scheduling-interval-modifier = Időköz-módosító
scheduling-lapses = Elakadások
scheduling-lapses2 = elakadás
scheduling-learning = Tanulás
scheduling-leech-action = Mumus-szavak kezelése
scheduling-leech-threshold = Mumus-szavak küszöbértéke
scheduling-maximum-interval = Maximális időköz
scheduling-maximum-reviewsday = Napi maximális ismétlések száma
scheduling-minimum-interval = Minimális időköz
scheduling-mix-new-cards-and-reviews = Új kártyák és ismétlések vegyesen
scheduling-new-cards = Új kártyák
scheduling-new-cardsday = Napi új kártyák száma
scheduling-new-interval = Új időköz
scheduling-new-options-group-name = Új opciócsoport neve:
scheduling-options-group = Opciócsoport:
scheduling-order = Sorrend
scheduling-parent-limit = (szülőpakli határértéke: { $val })
scheduling-review = Ismétlés
scheduling-reviews = Ismétlések
scheduling-seconds = másodperc
scheduling-set-all-decks-below-to = { $val } alatti összes paklira is ez az opciócsoport vonatkozzon?
scheduling-set-for-all-subdecks = Beállítás minden alpaklira is
scheduling-show-answer-timer = Időmérés kijelzése válaszadáskor
scheduling-show-new-cards-after-reviews = Előbb az ismételendő kártyákat mutassa, aztán az újakat
scheduling-show-new-cards-before-reviews = Előbb az új kártyákat mutassa, aztán az ismételendőket
scheduling-show-new-cards-in-order-added = Az újakat a hozzáadás sorrendjében mutassa
scheduling-show-new-cards-in-random-order = Az újakat véletlenszerűen mutassa
scheduling-starting-ease = Kiindulási könnyűség
scheduling-steps-in-minutes = Lépések (percben)
scheduling-steps-must-be-numbers = A lépéseknek számoknak kell lenniük.
scheduling-tag-only = Csak címke
scheduling-the-default-configuration-cant-be-removed = Az alapértelmezett beállítás nem törölhető.
scheduling-your-changes-will-affect-multiple-decks = A módosításai több paklit is érintenek. Ha csak az aktuális paklit szeretné módosítani, kérjük, hozzon létre előbb ehhez egy új opciócsoportot.
scheduling-deck-updated = { $count ->
    [one] { $count } pakli frissítve.
   *[other] { $count } pakli frissítve.
  }
