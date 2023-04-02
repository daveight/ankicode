## The next time a card will be shown, in a short form that will fit
## on the answer buttons. For example, English shows "4d" to
## represent the card will be due in 4 days, "3m" for 3 minutes, and
## "5mo" for 5 months.

scheduling-answer-button-time-seconds = { $amount } s
scheduling-answer-button-time-minutes = { $amount } min
scheduling-answer-button-time-hours = { $amount } h
scheduling-answer-button-time-days = { $amount } d
scheduling-answer-button-time-months = { $amount } m
scheduling-answer-button-time-years = { $amount } a

## A span of time, such as the delay until a card is shown again, the
## amount of time taken to answer a card, and so on. It is used by itself,
## such as in the Interval column of the browse screen,
## and labels like "Total Time" in the card info screen.

scheduling-time-span-seconds =
    { $amount ->
        [one] { $amount } Sekunde
       *[other] { $amount } Sekunden
    }
scheduling-time-span-minutes =
    { $amount ->
        [one] { $amount } Minute
       *[other] { $amount } Minuten
    }
scheduling-time-span-hours =
    { $amount ->
        [one] { $amount } Stunde
       *[other] { $amount } Stunden
    }
scheduling-time-span-days =
    { $amount ->
        [one] { $amount } Tag
       *[other] { $amount } Tage
    }
scheduling-time-span-months =
    { $amount ->
        [one] { $amount } Monat
       *[other] { $amount } Monate
    }
scheduling-time-span-years =
    { $amount ->
        [one] { $amount } Jahr
       *[other] { $amount } Jahre
    }

## Shown in the "Congratulations!" message after study finishes.

# eg "The next learning card will be ready in 5 minutes."
scheduling-next-learn-due =
    Die nächste zu lernende Karte wird in { $unit ->
        [seconds]
            { $amount ->
                [one] { $amount } Sekunde
               *[other] { $amount } Sekunden
            }
        [minutes]
            { $amount ->
                [one] { $amount } Minute
               *[other] { $amount } Minuten
            }
       *[hours]
            { $amount ->
                [one] { $amount } Stunde
               *[other] { $amount } Stunden
            }
    } bereitgestellt.
scheduling-learn-remaining =
    { $remaining ->
        [one] Es ist noch eine zu lernende Karte heute fällig.
       *[other] Es sind noch { $remaining } zu lernende Karten heute fällig.
    }
scheduling-congratulations-finished = Herzlichen Glückwunsch! Dieser Stapel ist vorerst geschafft.
scheduling-today-review-limit-reached =
    Der Grenzwert für die heutigen Wiederholungen ist erreicht, weitere Karten warten jedoch
    noch darauf, wiederholt zu werden. Um die Gedächtnisleistung optimal zu nutzen,
    bitte die Erhöhung des Grenzwertes in den Einstellungen erwägen.
scheduling-today-new-limit-reached =
    Weitere neue Karten sind verfügbar, aber das Tageslimit
    ist erreicht. Der Grenzwert kann in den Einstellungen erhöht werden, aber
    bitte daran denken, dass die Anzahl kurzfristiger Wiederholungen
    umso größer wird, je mehr neue Karten eingesetzt werden.
scheduling-buried-cards-found = Eine oder mehrere Karten wurden zurückgestellt und werden morgen gezeigt. Die Zurückstellung kann { $unburyThem } werden, um sie direkt anzuzeigen.
# used in scheduling-buried-cards-found
# "... you can unbury them if you wish to see..."
scheduling-unbury-them = aufgehoben
scheduling-how-to-custom-study = Wenn außerhalb des regulären Zeitplans gelernt werden soll, kann die { $customStudy }-Funktion genutzt werden.
# used in scheduling-how-to-custom-study
# "... you can use the custom study feature."
scheduling-custom-study = Benutzerdefiniertes Lernen

## Scheduler upgrade

scheduling-update-soon = Anki 2.1 kommt mit einem neuen Zeitplaner, welcher eine Anzahl von Problemen aus vorherigen Versionen von Anki löst. Das Updaten auf diesen wird empfohlen.
scheduling-update-done = Zeitplaner erfolgreich geupdated.
scheduling-update-button = Updaten
scheduling-update-later-button = Später
scheduling-update-more-info-button = Mehr lernen
scheduling-update-required =
    Ihre Sammlung muss an den V2-Zeitplaner angepasst werden.
    Bitte vor dem Fortfahren { scheduling-update-more-info-button } auswählen.

## Other scheduling strings

