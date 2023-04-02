## Shown at the top of the media check screen

media-check-window-title = Média ellenőrzése
# the number of files, and the total space used by files
# that have been moved to the trash folder. eg,
# "Trash folder: 3 files, 3.47MB"
media-check-trash-count =
    Lomtár: { $count ->
        [one] 1 fájl, { $megs }MB
       *[other] { $count } fájl, { $megs }MB
    }
media-check-missing-count = Hiányzó fájlok: { $count }
media-check-unused-count = Nem használt fájlok: { $count }
media-check-renamed-count = Átnevezett fájlok: { $count }
media-check-oversize-count = Több mint 100 MB: { $count }
media-check-subfolder-count = Almappák: { $count }

## Shown at the top of each section

media-check-renamed-header = Néhány fájl kompatibilitási okokból át lett nevezve:
media-check-oversize-header = A 100 MB feletti fájlokat nem lehet szinkronizálni az AnkiWeb-bel.
media-check-subfolder-header = A médiamappában lévő mappák nem támogatottak.
media-check-missing-header = Az alábbi fájlokra kártyák hivatkoznak, de nem találhatók a médiamappában:
media-check-unused-header = Az alábbi fájlokra egy kártya sem hivatkozik:

## Shown once for each file

media-check-renamed-file = Átnevezve: { $old } -> { $new }
media-check-oversize-file = Több mint 100 MB: { $filename }
media-check-subfolder-file = Mappa: { $filename }
media-check-missing-file = Hiányzó: { $filename }
media-check-unused-file = Felhasználatlan: { $filename }

## Progress

media-check-checked = Ellenőrizve{ $count }...

## Deleting unused media

media-check-delete-unused-confirm = Törli a nem használt médiaállományokat?
media-check-files-remaining =
    { $count ->
        [one] 1 fájl
       *[other] { $count } fájl
    } van hátra.
media-check-delete-unused-complete =
    { $count ->
        [one] 1 fájl
       *[other] { $count } fájl
    } áthelyezve a kukába.
media-check-trash-emptied = A lomtár üres.
media-check-trash-restored = A törölt fájlokat visszaállította a médiamappába.

## Rendering LaTeX

media-check-all-latex-rendered = Az összes LaTeX megjelenítve.

## Buttons

media-check-delete-unused = Törölje a nem használtat
media-check-render-latex = LaTeX megjelenítése
# button to permanently delete media files from the trash folder
media-check-empty-trash = Lomtár ürítése
# button to move deleted files from the trash back into the media folder
media-check-restore-trash = Törlés visszaállítása
media-check-check-media-action = Média ellenőrzése
