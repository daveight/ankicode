importing-failed-debug-info = Importazione fallita. Informazioni sul debug:
importing-aborted = Interrotto: { $val }
importing-added-duplicate-with-first-field = Aggiunto duplicato con primo campo: { $val }
importing-all-supported-formats = Tutti i formati supportati { $val }
importing-allow-html-in-fields = Consenti l'HTML nei campi
importing-anki-files-are-from-a-very = I file .anki sono di una versione molto vecchia di Anki. Puoi importarli utilizzando Anki 2.0, disponibile sul sito di Anki.
importing-anki2-files-are-not-directly-importable = I file .anki2 non sono importabili direttamente - importa invece i file .apkg o .zip che hai ricevuto.
importing-appeared-twice-in-file = Apparsa due volte nel file: { $val }
importing-by-default-anki-will-detect-the = Di default, Anki rileva i caratteri tra i campi, come tabulazioni, virgole, ecc. Se Anki non rileva correttamente i caratteri, puoi inserirli qui. Usa \t per rappresentare le tabulazioni.
importing-change = Modifica
importing-colon = Due punti
importing-comma = Virgola
importing-empty-first-field = Primo campo vuoto: { $val }
importing-field-separator = Separatore di campo
importing-field-mapping = Mappatura campi
importing-field-of-file-is = Il campo <b>{ $val }</b> del file è:
importing-fields-separated-by = Campi separati da: { $val }
importing-file-must-contain-field-column = Il file deve contenere almeno una colonna che possa essere mappata al campo di una nota.
importing-file-version-unknown-trying-import-anyway = Versione del file sconosciuta, tento ugualmente l'importazione.
importing-first-field-matched = Primo campo corrispondente: { $val }
importing-identical = Identico
importing-ignore-field = Ignora campo
importing-ignore-lines-where-first-field-matches = Ignora le righe il cui primo campo corrisponde a una nota esistente
importing-ignored = <ignorato>
importing-import-even-if-existing-note-has = Importa anche se una nota esistente ha lo stesso primo campo
importing-import-options = Opzioni di importazione
importing-importing-complete = Importazione completata.
importing-invalid-file-please-restore-from-backup = File non valido. Ripristina dal backup.
importing-map-to = Mappa su { $val }
importing-map-to-tags = Mappa verso le etichette
importing-mapped-to = mappato su <b>{ $val }</b>
importing-mapped-to-tags = mappato verso le <b>etichette</b>
importing-mnemosyne-20-deck-db = Mazzo di Mnemosyne 2.0 (*.db)
importing-multicharacter-separators-are-not-supported-please = Separatori multi-carattere non sono supportati. Inserisci un solo carattere.
importing-notes-added-from-file = Note aggiunte dal file: { $val }
importing-notes-found-in-file = Note trovate nel file: { $val }
importing-notes-skipped-as-theyre-already-in = Note saltate, poiché già nella tua collezione: { $val }
importing-notes-that-could-not-be-imported = Note che non hanno potuto essere importate, in quanto è cambiato il tipo di nota: { $val }
importing-notes-updated-as-file-had-newer = Note aggiornate, in quanto il file contiene una nuova versione: { $val }
importing-packaged-anki-deckcollection-apkg-colpkg-zip = Mazzo/Collezzione Anki impacchettato (*.apkg *.colpkg *.zip)
importing-pauker-18-lesson-paugz = Lezione di Pauker 1.8 (*.pau.gz)
# the '|' character
importing-pipe = Barra verticale (Pipe)
importing-rows-had-num1d-fields-expected-num2d = '{ $row }' possiedono { $found } campi, mentre ci si aspettava { $expected }
importing-selected-file-was-not-in-utf8 = Il file selezionato non era nel formato UTF-8. Consulta la sezione importazione del manuale.
importing-semicolon = Punto e virgola
importing-skipped = Saltato
importing-supermemo-xml-export-xml = Supermemo esportato in XML (*.xml)
importing-tab = Tabulazione
importing-tag-modified-notes = Etichetta le note modificate:
importing-text-separated-by-tabs-or-semicolons = Testo separato da tabulazioni o punti e virgola (*)
importing-the-first-field-of-the-note = Il primo campo della nota dev'essere mappato.
importing-the-provided-file-is-not-a = Il file non è un file .apkg valido.
importing-this-file-does-not-appear-to = Questi file sembra non essere un file .apkg valido. Se ottieni questo errore con un file scaricato da AnkiWeb, è probabile che il download non sia riuscito. Riprova, e, se il problema rimane, prova di nuovo con un altro browser.
importing-this-will-delete-your-existing-collection = La tua collezione esistente verrà eliminata e sostituita con i dati del file che stai importando. Sei sicuro?
importing-unable-to-import-from-a-readonly = Impossibile importare da un file di sola lettura.
importing-unknown-file-format = Formato del file sconosciuto.
importing-update-existing-notes-when-first-field = Aggiorna le note esistenti se il primo campo corrisponde
importing-updated = Aggiornato
importing-note-added =
    { $count ->
        [one] { $count } nota aggiunta
       *[other] { $count } note aggiunte
    }
importing-note-imported =
    { $count ->
        [one] { $count } nota importata.
       *[other] { $count } note importate.
    }
importing-note-unchanged =
    { $count ->
        [one] { $count } nota invariata
       *[other] { $count } note invariate
    }
importing-note-updated =
    { $count ->
        [one] { $count } nota aggiornata
       *[other] { $count } note aggiornate
    }
importing-processed-media-file =
    { $count ->
        [one] Processato { $count } file multimediale
       *[other] Processati { $count } file multimediali
    }
importing-importing-file = Importazione del file...
importing-extracting = Estrazione dei dati...
importing-gathering = Raccolta dei dati...
importing-failed-to-import-media-file = Impossibile importare il file multimediale: { $debugInfo }
importing-processed-notes =
    { $count ->
        [one] Processata { $count } nota...
       *[other] Processate { $count } note...
    }
importing-processed-cards =
    { $count ->
        [one] Processata { $count } carta...
       *[other] Processate { $count } carte...
    }
importing-existing-notes = Note esistenti
# "Existing notes: Duplicate" (verb)
importing-duplicate = Duplica
# "Existing notes: Preserve" (verb)
importing-preserve = Mantieni
# "Existing notes: Update" (verb)
importing-update = Aggiorna
importing-tag-all-notes = Etichetta tutte le note
importing-tag-updated-notes = Etichetta le note aggiornate
importing-file = File
importing-notetype-and-deck = Tipo di nota e mazzo

## NO NEED TO TRANSLATE. This text is no longer used by Anki, and will be removed in the future.

importing-importing-collection = Importazione della collezione...
importing-unable-to-import-filename = Impossibile importare { $filename }: tipo di file non supportato
