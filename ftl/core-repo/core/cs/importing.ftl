importing-failed-debug-info = Import selhal. Ladicí informace:
importing-aborted = Zrušeno: { $val }
importing-added-duplicate-with-first-field = Přidána duplicita s prvním polem: { $val }
importing-all-supported-formats = Všechny podporované formáty { $val }
importing-allow-html-in-fields = Povolit  HTML v polích
importing-anki-files-are-from-a-very = .anki soubory pocházejí z velmi staré verze Anki. Můžete je importovat pomocí Anki 2.0, který je dostupný na webových stránkách Anki.
importing-anki2-files-are-not-directly-importable = .anki2 soubory nelze importovat přímo - prosím importujte místo toho .apkg nebo .zip soubor, který máte.
importing-appeared-twice-in-file = Duplicitní kartičky: { $val }
importing-by-default-anki-will-detect-the = Anki implicitně detekuje znak oddělující pole, jako je tabulátor či čárka. Pokud ho Anki detekuje špatně, můžete ho vložit sem. \t představuje tabulátor.
importing-change = Změnit
importing-colon = Dvojtečka
importing-comma = Čárka
importing-empty-first-field = Prázdné první pole: { $val }
importing-field-separator = Oddělovač polí
importing-field-mapping = Přiřazení polí
importing-field-of-file-is = Pole <b>{ $val }</b> souboru je:
importing-fields-separated-by = Pole rozděleny pomocí: { $val }
importing-file-must-contain-field-column = Soubor musí obsahovat alespoň jeden sloupec, který se může přiřadit k poli poznámky.
importing-file-version-unknown-trying-import-anyway = Verze souboru neznámá, zkouším importovat.
importing-first-field-matched = První pole se shodovalo: { $val }
importing-identical = Totožný
importing-ignore-field = Ignorovat pole
importing-ignore-lines-where-first-field-matches = Ignorovat řádky, kde první pole odpovídá existující poznámce
importing-ignored = <ignorováno>
importing-import-even-if-existing-note-has = Importovat, i když existující poznámka má stejné první pole
importing-import-options = Importovat nastavení
importing-importing-complete = Import kompletní.
importing-invalid-file-please-restore-from-backup = Vadný soubor. Prosím obnovte ze zálohy.
importing-map-to = Přiřadit na { $val }
importing-map-to-tags = Přiřadit ke štítkům
importing-mapped-to = přiřazeno na <b>{ $val }</b>
importing-mapped-to-tags = přiřazeno na <b>Štítky</b>
importing-mnemosyne-20-deck-db = Mnemosyne 2.0 balíček (*.db)
importing-multicharacter-separators-are-not-supported-please = Víceznakové oddělovače nejsou podporovány. Prosím, vložte pouze jeden znak.
importing-notes-added-from-file = Poznámky přidané ze souboru: { $val }
importing-notes-found-in-file = Poznámky nalezené v souboru: { $val }
importing-notes-skipped-as-theyre-already-in = Přeskočené poznámky, které jsou již v kolekci: { $val }
importing-notes-that-could-not-be-imported = Poznámky, které nemohly být importovány, protože se změnil typ poznámky: { $val }
importing-notes-updated-as-file-had-newer = Poznámky aktualizovány, protože soubor měl novější verzi: { $val }
importing-packaged-anki-deckcollection-apkg-colpkg-zip = Zabalený Anki balíček/kolekce (*.apkg *.colpkg *.zip)
importing-pauker-18-lesson-paugz = Pauker 1.8 lekce (*.pau.gz)
# the '|' character
importing-pipe = Svislá čára
importing-rows-had-num1d-fields-expected-num2d = „{ $row }“ mělo { $found } polí, namísto očekávaných { $expected }
importing-selected-file-was-not-in-utf8 = Vybraný soubor není ve formátu UTF-8. Blíže viz manuál kapitola Import.
importing-semicolon = Středník
importing-skipped = Přeskočeno
importing-supermemo-xml-export-xml = Supermemo XML export (*.xml)
importing-tab = Tabulátor
importing-tag-modified-notes = Štítek modifikovaných poznámek:
importing-text-separated-by-tabs-or-semicolons = Text oddělený tabulátory nebo středníky (*)
importing-the-first-field-of-the-note = První pole typu poznámky musí být přiřazeno.
importing-the-provided-file-is-not-a = Toto není validní soubor .apkg.
importing-this-file-does-not-appear-to = Zdá se, že nejde o validní soubor .apkg. Pokud se vám tato chyba zobrazuje u souboru staženého z AnkiWeb, je možné, že nebyl stažen správně.
importing-this-will-delete-your-existing-collection = Tímto se odstraní vaše současná kolekce a nahradí se daty ze souboru, který importujete. Jste si jistý?
importing-unable-to-import-from-a-readonly = Nelze importovat ze souboru s právy jen pro čtení.
importing-unknown-file-format = Neznámý formát souboru.
importing-update-existing-notes-when-first-field = Aktualizovat existující poznámku, když je první pole stejné
importing-updated = Aktualizováno
importing-note-added =
    { $count ->
        [one] { $count } poznámka přidána
        [few] { $count } poznámky přidány
       *[other] { $count } poznámek přidáno
    }
importing-note-imported =
    { $count ->
        [one] { $count } poznámka importována.
        [few] { $count } poznámky importovány.
       *[other] { $count } poznámek importováno.
    }
importing-note-unchanged =
    { $count ->
        [one] { $count } poznámka nezměněna
        [few] { $count } poznámky nezměněny
       *[other] { $count } poznámek nezměněno
    }
importing-note-updated =
    { $count ->
        [one] { $count } poznámka aktualizována
        [few] { $count } poznámky aktualizovány
       *[other] { $count } poznámek aktualizováno
    }
importing-processed-media-file =
    { $count ->
        [one] Importován { $count } mediální soubor
        [few] Importovány { $count } mediální soubory
       *[other] Importováno { $count } mediálních souborů
    }
importing-importing-collection = Importuje se kolekce…
importing-importing-file = Importuje se soubor...
importing-extracting = Rozbalují se data...
importing-gathering = Shromažďují se data...
importing-failed-to-import-media-file = Import mediálního souboru selhal: { $debugInfo }
importing-processed-notes =
    { $count ->
        [one] Zpracována { $count } poznámka...
        [few] Zpracovány { $count } poznámky...
       *[other] Zpracováno { $count } poznámek...
    }
importing-processed-cards =
    { $count ->
        [one] Zpracována { $count } karta...
        [few] Zpracovány { $count } karty...
       *[other] Zpracováno { $count } karet...
    }
importing-unable-to-import-filename = Nelze importovat { $filename }: typ souboru není podporován
importing-existing-notes = Stávající poznámky
# "Existing notes: Duplicate" (verb)
importing-duplicate = Duplikovat
# "Existing notes: Preserve" (verb)
importing-preserve = Zachovat
# "Existing notes: Update" (verb)
importing-update = Aktualizovat
importing-tag-all-notes = Označit všechny poznámky štítkem
importing-tag-updated-notes = Označit aktualizované poznámky štítkem
importing-file = Soubor
