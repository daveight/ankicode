importing-failed-debug-info = Importowanie nie powiodło się. Informacja diagnostyczna:
importing-aborted = Przerwane: { $val }
importing-added-duplicate-with-first-field = Dodano duplikat z pierwszym polem: { $val }
importing-allow-html-in-fields = Zezwól na HTML w polach
importing-anki-files-are-from-a-very = Pliki .anki pochodzą z bardzo starej wersji Anki. Możesz zaimportować je używając Anki w wersji 2.0, dostępnej do ściągnięcia ze strony Anki.
importing-anki2-files-are-not-directly-importable = Plików .anki2 nie da się bezpośrednio importować - zaimportuj zamiast tego otrzymany plik .apkg lub .zip.
importing-appeared-twice-in-file = Pojawił się dwa razy w pliku: { $val }
importing-by-default-anki-will-detect-the = Domyślnie Anki wykrywa znak oddzielający pola, jak np. tabulator, dwukropek itp. Jeśli Anki nieprawidłowo wykrywa taki znak, możesz wpisać go tutaj. Użyj \t jako oznaczenie tabulacji.
importing-change = Zmień
importing-colon = Dwukropek
importing-comma = Przecinek
importing-empty-first-field = Puste pierwsze pole: { $val }
importing-field-separator = Separator pól
importing-field-mapping = Odwzorowanie pól
importing-field-of-file-is = Pole <b>{ $val }</b> z pliku jest:
importing-fields-separated-by = Pola oddzielone o: { $val }
importing-file-version-unknown-trying-import-anyway = Podjęto próbę importu mimo nieznanej wersji pliku.
importing-first-field-matched = Pierwsze dopasowane pole: { $val }
importing-identical = Identyczne
importing-ignore-field = Ignoruj pole
importing-ignore-lines-where-first-field-matches = Ignoruj ​​linie, których pierwsze pole pasuje do istniejącej notatki
importing-ignored = <zignorowane>
importing-import-even-if-existing-note-has = Importuj nawet jeśli istniejąca notatka ma takie samo pierwsze pole
importing-import-options = Opcje importowania
importing-importing-complete = Importowanie zakończone.
importing-invalid-file-please-restore-from-backup = Nieprawidłowy plik. Przywróć kopię zapasową.
importing-map-to = Odwzorowanie na { $val }
importing-map-to-tags = Odwzorowanie na etykiety
importing-mapped-to = odwzorowane na <b>{ $val }</b>
importing-mapped-to-tags = odwzorowane na <b>etykiety</b>
importing-mnemosyne-20-deck-db = Talia Mnemosyne 2.0 (*.db)
importing-multicharacter-separators-are-not-supported-please = Wieloznakowe separatory nie są obsługiwane. Wpisz tylko jeden znak.
importing-notes-added-from-file = Notatki dodane z pliku: { $val }
importing-notes-found-in-file = Notatki znalezione w pliku: { $val }
importing-notes-skipped-as-theyre-already-in = Notatki pominięte, gdyż są już w kolekcji: { $val }
importing-notes-that-could-not-be-imported = Notatki niezaimportowane, gdyż zmienił się typ notatki: { $val }
importing-notes-updated-as-file-had-newer = Notatki zaktualizowane nowszą wersją z pliku: { $val }
importing-packaged-anki-deckcollection-apkg-colpkg-zip = Spakowana kolekcja/talia Anki (*.apkg *.colpkg *.zip)
importing-pauker-18-lesson-paugz = Lekcja Pauker 1.8 (*.pau.gz)
# the '|' character
importing-pipe = Kreska pionowa
importing-rows-had-num1d-fields-expected-num2d = '{ $row }' ma { $found } pól, oczekiwano { $expected }
importing-selected-file-was-not-in-utf8 = Wybrany plik nie używa kodowania UTF-8. Przeczytaj rozdział o imporcie w instrukcji
importing-semicolon = Średnik
importing-skipped = Pominięte
importing-supermemo-xml-export-xml = Eksport XML Supermemo (*.xml)
importing-tab = Tabulator
importing-tag-modified-notes = Nadaj etykietę zmodyfikowanym notatkom:
importing-text-separated-by-tabs-or-semicolons = Tekst oddzielony tabulacją lub średnikami (*)
importing-the-first-field-of-the-note = Pierwsze pole typu notatki musi być przypisane.
importing-the-provided-file-is-not-a = Podany plik nie jest poprawnym plikiem .apkg.
importing-this-file-does-not-appear-to = Ten plik nie jest prawidłowym plikiem .apkg. Jeżeli ten błąd dotyczy pliku pobranego z AnkiWeb, to możliwe, że nie został on poprawnie pobrany. Spróbuj ponownie i jeżeli problem będzie się powtarzał, spróbuj użyć innej przeglądarki.
importing-this-will-delete-your-existing-collection = Twoja kolekcja zostanie usunięta i zastąpiona danymi z pliku, który importujesz. Chcesz kontynuować?
importing-unable-to-import-from-a-readonly = Nie można zaimportować z pliku tylko do odczytu.
importing-unknown-file-format = Nieznany format pliku.
importing-update-existing-notes-when-first-field = Aktualizuj istniejące notatki jeżeli zgadzają się pierwsze pola
importing-updated = Zaktualizowane
importing-note-added =
    { $count ->
        [one] dodano { $count } notatkę
        [few] dodano { $count } notatki
       *[other] dodano { $count } notatek
    }
importing-note-imported =
    { $count ->
        [one] zaimportowano { $count } notatkę.
        [few] zaimportowano { $count } notatki.
       *[other] zaimportowano { $count } notatek.
    }
importing-note-unchanged =
    { $count ->
        [one] nie zmieniono { $count } notatki
        [few] nie zmieniono { $count } notatek
       *[other] nie zmieniono { $count } notatek
    }
importing-note-updated =
    { $count ->
        [one] zaktualizowano { $count } notatkę
        [few] zaktualizowano { $count } notatki
       *[other] zaktualizowano { $count } notatek
    }
importing-processed-media-file =
    { $count ->
        [one] Przetworzono { $count } plik
        [few] Przetworzono { $count } pliki
       *[other] Przetworzono { $count } plików
    }
importing-importing-collection = Import kolekcji...
importing-importing-file = Import pliku...
importing-extracting = Znajdowanie danych...
importing-gathering = Zbieranie danych...
importing-failed-to-import-media-file = Nie udało się zaimportować pliku: { $debugInfo }
importing-unable-to-import-filename = Nie udało się zaimportować { $filename }: ten typ pliku nie jest obsługiwany
importing-existing-notes = Istniejące notatki
# "Existing notes: Duplicate" (verb)
importing-duplicate = Duplikuj
# "Existing notes: Preserve" (verb)
importing-preserve = Nie zmieniaj
# "Existing notes: Update" (verb)
importing-update = Uaktualnij
importing-tag-all-notes = Nadaj etykietę wszystkim notatkom
importing-tag-updated-notes = Nadaj etykietę uaktualnionym notatkom
importing-file = Plik
