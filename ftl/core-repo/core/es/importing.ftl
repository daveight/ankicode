importing-failed-debug-info = La importación falló. Información de depuración:
importing-aborted = Abortada: { $val }
importing-added-duplicate-with-first-field = Añadida duplicada con primer campo: { $val }
importing-all-supported-formats = Todos los formatos compatibles { $val }
importing-allow-html-in-fields = Permitir HTML en los campos
importing-anki-files-are-from-a-very = Archivos de .anki son de una versión muy vieja de Anki. Puedes importarlos con Anki 2.0, disponible en el sitio web de Anki.
importing-anki2-files-are-not-directly-importable = Los archivos .anki2 no se pueden importar directamente - por favor importe los archivos .apkg o .zip  que ha recibido en su lugar.
importing-appeared-twice-in-file = Apareció doble en el archivo: { $val }
importing-by-default-anki-will-detect-the = Por defecto, Anki detectará el carácter entre campos, como una marca de tabulación, una coma o similares. Si Anki detecta el carácter incorrectamente, puedes introducirlo aquí. Usa \t para representar una marca de tabulación.
importing-change = Modificar
importing-colon = Dos puntos
importing-comma = Coma
importing-empty-first-field = Primer campo vacio: { $val }
importing-field-separator = Separador de camo
importing-field-mapping = Asignar campos
importing-field-of-file-is = El campo <b>{ $val }</b> del archivo es:
importing-fields-separated-by = Campos separados por: { $val }
importing-file-must-contain-field-column = El archivo debe contener al menos una columna que pueda asignarse a un campo de la nota.
importing-file-version-unknown-trying-import-anyway = Versión del archivo desconocida, intentando abrir de todas formas.
importing-first-field-matched = Primer campo coincidente: { $val }
importing-identical = Idéntico
importing-ignore-field = Ignorar campo
importing-ignore-lines-where-first-field-matches = Ignorar líneas donde el primer campo coincida con una nota existente
importing-ignored = <ignorado>
importing-import-even-if-existing-note-has = Importar aún cuando exista alguna nota con el mismo primer campo
importing-import-options = Importar opciones
importing-importing-complete = Importación completa.
importing-invalid-file-please-restore-from-backup = El archivo no válido. Por favor, restaure una copia de seguridad.
importing-map-to = Asignar a { $val }
importing-map-to-tags = Asignar a etiquetas
importing-mapped-to = asignado a <b>{ $val }</b>
importing-mapped-to-tags = asignado a <b>Etiquetas</b>
importing-mnemosyne-20-deck-db = Mazo Mnemosyne 2.0 (*.db)
importing-multicharacter-separators-are-not-supported-please = Los separadores de más de un caracter no son válidos. Por favor, introduzca un solo caracter.
importing-notes-added-from-file = Notas añadidas desde el archivo: { $val }
importing-notes-found-in-file = Notas encontradas en el archivo: { $val }
importing-notes-skipped-as-theyre-already-in = Se han omitido las notas porque ya se encuentran en tu colección: { $val }
importing-notes-that-could-not-be-imported = Notas que no pudieron importarse debido a un cambio de tipo: { $val }
importing-notes-updated-as-file-had-newer = Notas actualizadas; existía una nueva versión del archivo: { $val }
importing-packaged-anki-deckcollection-apkg-colpkg-zip = Mazo de Anki comprimido/ Colección (*.apkg *.colpkg *.zip)
importing-pauker-18-lesson-paugz = Lección Pauker 1.8 (*.pau.gz)
# the '|' character
importing-pipe = Barra vertical
importing-rows-had-num1d-fields-expected-num2d = '{ $row }' tenía { $found } campos, se esperaban { $expected }
importing-selected-file-was-not-in-utf8 = El archivo seleccionado no estaba en formato UTF-8. Por favor, lee la sección "importación" del manual.
importing-semicolon = Punto y coma
importing-skipped = Saltado
importing-supermemo-xml-export-xml = XML exportado de Supermemo (*.xml)
importing-tab = Tabulación
importing-tag-modified-notes = Etiqueta las notas modificadas:
importing-text-separated-by-tabs-or-semicolons = Texto separado por tabulaciones o punto y coma (*)
importing-the-first-field-of-the-note = El primer campo del tipo de nota debe ser asignado a algo.
importing-the-provided-file-is-not-a = El archivo proporcionado no es un archivo .apkg valido.
importing-this-file-does-not-appear-to = Este archivo no parece ser un archivo .apkg válido. Si estás obteniendo este error con un archivo descargado desde AnkiWeb, es posible que tu descarga haya fallado. Por favor, vuelve a intentarlo, y si el problema continua, vuelve a intentarlo con otro navegador.
importing-this-will-delete-your-existing-collection = Esto eliminará tu colección actual y la reemplazará con los datos del archivo que estás importando. ¿Estás seguro?
importing-unable-to-import-from-a-readonly = No es posible importar desde un archivo de sólo lectura.
importing-unknown-file-format = Formato de archivo desconocido.
importing-update-existing-notes-when-first-field = Actualizar las tarjetas existentes cuando el primer campo coincida
importing-updated = Actualizado
importing-note-added =
    { $count ->
        [one] { $count } nota añadida
       *[other] { $count } notas añadidas
    }
importing-note-imported =
    { $count ->
        [one] { $count } nota importada.
       *[other] { $count } notas importadas.
    }
importing-note-unchanged =
    { $count ->
        [one] { $count } nota inalterada
       *[other] { $count } notas inalteradas
    }
importing-note-updated =
    { $count ->
        [one] { $count } nota actualizada
       *[other] { $count } notas actualizadas
    }
importing-processed-media-file =
    { $count ->
        [one] { $count } archivo multimedia procesado
       *[other] { $count } archivos multimedia procesados
    }
importing-importing-file = Importando archivo...
importing-extracting = Extrayendo datos...
importing-gathering = Reuniendo datos...
importing-failed-to-import-media-file = No se pudo importar el archivo multimedia: { $debugInfo }
importing-processed-notes =
    { $count ->
        [one] { $count } nota procesada...
       *[other] { $count } notas procesadas...
    }
importing-processed-cards =
    { $count ->
        [one] Se ha procesado una tarjeta…
       *[other] Se han procesado { $count } tarjetas…
    }
importing-existing-notes = Notas existentes
# "Existing notes: Duplicate" (verb)
importing-duplicate = Duplicar
# "Existing notes: Preserve" (verb)
importing-preserve = Conservar
# "Existing notes: Update" (verb)
importing-update = Actualizar
importing-tag-all-notes = Etiquetar todas las notas
importing-tag-updated-notes = Etiquetar las notas actualizadas
importing-file = Archivo
importing-notetype-and-deck = Tipo de nota y mazo

## NO NEED TO TRANSLATE. This text is no longer used by Anki, and will be removed in the future.

importing-importing-collection = Importando colección...
importing-unable-to-import-filename = No fue posible importar { $filename }: tipo de archivo no compatible
