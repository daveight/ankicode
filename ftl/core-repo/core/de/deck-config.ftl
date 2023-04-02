### Text shown on the "Deck Options" screen


## Top section

# Used in the deck configuration screen to show how many decks are used
# by a particular configuration group, eg "Group1 (used by 3 decks)"
deck-config-used-by-decks =
    verwendet von { $decks ->
        [one] 1 Stapel
       *[other] { $decks } Stapeln
    }
deck-config-default-name = Standard
deck-config-title = Stapeloptionen

## Daily limits section

deck-config-daily-limits = Täglicher Grenzwert
deck-config-new-limit-tooltip =
    Die maximale Anzahl an neuen Karten, die an einem Tag eingeführt werden sollen, wenn neue Karten zur Verfügung stehen.
    Da neues Material Ihr Arbeitspensum für kurzfristige Wiederholungen steigert, sollte dies typischerweise mindestens 10-mal so gering sein wie Ihr Grenzwert für Wiederholungen.
deck-config-review-limit-tooltip =
    Die maximale Anzahl an Wiederholkarten, die an einem Tag angezeigt werden soll,
    wenn Karten für die Wiederholung bereitstehen.
deck-config-limit-deck-v3 = Wenn Sie einen Stapel lernen, der Unterstapel hat, dann steuern die in jedem Unterstapel gesetzten Grenzwerte die maximale Anzahl an Karten, die genau von diesem Stapel herangezogen werden. Die ausgewählten Stapelgrenzwerte steuern die Gesamtanzahl an Karten, die angezeigt werden.
deck-config-limit-new-bound-by-reviews = Der Grenzwert für Wiederholungen beeinflusst den Grenzwert für neue Karten. Wenn Sie beispielsweise Ihren Grenzwert für Wiederholungen auf 200 gesetzt haben und 190 Karten warten auf ihre Wiederholung, dann werden maximal 10 neue Karten neu eingeführt. Wenn der Grenzwert für Wiederholungen erreicht wurde, dann werden keine neuen Karten angezeigt.
deck-config-limit-interday-bound-by-reviews = Der Grenzwert für Wiederholungen betrifft auch die Zwischentag-Lernkarten. Wenn der Grenzwert angewendet wird, dann werden die Zwischentag-Lernkarten zuerst abgerufen, danach die Wiederholungen und zum Schluss die neuen Karten.
deck-config-tab-description =
    - `Vorgabe`: Dieser Grenzwert bezieht alle Stapel ein, die diese Vorgabe verwenden.
    - `Dieser Stapel`: Dieser Grenzwert gilt für diesen Stapel.
    - `Nur heute`: Grenzwert von diesem Stapel vorübergehend ändern.

## Daily limit tabs: please try to keep these as short as the English version,
## as longer text will not fit on small screens.

deck-config-shared-preset = Vorgabe
deck-config-deck-only = Dieser Stapel
deck-config-today-only = Nur heute

## New Cards section

deck-config-learning-steps = Lernstufen
# Please don't translate `1m`, `2d`
-deck-config-delay-hint = Verzögerungen können in Minuten (z.B. "5m") oder Tagen (z.B. "2d") angegeben werden.
deck-config-learning-steps-tooltip =
    Eine oder mehrere Verzögerungen, durch Leerzeichen voneinander getrennt. Die erste Verzögerung wird benutzt, 
    wenn Sie den "Nochmals"-Knopf auf einer neuen Karte drücken, und beträgt standardmäßig 1 Minute.
    Der "Gut"-Knopf lässt die Karte voranschreiten. Die Verzögerung beträgt dann standardmäßig 10 Minuten.
    Wenn eine Karte alle Schritte durchlaufen hat, dann wird diese eine Wiederholkarte und wird an einem anderen Tag wieder erscheinen. { -deck-config-delay-hint }
