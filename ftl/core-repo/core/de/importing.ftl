importing-failed-debug-info = Import fehlgeschlagen. Die Fehlermeldung lautet:
importing-aborted = Abgebrochen: { $val }
importing-added-duplicate-with-first-field = Duplikat mit erstem Feld { $val } hinzugefügt
importing-all-supported-formats = Alle unterstützten Formate { $val }
importing-allow-html-in-fields = HTML in Feldern zulassen
importing-anki-files-are-from-a-very = .anki-Dateien stammen von einer sehr alten Version von Anki. Sie können diese mit Anki 2.0 importieren. Diese Version steht Ihnen auf der Webseite von Anki zur Verfügung.
importing-anki2-files-are-not-directly-importable = .anki2-Dateien können nicht direkt importiert werden - bitte importieren Sie die .apkg- oder .zip-Datei, die Sie stattdessen erhalten haben.
importing-appeared-twice-in-file = Doppelt vorhanden in Datei: { $val }
importing-by-default-anki-will-detect-the = Für gewöhnlich wird Anki das Trennzeichen zwischen zwei Feldern,  z.B. ein Komma, Tabulator oder Ähnliches, erkennen. Sollte Anki  das Trennzeichen nicht korrekt erkennen, bitte hier eingeben. Für ein Tabulatorzeichen bitte folgendes verwenden: \t.
importing-change = Ändern
importing-colon = Doppelpunkt
importing-comma = Komma
importing-empty-first-field = Erstes Feld ist leer: { $val }
importing-field-separator = Feldtrenner
importing-field-mapping = Feldzuordnung
importing-field-of-file-is = Feld <b>{ $val }</b> der Datei ist:
importing-fields-separated-by = Feldtrenner: { $val }
importing-file-must-contain-field-column = Die Datei muss mindestens eine Spalte beinhalten, die einem Notizfeld zugeordnet werden kann.
importing-file-version-unknown-trying-import-anyway = Die Dateiversion ist unbekannt. Es wird trotzdem versucht, den Import durchzuführen.
importing-first-field-matched = Erstes Feld stimmt überein mit: { $val }
importing-identical = Identisch
importing-ignore-field = Feld ignorieren
importing-ignore-lines-where-first-field-matches = Zeilen ignorieren, wenn das erste Feld mit einer bereits vorhandenen Notiz übereinstimmt
importing-ignored = <ignoriert>
importing-import-even-if-existing-note-has = Auch dann importieren, wenn es eine vorhandene Karte mit demselben ersten Feld gibt
importing-import-options = Einstellungen importieren
importing-importing-complete = Import abgeschlossen.
importing-invalid-file-please-restore-from-backup = Ungültige Datei. Bitte eine Sicherungskopie öffnen.
importing-map-to = { $val } zuordnen
importing-map-to-tags = Schlagwörter zuordnen
importing-mapped-to = abgebildet auf <b>{ $val }</b>
importing-mapped-to-tags = abgebildet auf <b>Schlagwörter</b>
importing-mnemosyne-20-deck-db = Mnemosyne 2.0-Stapel (*.db)
importing-multicharacter-separators-are-not-supported-please = Ein aus mehreren Zeichen zusammengesetzter Separator zum Trennen von Datenfeldern wird nicht unterstützt. Bitte geben Sie nur ein Zeichen als Separator ein.
importing-notes-added-from-file = Notizen hinzugefügt von Datei: { $val }
importing-notes-found-in-file = Notizen gefunden in Datei: { $val }
importing-notes-skipped-as-theyre-already-in = Notizen übersprungen, da sich diese bereits in folgender Sammlung befinden: { $val }
importing-notes-that-could-not-be-imported = Notizen, die nicht importiert werden konnten, weil sich der Notiztyp geändert hat: { $val }
importing-notes-updated-as-file-had-newer = Aktualisierte Notizen, da die Datei eine neuere Version ist: { $val }
importing-packaged-anki-deckcollection-apkg-colpkg-zip = Komprimierte Anki-Stapeldatei/Sammlung (*.apkg *.colpkg *.zip)
importing-pauker-18-lesson-paugz = Pauker 1.8 Lektion (*.pau.gz)
# the '|' character
importing-pipe = Pipe
importing-rows-had-num1d-fields-expected-num2d = '{ $row }' hat { $found } Felder, erwartet waren { $expected }
importing-selected-file-was-not-in-utf8 = Die gewählte Datei war nicht im UTF-8-Format. Für weitere Hinweise bitte den Abschnitt »Import« in der Bedienungsanleitung beachten.
importing-semicolon = Semikolon
importing-skipped = Übersprungen
importing-supermemo-xml-export-xml = Supermemo XML-Export (*.xml)
importing-tab = Tabulator
importing-tag-modified-notes = Geänderte Notizen verschlagworten:
importing-text-separated-by-tabs-or-semicolons = Durch Absatzmarken oder Semikola getrennter Text (*)
importing-the-first-field-of-the-note = Das erste Feld des Notiztyps muss auf Karten erscheinen.
importing-the-provided-file-is-not-a = Die ausgewählte Datei ist keine valide .apkg-Datei.
importing-this-file-does-not-appear-to = Diese Datei ist wahrscheinlich keine gültige .apkg-Datei. Wenn dieser Fehler bei einer Datei auftritt, die von AnkiWeb heruntergeladen wurde, ist das Herunterladen höchstwahrscheinlich fehlgeschlagen. Bitte erneut herunterladen; falls das Problem weiterhin besteht, bitte mit einem anderen Browser versuchen.
importing-this-will-delete-your-existing-collection = Hierdurch wird die gesamte derzeitige Sammlung gelöscht und durch die importierte Datei ersetzt. Trotzdem fortfahren?
importing-unable-to-import-from-a-readonly = Import nicht möglich: Die Datei ist schreibgeschützt.
importing-unknown-file-format = Unbekannter Dateityp.
importing-update-existing-notes-when-first-field = Notizen mit übereinstimmendem erstem Feld aktualisieren
importing-updated = Aktualisiert
importing-note-added =
    { $count ->
        [one] { $count } Notiz wurde hinzugefügt
       *[other] { $count } Notizen wurden hinzugefügt
    }
