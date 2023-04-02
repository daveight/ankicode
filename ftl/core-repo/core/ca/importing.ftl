importing-failed-debug-info = La importació ha fallat. Informació de depuració:
importing-aborted = Interromput: { $val }
importing-added-duplicate-with-first-field = S'ha afegit duplicada amb el primer camp: { $val }
importing-all-supported-formats = Tots els formats compatibles { $val }
importing-allow-html-in-fields = Permet l'HTML als camps
importing-anki-files-are-from-a-very = Aquests fitxers .anki són d'una versió anterior massa antiga d'Anki. Podeu importar-los amb el complement 175027074 o amb Anki 2.0, que està disponible en el web d'Anki.
importing-anki2-files-are-not-directly-importable = Els fitxers .anki2 no es poden importar directament; en el seu lloc, importeu els fitxers .apkg o .zip que heu rebut.
importing-appeared-twice-in-file = Ha aparegut dues vegades en el fitxer: { $val }
importing-by-default-anki-will-detect-the = Per defecte, Anki detectarà una tabulació, una coma o similar entre camps. Si Anki reconeix malament aquest caràcter, introduïu-lo ací. Per a representar la tabulació, heu de fer servir \t.
importing-change = Canvia
importing-colon = Dos punts
importing-comma = Coma
importing-empty-first-field = Primer camp buit: { $val }
importing-field-separator = Separador de camp
importing-field-mapping = Assignació de camps
importing-field-of-file-is = El camp <b>{ $val }</b> del fitxer és:
importing-fields-separated-by = Camps separats per: { $val }
importing-file-must-contain-field-column = El fitxer ha de contenir almenys una columna que pugui assignar-se a un camp de la nota.
importing-file-version-unknown-trying-import-anyway = La versió del fitxer és desconeguda; de totes maneres, Anki intentarà importar-lo.
importing-first-field-matched = Primer camp coincident: { $val }
importing-identical = Idèntic
importing-ignore-field = Ignora el camp
importing-ignore-lines-where-first-field-matches = Ignora les línies en què el primer camp coincideix amb una nota existent
importing-ignored = <ignorat>
importing-import-even-if-existing-note-has = Importa encara que existeixi una nota amb el mateix primer camp
importing-import-options = Opcions d'importació
importing-importing-complete = Importació completa.
importing-invalid-file-please-restore-from-backup = Fitxer invàlid. Restaureu des d'una còpia de seguretat.
importing-map-to = Associa a { $val }
importing-map-to-tags = Associa a les etiquetes
importing-mapped-to = assignat a <b>{ $val }</b>
importing-mapped-to-tags = assignat a <b>Etiquetes</b>
importing-mnemosyne-20-deck-db = Baralla Mnemosyne 2.0 (*.db)
importing-multicharacter-separators-are-not-supported-please = Els separadors de més d'un caràcter no son vàlids; introduïu un sol caràcter.
importing-notes-added-from-file = Notes afegides des del fitxer: { $val }
importing-notes-found-in-file = Notes trobades en el fitxer: { $val }
importing-notes-skipped-as-theyre-already-in = S'han omès les notes, atès que ja es troben en la vostra col·lecció: { $val }
importing-notes-that-could-not-be-imported = Notes que no s'han pogut importar a causa d'un canvi de tipus de nota: { $val }
importing-notes-updated-as-file-had-newer = Notes actualitzades, atès que el fitxer contenia una versió més recent: { $val }
importing-packaged-anki-deckcollection-apkg-colpkg-zip = Baralla comprimida d’Anki o col·lecció (*.apkg *.colpkg *.zip)
importing-pauker-18-lesson-paugz = Lliçó de Pauker 1.8 (*.pau.gz)
# the '|' character
importing-pipe = Barra vertical
importing-rows-had-num1d-fields-expected-num2d = '{ $row }' tenia { $found } camps, se n'esperaven { $expected }
importing-selected-file-was-not-in-utf8 = El fitxer seleccionat no està en format UTF-8; llegiu la secció del manual referent a la importació per a més informació.
importing-semicolon = Punt i coma
importing-skipped = Omès
importing-supermemo-xml-export-xml = XML exportat de Supermemo (*.xml)
importing-tab = Tabulació
importing-tag-modified-notes = Etiqueta les notes modificades:
importing-text-separated-by-tabs-or-semicolons = Text separat per tabulacions o punt i coma (*)
importing-the-first-field-of-the-note = El primer camp del tipus de nota ha d'assignar-se a alguna cosa.
importing-the-provided-file-is-not-a = El fitxer proporcionat no és un fitxer .apkg vàlid.
importing-this-file-does-not-appear-to = Sembla que aquest fitxer no és un fitxer .apkg vàlid. Si heu obtingut aquest error amb un fitxer descarregat des d'AnkiWeb, és possible que la descàrrega hagi fallat. Torneu-ho a intentar i, si el problema persisteix, intenteu-ho amb un altre navegador.
importing-this-will-delete-your-existing-collection = S'eliminarà la vostra col·lecció actual i es reemplaçarà amb les dades del fitxer que voleu importar. N'esteu segur?
importing-unable-to-import-from-a-readonly = No és possible importar des d'un fitxer de només lectura.
importing-unknown-file-format = Format de fitxer desconegut.
importing-update-existing-notes-when-first-field = Actualitza les targetes existents quan el primer camp coincideixi
importing-updated = Actualitzat
importing-note-added =
    { $count ->
        [one] S'ha afegit una nota
       *[other] S'han afegit { $count } notes
    }
importing-note-imported =
    { $count ->
        [one] S'ha importat una nota.
       *[other] S'han importat { $count } notes.
    }
importing-note-unchanged =
    { $count ->
        [one] No s'ha alterat una nota
       *[other] No s'han alterat { $count } notes
    }
importing-note-updated =
    { $count ->
        [one] S'ha actualitzat una nota
       *[other] S'han actualitzat { $count } noes
    }
importing-processed-media-file =
    { $count ->
        [one] S'ha processat un fitxer multimèdia
       *[other] S'han processat { $count } fitxers multimèdia
    }
importing-importing-file = S'està important el fitxer…
importing-extracting = Extraient-ne les dades…
importing-gathering = Reunint-ne les dades…
importing-failed-to-import-media-file = No s'ha pogut importar el fitxer multimèdia: { $debugInfo }
importing-processed-notes =
    { $count ->
        [one] S'ha processat una nota…
       *[other] S'han processat { $count } notes…
    }
importing-processed-cards =
    { $count ->
        [one] S'ha processat una targeta…
       *[other] S'han processat { $count } targetes…
    }
importing-existing-notes = Notes existents
# "Existing notes: Duplicate" (verb)
importing-duplicate = Duplica
# "Existing notes: Preserve" (verb)
importing-preserve = Conserva
# "Existing notes: Update" (verb)
importing-update = Actualitza
importing-tag-all-notes = Etiqueta totes les notes
importing-tag-updated-notes = Etiqueta les notes actualitzades
importing-file = Fitxer
importing-match-scope = Abast de correspondència
importing-notetype-and-deck = Tipus de nota i baralla

## NO NEED TO TRANSLATE. This text is no longer used by Anki, and will be removed in the future.

importing-importing-collection = S'està important la col·lecció…
importing-unable-to-import-filename = No s'ha pogut importar el fitxer { $filename }. Tipus de fitxer no compatible.