deck-config-graduating-interval-tooltip = Die Anzahl an abzuwartenden Tagen, bevor eine Karte, die mit "Gut" in der finalen Lernstufe  bewertet wurde, wieder angezeigt wird.
deck-config-easy-interval-tooltip = Die Anzahl Tage, bis eine Karte wieder gezeigt wird, nachdem die `Einfach`-Taste benutzt wurde, um die Karte sofort aus der Lernphase zu entfernen.
deck-config-new-insertion-order = Einfügereihenfolge
deck-config-new-insertion-order-tooltip = Steuert die Position (fällig #), die neuen Karten zugewiesen wird, wenn Sie diese hinzufügen. Karten mit einer niedrigeren Fälligkeitsnummer werden beim Lernen  zuerst angezeigt. Wenn Sie diese Option ändern, dann werden alle bereits vorhandenen Positionen von neuen Karten aktualisiert.
deck-config-new-insertion-order-sequential = Sequentiell (älteste Karten zuerst)
deck-config-new-insertion-order-random = Zufällig
deck-config-new-insertion-order-random-with-v3 = Wenn der V3-Zeitplaner genutzt wird, ist es ratsamer, diese Option auf Sequentiell zu belassen und stattdessen die Reihenfolge für die Zusammenstellung der neuen Karten anzupassen.

## Lapses section

deck-config-relearning-steps = Schritte für das erneute Lernen
deck-config-relearning-steps-tooltip = Null oder mehrere Verzögerungen, getrennt durch Leerzeichen. Standardmäßig wird bei Drücken des "Nochmal"-Knopf bei einer Wiederholkarte diese Karte 10 Minuten später nochmal angezeigt. Wenn keine Verzögerungen angegeben werden, wird das Intervall der Karte geändert, ohne dass sie erneut erlernt wird. { -deck-config-delay-hint }
deck-config-leech-threshold-tooltip =
    Die Anzahl, wie oft "Nochmals" gedrückt werden muss, um eine Wiederholkarte als
    Lernbremse einzustufen. Lernbremsen sind Karten, die besonders viel von Ihrer Zeit beanspruchen. 
    Wenn eine Karte als Lernbremse eingestuft wird, dann ist es eine gute Idee, diese zu überarbeiten, zu löschen oder eine Gedächtnisstütze (Eselbrücke) auszudenken, die Ihnen hilft, sich an sie zu erinnern.
# See actions-suspend-card and scheduling-tag-only for the wording
deck-config-leech-action-tooltip =
    <b>nur für Schlagwort</b>: Ein Schlagwort "leech" für die Notiz hinzufügen und ein Pop-up anzeigen.<br>
    <b>Karte aussetzen</b>: Zusätzlich zum Verschlagworten der Notiz diese Karte verstecken, bevor sie wieder manuell eingesetzt wird.

## Burying section

deck-config-bury-title = Zurückstellen
deck-config-bury-siblings = Geschwisterkarten zurückstellen
deck-config-do-not-bury = Geschwisterkarten nicht zurückstellen
deck-config-bury-if-new = Zurückstellen, wenn neu
deck-config-bury-if-new-or-review = Zurückstellen, wenn Karte neu oder zum Wiederholen
deck-config-bury-if-new-review-or-interday = Zurückstellen, wenn Karte neu, zum Wiederholen oder Lernen über mehrere Tagen
deck-config-bury-tooltip =
    Geschwisterkarten sind andere Karten von der gleichen Notiz (z.B. Vorder- und Rückseite oder Lückentextkarten von dem gleichen Text).
    
    Wenn diese Option aus ist, können mehrere Karten von der gleichen Notiz am gleichen Tag angezeigt werden. Wenn die Option aktiviert ist, dann wird Anki die Geschwisterkarten automatisch *zurückstellen* und bis zum nächsten Tag verstecken. Diese Option erlaubt Ihnen auszuwählen, welche Arten von Karten zurückgestellt werden können, wenn sie eine ihrer Geschwisterkarten beantworten.
    
    Wenn Sie den V3-Zeitplaner benutzen, werden Lernkarten, die sich über mehrere Tage erstrecken, ebenfalls zurückgestellt. Solche Karten haben einen aktuellen Lernschritt von einem oder mehreren Tagen.

## Ordering section

deck-config-ordering-title = Anzeigereihenfolge
deck-config-new-gather-priority = Reihenfolge beim Sammeln neuer Karten
deck-config-new-gather-priority-tooltip-2 =
    `Stapel`: sammelt Karten der Reihe nach von jedem Stapel, oben beginnend. Für jeden Stapel werden Karten in aufsteigender Position gesammelt. Wenn der Grenzwert des ausgewählten Stapels erreicht ist, kann das Sammeln aufhören, bevor alle Stapel erreicht wurden. Diese Reihenfolge ist die schnellste für große Sammlungen und ermöglicht die Priorisierung von Stapeln, die weiter oben sind.
    
    `Aufsteigende Position`: sammelt Karten nach Position (Fälligkeitsnummer) in aufsteigender Reihenfolge. Typischerweise bedeutet das, die älteste hinzugefügte Karte zuerst.
    
    `Absteigende Position`: sammelt Karten nach Position (Fälligkeitsnummer) in absteigender Reihenfolge. Typischerweise bedeutet das, die zuletzt hinzugefügte Karte zuerst.
    
    `Zufällige Notizen`: sammelt Karten von zufällig ausgewählten Notizen. Wenn die Geschwisterzurückstellung deaktiviert ist, können so alle Karten einer Notiz in derselben Einheit gelernt werden (z.B. sowhl Vorderseite→Rückseite als auch Rückseite→Vorderseite),
    
    `Zufällige Karten`: sammelt Karten vollkommen zufällig.
deck-config-new-gather-priority-deck = Stapel
deck-config-new-gather-priority-position-lowest-first = Aufsteigende Position
deck-config-new-gather-priority-position-highest-first = Absteigende Position
deck-config-new-gather-priority-random-notes = Zufällige Notizen
deck-config-new-gather-priority-random-cards = Zufällige Karten
deck-config-new-card-sort-order = Sortierreihenfolge neuer Karten
deck-config-new-card-sort-order-tooltip-2 =
    `Kartenvorlage`: Zeigt Karten in Reihenfolge ihrer Vorlagennummer. Wenn die Geschwisterzurückstellung deaktiviert ist, werden so alle Vorderseite→Rückseite-Karten vor allen Rückseite→Vorderseite-Karten gezeigt.
    
    `Sammelreihenfolge`: Zeigt Karten genau wie sie gesammelt wurde. Wenn die Geschwisterzurückstellung deaktiviert ist, werden so typischerweise alle Karten einer Notiz nacheinander gezeigt.
    
    `Kartenvorlage, dann zufällig`: Wie `Kartenvorlage`, aber mischt die Karten jeder Vorlage. Kombiniert mit der Sammelreihenfolge in aufsteigender Position,  können so die ältesten Karten in zufälliger Reihenfolge gezeigt werden.
    
    `Zufällige Notiz, dann Kartenvorlage`: Wählt zufällige Notizen und zeigt für jede all ihre Geschwisterkarten der Reihe nach.
    
    `Zufällig`: Mischt die gesammelten Karten.
deck-config-sort-order-card-template-then-random = Kartenvorlage, dann zufällig
deck-config-sort-order-random-note-then-template = Zufällige Notiz, dann Kartenvorlage
deck-config-sort-order-random = Zufällig
deck-config-sort-order-template-then-gather = Kartenvorlage
deck-config-sort-order-gather = Sammelreihenfolge
deck-config-new-review-priority = Reihenfolge Neu/Wiederholung
deck-config-new-review-priority-tooltip = Wann neue Karten relativ zu Wiederholkarten angezeigt werden.
deck-config-interday-step-priority = Reihenfolge Wiederholung/mehrtägiges Lernen
deck-config-interday-step-priority-tooltip =
    Wann (erneute) Lernkarten angezeigt werden, die die Taggrenze überschreiten.
    
    Der Grenzwert für Wiederholungen wird immer zuerst auf die Zwischentag-Lernkarten angewendet, und danach auf die Wiederholungen. Diese Option steuert die Reihenfolge, in welcher die aufgenommenen Karten angezeigt werden, aber Zwischentag-Lernkarten werden immer an erster Stelle aufgenommen.
deck-config-review-mix-mix-with-reviews = Mit Wiederholungen vermischen
deck-config-review-mix-show-after-reviews = Nach Wiederholungen anzeigen
deck-config-review-mix-show-before-reviews = Vor Wiederholungen anzeigen
deck-config-review-sort-order = Wiederholsortierreihenfolge
deck-config-review-sort-order-tooltip = Die Standardreihenfolge priorisiert Karten, die am längsten gewartet haben. Wenn Sie einen Rückstand an Wiederholungen haben, werden dadurch diejenigen, die am längsten gewartet haben, zuerst angezeigt. Wenn Sie einen großen Rückstand haben, der mehr als einige Tage benötigt, um ihn aufzuholen, dann finden Sie ggf. eine andere Sortierreihenfolge vorteilhafter.
deck-config-sort-order-due-date-then-random = Fälligkeitsdatum, dann zufällig
deck-config-sort-order-due-date-then-deck = Fälligkeitsdatum, dann Stapel
deck-config-sort-order-deck-then-due-date = Stapel, dann Fälligkeitsdatum
deck-config-sort-order-ascending-intervals = Aufsteigende Intervalle
deck-config-sort-order-descending-intervals = Absteigende Intervalle
deck-config-sort-order-ascending-ease = Aufsteigende Leichtigkeit
deck-config-sort-order-descending-ease = Absteigende Leichtigkeit
deck-config-sort-order-relative-overdueness = Relative Überfälligkeit
deck-config-display-order-will-use-current-deck =
    Anki wird die Anzeigereihenfolge von dem Stapel, den Sie 
    zum Lernen ausgewählt haben, und keine Unterstapel, 
    die dieser Stapel hat, benutzen.

## Timer section

deck-config-timer-title = Timer
deck-config-maximum-answer-secs = Maximal Sekunden zum Antworten
deck-config-maximum-answer-secs-tooltip =
    Die maximale Anzahl an Sekunden, die bei einer einzelnen Wiederholung erfasst wird. Wenn die Antwort
    diese Zeit überschreitet (weil Sie beispielsweise nicht auf den Bildschirm geschaut haben), dann wird die für die Antwort benötigte, zu vermerkende Zeitdauer auf diesen Höchstwert (herunter)gesetzt.
deck-config-show-answer-timer-tooltip = Beim Überprüfen einen Timer anzeigen, welcher die Sekunden zählt, die Sie zum Überprüfen einer Karte benötigen.

## Audio section

deck-config-audio-title = Audio
deck-config-disable-autoplay = Audio nicht automatisch abspielen
deck-config-disable-autoplay-tooltip =
    Wenn aktiviert, wird Anki Audiodateien nicht automatisch abspielen.
    Sie können manuell abgespielt werden, indem Sie auf das Audiosymbol klicken/drücken oder indem Sie die Aktion Audio erneut abspielen benutzen.
deck-config-skip-question-when-replaying = Frage beim erneuten Abspielen der Antwort überspringen
deck-config-always-include-question-audio-tooltip = Ob auch das Audio auf der Frageseite abgespielt werden soll, wenn die Aktion "Nochmals abspielen" ausgelöst wird, während bereits die Antwortseite einer Karte angezeigt wird.

## Advanced section

deck-config-advanced-title = Erweitert
deck-config-maximum-interval-tooltip =
    Die maximale Anzahl an Tagen, die eine Wiederholkarte warten wird. Wenn Wiederholungen
    ihren Grenzwert erreicht haben, erhalten "Schwer", "Gut" und "Leicht" alle die gleiche Verzögerung.
    Je kürzer Sie dies setzen, desto größer wird Ihr Arbeitspensum.
deck-config-starting-ease-tooltip = Der Leichtigkeitsmultiplikator, mit dem neue Karten beginnen. Standardmäßig wird der "Gut"-Knopf bei neu gelernten Karten die nächste Wiederholung um den Faktor 2.5 verglichen zur vorherigen Verzögerung verzögern.
deck-config-easy-bonus-tooltip = Ein zusätzlicher Multiplikator, welcher auf das Intervall einer Wiederholkarte angewendet wird, wenn Sie diese als "Einfach" einstufen.
deck-config-interval-modifier-tooltip =
    Dieser Multiplikator wird auf allen Wiederholungen angewendet, und kleinere Anpassungen können benutzt werden, 
    um Anki konservativer oder aggressiver bei seiner Zeitplanung einzustellen. Bitte lesen
    Sie im Handbuch nach, bevor Sie diese Option ändern.
deck-config-hard-interval-tooltip = Der auf das Wiederholintervall angewendete Multiplikator, wenn mit "Hart" geantwortet wurde.
deck-config-new-interval-tooltip = Der auf das Wiederholintervall angewendete Multiplikator, wenn mit "Nochmal" geantwortet wurde.
deck-config-minimum-interval-tooltip = Das minimale Intervall für eine Wiederholkarte nachdem mit "Nochmal" geantwortet wurde.
deck-config-custom-scheduling = Benutzerdefinierte Zeitplanung
deck-config-custom-scheduling-tooltip = Wirkt sich auf die gesamte Sammlung aus. Nutzung auf eigene Gefahr!

## Adding/renaming

deck-config-add-group = Gruppe hinzufügen
deck-config-name-prompt = Name:
deck-config-rename-group = Gruppe umbenennen
deck-config-clone-group = Voreinstellung kopieren

## Removing

deck-config-remove-group = Gruppe entfernen
deck-config-will-require-full-sync = Die angefragte Änderung wird ein vollständiges Hochladen der Datenbank bei der nächsten Synchronisation Ihrer Sammlung benötigen. Wenn Sie Wiederholungen oder andere Änderungen auf einem anderen Gerät haben, die hier noch nicht synchronisiert sind, dann werden diese verloren gehen.
deck-config-confirm-remove-name = { $name } entfernen?

## Other Buttons

deck-config-save-button = Speichern
deck-config-save-to-all-subdecks = Auf alle Unterstapel anwenden
deck-config-revert-button-tooltip = Diese Einstellung auf den Standardwert zurücksetzen

## These strings are shown via the Description button at the bottom of the
## overview screen.

deck-config-description-new-handling = Anki 2.1.41+ Handhabung
deck-config-description-new-handling-hint =
    Behandelt die Eingabe als Markdown und bereinigt HTML-Eingaben. Wenn aktiviert, wird die Beschreibung auch auf der Gratulationsseite angezeigt.
    Markdown wird als reiner Text bei Anki 2.1.40 und älter angezeigt.

## Warnings shown to the user

deck-config-daily-limit-will-be-capped =
    Ein übergeordneter Stapel hat einen Grenzwert von { $cards ->
        [one] { $cards } Karte
       *[other] { $cards } Karten
    }, welcher diesen Grenzwert überschreiben wird.
deck-config-reviews-too-low =
    Wenn { $cards ->
        [one] { $cards } neue Karte jeden Tag hinzugefügt wird
       *[other] { $cards } neue Karten jeden Tag hinzugefügt werden
    }, dann sollte Ihr Grenzwert für Wiederholungen mindestens { $expected } betragen.
deck-config-learning-step-above-graduating-interval = Das Aufstiegsintervall sollte mindestens genauso lang sein wie Ihre finale Lernstufe.
deck-config-good-above-easy = Das Einfach-Intervall sollte mindestens genauso lang sein wie das Aufstiegsintervall.
deck-config-relearning-steps-above-minimum-interval = Das minimale Intervall für Fehlschläge sollte mindestens so lange sein wie Ihr finaler Schritt für das erneute Lernen.
deck-config-maximum-answer-secs-above-recommended = Anki kann ihre Lernüberprüfungen besser planen, wenn Sie jede Frage kurz halten.

## Selecting a deck

deck-config-which-deck = Welchen Stapel möchten Sie gerne?

## NO NEED TO TRANSLATE. This text is no longer used by Anki, and will be removed in the future.

deck-config-bury-new-siblings = Neue Geschwister zurückstellen
deck-config-bury-review-siblings = Geschwister in Wiederholung zurückstellen
deck-config-bury-interday-learning-siblings = Geschwister in mehrtägigem Lernen zurückstellen
deck-config-bury-new-tooltip =
    Ob andere `neue` Karten derselben Notiz (z.B. umgekehrte Karten, angrenzende Lückentexte)
    bis zum nächsten Tag verschoben werden.
deck-config-bury-review-tooltip =
    Ob andere`zu wiederholende Karten` derselben Notiz (z.B. umgekehrte Karten, angrenzende Lückentexte)
    bis zum nächsten Tag verschoben werden.
deck-config-bury-interday-learning-tooltip =
    Ob andere `zu lernende` Karten derselben Notiz mit Intervallen > 1 Tag
    bis zum nächsten Tag verschoben werden.