importing-note-imported =
    { $count ->
        [one] { $count } Notiz wurde importiert.
       *[other] { $count } Notizen wurden importiert.
    }
importing-note-unchanged =
    { $count ->
        [one] { $count } Notiz unverändert
       *[other] { $count } Notizen unverändert
    }
importing-note-updated =
    { $count ->
        [one] { $count } Notiz wurde aktualisiert
       *[other] { $count } Notizen wurden aktualisiert
    }
importing-processed-media-file =
    { $count ->
        [one] { $count } verarbeitete Mediendatei
       *[other] { $count } verarbeitete Mediendateien
    }
importing-importing-collection = Sammlung wird importiert...
importing-importing-file = Datei wird importiert...
importing-extracting = Daten werden extrahiert...
importing-gathering = Daten werden zusammengetragen...
importing-failed-to-import-media-file = Mediendatei konnte nicht importiert werden: { $debugInfo }
importing-processed-notes =
    { $count ->
        [one] { $count } Notiz verarbeitet...
       *[other] { $count } Notizen verarbeitet...
    }
importing-processed-cards =
    { $count ->
        [one] { $count } Karte verarbeitet...
       *[other] { $count } Karten verarbeitet...
    }
importing-unable-to-import-filename = { $filename } kann nicht importiert werden: Dateityp nicht unterstützt
importing-existing-notes = Vorhandene Notizen
# "Existing notes: Duplicate" (verb)
importing-duplicate = Duplizieren
# "Existing notes: Preserve" (verb)
importing-preserve = Behalten
# "Existing notes: Update" (verb)
importing-update = Aktualisieren
importing-tag-all-notes = Alle Notizen verschlagworten
importing-tag-updated-notes = Aktualisierte Notizen verschlagworten
importing-file = Datei