scheduling-always-include-question-side-when-replaying = Immer die Frageseite bei wiederholtem Abspielen von Audiodateien beifügen
scheduling-at-least-one-step-is-required = Mindestens eine Lernstufe ist erforderlich.
scheduling-automatically-play-audio = Audiodateien automatisch abspielen
scheduling-bury-related-new-cards-until-the = Verwandte neue Karten nicht am selben Tag lernen, sondern bis zum Folgetag zurückstellen
scheduling-bury-related-reviews-until-the-next = Verwandte Karten nicht am selben Tag wiederholen, sondern bis zum Folgetag zurückstellen
scheduling-days = Tage
scheduling-description = Beschreibung
scheduling-easy-bonus = Leichtigkeitsbonus
scheduling-easy-interval = Intervall für einfache Karten
scheduling-end = (Ende)
scheduling-general = Allgemein
scheduling-graduating-interval = Intervall für Aufstieg
scheduling-hard-interval = Intervall für "Schwer"
scheduling-ignore-answer-times-longer-than = Ignoriere Antwortzeiten über
scheduling-interval-modifier = Intervallfaktor
scheduling-lapses = Fehlschläge
scheduling-lapses2 = Fehlschläge
scheduling-learning = Lernen
scheduling-leech-action = Aktion für Lernbremsen
scheduling-leech-threshold = Grenzwert für Lernbremsen
scheduling-maximum-interval = Höchstintervall
scheduling-maximum-reviewsday = Max. Wiederholungen/Tag
scheduling-minimum-interval = Mindestintervall
scheduling-mix-new-cards-and-reviews = Neue Karten und Wiederholungen mischen
scheduling-new-cards = Neue Karten
scheduling-new-cardsday = Neue Karten/Tag
scheduling-new-interval = Neues Intervall
scheduling-new-options-group-name = Name der neuen Optionengruppe:
scheduling-options-group = Optionengruppe:
scheduling-order = Reihenfolge
scheduling-parent-limit = (Grenzwert des übergeordneten Stapels: { $val })
scheduling-reset-counts = Wiederholung zurücksetzen und Zählungen löschen
scheduling-restore-position = Originale Position möglichst wiederherstellen
scheduling-review = Wiederholen
scheduling-reviews = Wiederholungen
scheduling-seconds = Sekunden
scheduling-set-all-decks-below-to = Allen Teilstapeln von { $val } diese Optionengruppe zuweisen?
scheduling-set-for-all-subdecks = Allen Teilstapeln zuweisen
scheduling-show-answer-timer = Antwortzeit anzeigen
scheduling-show-new-cards-after-reviews = Zeige neue Karten nach Wiederholungen
scheduling-show-new-cards-before-reviews = Zeige neue Karten vor den Wiederholungen
scheduling-show-new-cards-in-order-added = Neue Karten in der Reihenfolge zeigen, in der sie hinzugefügt wurden
scheduling-show-new-cards-in-random-order = Neue Karten in zufälliger Reihenfolge zeigen
scheduling-starting-ease = Anfängliche Leichtigkeit
scheduling-steps-in-minutes = Lernstufen (in Minuten)
scheduling-steps-must-be-numbers = Bitte Zahlen eingeben.
scheduling-tag-only = Nur verschlagworten
scheduling-the-default-configuration-cant-be-removed = Die Standardeinstellungen können nicht gelöscht werden.
scheduling-your-changes-will-affect-multiple-decks = Die Änderungen betreffen mehrere Stapel. Soll nur der aktuelle Stapel angepasst werden, bitte zunächst eine neue Optionengruppe erstellen.
scheduling-deck-updated =
    { $count ->
        [one] { $count } Stapel wurde aktualisiert.
       *[other] { $count } Stapel wurden aktualisiert.
    }
scheduling-set-due-date-prompt =
    { $cards ->
        [one] Karte in wie vielen Tagen anzeigen?
       *[other] Karten in wie vielen Tagen anzeigen?
    }
scheduling-set-due-date-prompt-hint =
    0 = heute
    1! = morgen+Wiederholintervall zurücksetzen
    3-7 = zufällige Auswahl von 3-7 Tagen
scheduling-set-due-date-done =
    { $cards ->
        [one] Fälligkeitsdatum von { $cards } Karte gesetzt.
       *[other] Fälligkeitsdatum von { $cards } Karten gesetzt.
    }
scheduling-forgot-cards =
    { $cards ->
        [one] { $cards } Karte vergessen.
       *[other] { $cards } Karten vergessen.
    }
