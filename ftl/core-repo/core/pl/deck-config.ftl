### Text shown on the "Deck Options" screen


## Top section

# Used in the deck configuration screen to show how many decks are used
# by a particular configuration group, eg "Group1 (used by 3 decks)"
deck-config-used-by-decks =
    { $decks ->
        [one] używa { $decks } talia
        [few] używają { $decks } talie
        [many] używa { $decks } talii
       *[other] używa { $decks } talii
    }
deck-config-default-name = Domyślna
deck-config-title = Opcje talii

## Daily limits section

deck-config-daily-limits = Dzienne limity
deck-config-new-limit-tooltip = Maksymalna liczba nowych kart do pokazania na dzień. Ponieważ nowy materiał zwiększy twój krótkoterminowy nakład pracy, powinno to być co najmniej 10 razy mniej niż limit powtórek.
deck-config-review-limit-tooltip = Maksymalna dzienna liczba powtórek.
deck-config-tab-description =
    - `Opcje`: Ten limit jest wspólny dla wszystkich talii używających tych opcji.
    - `Ta talia`: Ten limit dotyczy jedynie tej talii.
    - `Tylko dziś`: Tymczasowa zmiana limitu talii.

## Daily limit tabs: please try to keep these as short as the English version,
## as longer text will not fit on small screens.

deck-config-shared-preset = Opcje
deck-config-deck-only = Ta talia
deck-config-today-only = Tylko dziś

## New Cards section

deck-config-learning-steps = Kroki nauki
deck-config-new-insertion-order = Kolejność wstawiania
deck-config-new-insertion-order-tooltip =
    Kontroluje pozycję (due #) przypisaną nowym kartom gdy je dodajesz.
    Karty z niższym numerem będą pokazane najpierw przy nauce. Zmiana
    tej opcji automatycznie zaktualizuje pozycję istniejących teraz nowych kart.
deck-config-new-insertion-order-sequential = Po kolei (najpierw najstarsze karty)
deck-config-new-insertion-order-random = Losowy

## Lapses section

deck-config-relearning-steps = Kroki ponownej nauki

## Burying section

deck-config-bury-title = Zakopywanie
deck-config-bury-new-siblings = Zakop nowe podobne do następnego dnia
deck-config-bury-review-siblings = Zakop przeglądane podobne do następnego dnia

## Ordering section

deck-config-ordering-title = Kolejność wyświetlania
deck-config-new-gather-priority = Kolejność zbierania nowych kart
deck-config-new-gather-priority-deck = Talia
deck-config-new-gather-priority-position-lowest-first = Pozycja rosnąco
deck-config-new-gather-priority-position-highest-first = Pozycja malejąco
deck-config-new-gather-priority-random-notes = Losowe notatki
deck-config-new-gather-priority-random-cards = Losowe karty
deck-config-new-card-sort-order = Kolejność nowych kart
deck-config-sort-order-card-template-then-random = Typ karty, następnie losowo
deck-config-sort-order-random-note-then-template = Losowa notatka, następnie typ karty
deck-config-sort-order-random = Losowo
deck-config-sort-order-template-then-gather = Typ karty
deck-config-new-review-priority = Kolejność nowych/powtórek
deck-config-review-mix-mix-with-reviews = Mieszaj z powtórkami
deck-config-review-mix-show-after-reviews = Pokaż po powtórkach
deck-config-review-mix-show-before-reviews = Pokaż przed powtórkami
deck-config-review-sort-order = Kolejność przeglądania
deck-config-sort-order-due-date-then-random = Zaplanowana data, potem losowy
deck-config-sort-order-due-date-then-deck = Zaplanowana data, potem talia
deck-config-sort-order-deck-then-due-date = Talia, potem zaplanowana data
deck-config-sort-order-ascending-intervals = Po rosnącym odstępie
deck-config-sort-order-descending-intervals = Po malejącym odstępie
deck-config-sort-order-ascending-ease = Po rosnącej łatwości
deck-config-sort-order-descending-ease = Po malejącej łatwości
deck-config-display-order-will-use-current-deck = Anki wykorzysta kolejność z talii, której będziesz się uczył, zamiast z którejś z jej podtalii.

## Timer section

deck-config-timer-title = Czasomierz
deck-config-maximum-answer-secs = Maksymalnie sekund na odpowiedź
deck-config-show-answer-timer-tooltip = Pokaż w trybie przeglądania stoper, który pokazuje, ile sekund zajmuje ci przejrzenie danej karty.

## Audio section

deck-config-audio-title = Dźwięk
deck-config-disable-autoplay = Nie odtwarzaj automatycznie dźwięku
deck-config-skip-question-when-replaying = Pomiń pytanie przy ponownym odtwarzaniu odpowiedzi

## Advanced section

deck-config-advanced-title = Zaawansowane
deck-config-starting-ease-tooltip = Współczynnik łatwości nowych kart. Domyślnie, wciśnięcie "Dobra" na świeżo nauczonej karcie odłoży w czasie następną powtórkę o 2,5 raza dłużej, niż wynosił wcześniejszy interwał.
deck-config-easy-bonus-tooltip = Dodatkowy mnożnik, który modyfikuje interwał karty powtórkowej, gdy ocenisz ją jako "Łatwa".
deck-config-interval-modifier-tooltip = Ten mnożnik jest stosowany przy wszystkich powtórkach. Delikatne zmiany mogą być wykorzystane, aby sprawić, żeby Anki planowało powtórki bardziej agresywnie lub zachowawczo. Przeczytaj poradnik przed zmianą tego ustawienia.
deck-config-hard-interval-tooltip = Mnożnik stosowany do interwału karty przy odpowiedzi "Trudna".
deck-config-new-interval-tooltip = Mnożnik stosowany do interwału karty przy odpowiedzi "Powtórz".
deck-config-minimum-interval-tooltip = Minimalny interwał przypisywany karcie powtórkowej przy odpowiedzi "Powtórz".
deck-config-custom-scheduling = Własne planowanie

## Adding/renaming

deck-config-add-group = Dodaj opcje
deck-config-name-prompt = Nazwa
deck-config-rename-group = Zmień nazwę opcji
deck-config-clone-group = Klonuj opcje

## Removing

deck-config-remove-group = Usuń opcje
deck-config-confirm-remove-name = Usunąć { $name }?

## Other Buttons

deck-config-save-button = Zapisz
deck-config-save-to-all-subdecks = Zapisz do wszystkich podtalii
deck-config-revert-button-tooltip = Przywróć to ustawienie do domyślnej wartości

## These strings are shown via the Description button at the bottom of the
## overview screen.

deck-config-description-new-handling = Obsługa Anki 2.1.41+

## Warnings shown to the user

deck-config-reviews-too-low =
    Jeśli dodajesz { $cards ->
        [one] { $cards } kartę dziennie
        [few] { $cards } karty dziennie
       *[other] { $cards } kart dziennie
    }, twój limit powinien wynosić przynajmniej { $expected }.
deck-config-maximum-answer-secs-above-recommended = Anki będzie skutecznie planować powtórki tylko pod warunkiem, że będziesz ustawiać krótkie pytania.

## Selecting a deck


## NO NEED TO TRANSLATE. These strings have been replaced with new versions, and will be removed in the future.

