### Messages shown when synchronizing with AnkiWeb.


## Media synchronization

sync-media-added-count = Hinzugefügt: { $up }↑ { $down }↓
sync-media-removed-count = Entfernt: { $up }↑ { $down }↓
sync-media-checked-count = Überprüft: { $count }
sync-media-starting = Mediensynchronisierung startet...
sync-media-complete = Die Mediensynchronisierung ist abgeschlossen.
sync-media-failed = Die Mediensynchronisierung ist fehlgeschlagen.
sync-media-aborting = Mediensychronisierung wird abgebrochen...
sync-media-aborted = Die Mediensynchronisierung wurde abgebrochen.
# Shown in the sync log to indicate media syncing will not be done, because it
# was previously disabled by the user in the preferences screen.
sync-media-disabled = Die Mediensychronisierung wurde deaktiviert.
# Title of the screen that shows syncing progress history
sync-media-log-title = Mediensychronisations-Logfile

## Error messages / dialogs

sync-conflict = Es kann sich ausschließlich ein Client von Anki mit ihrem Konto synchronisieren. Bitte warten Sie einige Minuten und versuchen Sie es anschließend erneut.
sync-server-error = Es ist ein Problem mit AnkiWeb aufgetreten. Bitte versuchen Sie es in ein paar Minuten erneut.
sync-client-too-old = Ihre Anki-Version ist zu alt. Bitte aktualisieren Sie Anki auf die neuste Version, um weiterhin sychronisieren zu können.
sync-wrong-pass = Die AnkiWeb-Kennung oder das Passwort waren falsch; bitte nochmal versuchen.
sync-resync-required = Bitte synchronisieren Sie noch einmal. Wenn diese Meldung weiterhin erscheint, wenden Sie sich bitte an die Support-Seite.
sync-must-wait-for-end = Anki synchronisiert gerade. Bitte warten Sie, bis die Synchronisation abgeschlossen ist und versuchen Sie es danach erneut.
sync-confirm-empty-download = Die lokale Sammlung enthält keine Karten. Möchten Sie sie von AnkiWeb herunterladen?
sync-conflict-explanation =
    Der Stapel hier und auf AnkiWeb unterscheiden sich in einer solchen Weise, dass sie nicht zusammengeführt werden können. Es ist daher notwendig, die Stapel auf einer Seite mit den Stapeln auf der anderen Seite zu überschreiben.
    
    Wenn jetzt »Herunterladen« ausgewählt wird, wird Anki die Stapel von AnkiWeb herunterladen, und alle Änderungen, die seit der letzten Synchronisation auf diesem Rechner gemacht wurden, gehen verloren.
    
    Wenn Sie »Hochladen« auswählen, wird Anki Ihre Stapel nach AnkiWeb hochladen, und alle Änderungen, die Sie im AnkiWeb oder Ihren anderen Geräten seit der letzten Synchronisation gemacht haben, gehen verloren.
    
    Nachdem die Stapel auf allen Geräten synchron sind, werden zukünftige Wiederholungen (von Karten) und neu hinzugefügte Karten automatisch zusammengeführt.
sync-ankiweb-id-label = AnkiWeb-Kennung:
sync-password-label = Passwort:
sync-account-required =
    <h1>Anmeldung erforderlich</h1>
    Um die Sammlung zu synchronisieren ist die Anmeldung zu einem kostenfreien Nutzerkonto notwendig, <a href="{ $link }">Registrierung hier</a>. Danach bitte hier Benutzernamen und Passwort eingeben.
sync-sanity-check-failed = Bitte benutzen Sie die Funktion „Datenbank überprüfen“ und synchronisieren Sie anschließend. Wenn das Problem weiterhin besteht, dann erzwingen Sie bitte eine vollständige Sychronisation in den Einstellungen.
sync-clock-off = Synchronisation kann nicht durchgeführt werden - Ihre System-Uhrzeit ist nicht richtig eingestellt.
sync-upload-too-large =
    Ihre Sammlungsdatei ist zu groß, um sie zu AnkiWeb zu senden. Sie können die
    Größe verringeren, indem Sie ungewünschte Stapel (optional zuvor noch exportieren) löschen und dann die Funktion 'Datenbank überprüfen' nutzen, um die Dateigröße zu verringern. ({ $details })

## Buttons

sync-media-log-button = Medien-Logfile
sync-abort-button = Abbrechen
sync-download-from-ankiweb = Von AnkiWeb herunterladen
sync-upload-to-ankiweb = Zu AnkiWeb hochladen
sync-cancel-button = Abbrechen

## Normal sync progress

sync-downloading-from-ankiweb = Von AnkiWeb herunterladen  …
sync-uploading-to-ankiweb = Zu AnkiWeb wird hochgeladen …
sync-syncing = Synchronisation wird durchgeführt …
sync-checking = Überprüfung läuft …
sync-connecting = Verbindungsaufbau …
sync-added-updated-count = Hinzugefügt/geändert: { $up } ↑ { $down } ↓
sync-log-out-button = Abmelden
