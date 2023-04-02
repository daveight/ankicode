## Shown at the top of the media check screen

media-check-window-title = Controlla file multimediali
# the number of files, and the total space used by files
# that have been moved to the trash folder. eg,
# "Trash folder: 3 files, 3.47MB"
media-check-trash-count =
    Cestino: { $count ->
        [one] 1 file, { $megs }MB
       *[other] { $count } file, { $megs }MB
    }
media-check-missing-count = File mancanti: { $count }
media-check-unused-count = File inutilizzati: { $count }
media-check-renamed-count = File rinominati: { $count }
media-check-oversize-count = Più di 100MB: { $count }
media-check-subfolder-count = Sottocartelle: { $count }

## Shown at the top of each section

media-check-renamed-header = Alcuni file sono stati rinominati per compatibilità:
media-check-oversize-header = File grandi più di 100MB non possono essere sincronizzati con AnkiWeb.
media-check-subfolder-header = Le cartelle all'interno della cartella dei media non sono supportate.
media-check-missing-header = Usato nelle carte ma mancante nella cartella multimediale:
media-check-unused-header = I seguenti file sono stati trovati nella cartella dei media, ma sembra non siano stati utilizzati in nessuna carta:
media-check-template-references-field-header =
    Anki non è in grado di rilevare i file usati quando usi i riferimenti { "{{Field}}" } nei tag media/LaTeX. I tag media/LaTeX dovrebbero invece essere posizionati su singole note.¶
    ¶
    Modelli di riferimento:

## Shown once for each file

media-check-renamed-file = Rinominati: { $old } -> { $new }
media-check-oversize-file = Più di 100MB: { $filename }
media-check-subfolder-file = Cartella: { $filename }
media-check-missing-file = Manca: { $filename }
media-check-unused-file = Inutilizzato: { $filename }

##

# Eg "Basic: Card 1 (Front Template)"
media-check-notetype-template = { $notetype }: { $card_type } ({ $side })

## Progress

media-check-checked = { $count } controllati...

## Deleting unused media

media-check-delete-unused-confirm = Elimina contenuto multimediale non utilizzato?
media-check-files-remaining =
    { $count ->
        [one] 1 file
       *[other] { $count } file
    }  rimanenti.
media-check-delete-unused-complete =
    { $count ->
        [one] 1 file
       *[other] { $count } file
    }  spostati nel cestino.
media-check-trash-emptied = Il cestino è stato svuotato.
media-check-trash-restored = Ripristina i file eliminati nella cartella dei media.

## Rendering LaTeX

media-check-all-latex-rendered = Tutto LaTeX renderizzato.

## Buttons

media-check-delete-unused = Elimina file inutilizzati
media-check-render-latex = Renderizza LaTeX
# button to permanently delete media files from the trash folder
media-check-empty-trash = Svuota cestino
# button to move deleted files from the trash back into the media folder
media-check-restore-trash = Ripristina i file eliminati
media-check-check-media-action = Controlla file multimediali
# a tag for notes with missing media files (must not contain whitespace)
media-check-missing-media-tag = media-mancanti
# add a tag to notes with missing media
media-check-add-tag = Etichetta mancanti
