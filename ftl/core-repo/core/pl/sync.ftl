### Messages shown when synchronizing with AnkiWeb.


## Media synchronization

sync-media-added-count = Dodano: { $up }↑ { $down }↓
sync-media-removed-count = Usunięto: { $up }↑ { $down }↓
sync-media-checked-count = Sprawdzono: { $count }
sync-media-starting = Początek synchronizacji plików...
sync-media-complete = Synchronizacja plików zakończona.
sync-media-failed = Synchronizacja plików nie udała się.
sync-media-aborting = Przerywanie synchronizacji plików...
sync-media-aborted = Synchronizacja plików została przerwana.
# Shown in the sync log to indicate media syncing will not be done, because it
# was previously disabled by the user in the preferences screen.
sync-media-disabled = Synchronizacja plików jest wyłączona.
# Title of the screen that shows syncing progress history
sync-media-log-title = Rejestr synchronizowanych plików

## Error messages / dialogs

sync-conflict = Tylko jedna kopia Anki może równocześnie synchronizować się z twoim kontem. Poczekaj kilka minut i spróbuj ponownie.
sync-server-error = AnkiWeb napotkało problem. Spróbuj ponownie za kilka minut.
sync-client-too-old = Używasz zbyt starej wersji Anki. Aby móc synchronizować, musisz zaktualizować program do najnowszej wersji.
sync-wrong-pass = Identyfikator AnkiWeb ID lub hasło jest niepoprawne; spróbuj ponownie.
sync-resync-required = Spróbuj ponownie uruchomić synchronizację. Jeśli ten komunikat nie przestanie się pojawiać, zgłoś problem na stronie wsparcia technicznego Anki.
sync-must-wait-for-end = Trwa synchronizacja. Zaczekaj aż się zakończy, a następnie spróbuj ponownie.
sync-confirm-empty-download = Nie ma kart w lokalnej kolekcji. Pobrać je z AnkiWeb?
sync-conflict-explanation =
    Twoje talie tu i w AnkiWeb różnią się w taki sposób, że nie mogą zostać złączone. Konieczne jest nadpisanie talii po jednej stronie taliami z drugiej strony.
    
    Jeśli wybierzesz pobieranie, Anki ściągnie kolekcję z AnkiWeb i wszystkie zmiany wykonane na Twoim komputerze od ostatniej synchronizacji zostaną utracone.
    
    Jeśli wybierzesz przesyłanie, Anki wyśle Twoją kolekcję do AnkiWeb i wszystkie zmiany wykonane w AnkiWeb lub na innych urządzeniach od ostatniej synchronizacji zostaną utracone.
    
    Po zsynchronizowaniu wszystkich urządzeń kolejne powtórki i dodane karty zostaną złączone automatycznie.
sync-ankiweb-id-label = Identyfikator AnkiWeb ID:
sync-password-label = Hasło:
sync-account-required =
    <h1>Wymagane konto</h1>
    Wymagane jest posiadanie darmowego konta, aby Twoja kolekcja mogła być synchronizowana. <a href="{ $link }">Zarejestruj</a> konto, a następnie wprowadź poniżej swoje dane.
sync-sanity-check-failed = Użyj opcji Sprawdź bazę danych, a następnie zsynchronizuj ponownie. Jeśli problem nie ustępuje wymuś  w ustawieniach pełną synchronizację.
sync-clock-off = Nie można zsynchronizować - twój zegar nie ma ustawionego poprawnego czasu.
sync-upload-too-large =
    Twoja kolekcja jest za duża, żeby przesłać ją do AnkiWeb. Możesz zmniejszyć
    jej rozmiar usuwając niepotrzebne talie (opcjonalnie eksportując je wcześniej),
    a następnie używając opcji Sprawdź bazę danych, by zmniejszyć rozmiar pliku. ({ $details })

## Buttons

sync-media-log-button = Rejestr plików
sync-abort-button = Przerwij
sync-download-from-ankiweb = Pobierz z AnkiWeb
sync-upload-to-ankiweb = Prześlij do AnkiWeb
sync-cancel-button = Anuluj

## Normal sync progress

sync-downloading-from-ankiweb = Pobieranie z AnkiWeb...
sync-uploading-to-ankiweb = Przesyłanie do AnkiWeb...
sync-syncing = Synchronizacja...
sync-checking = Sprawdzanie...
sync-connecting = Łączenie...
sync-added-updated-count = Dodano/zmodyfikowano: { $up }↑ { $down }↓
sync-log-out-button = Wyloguj się
