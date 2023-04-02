### Messages shown when synchronizing with AnkiWeb.


## Media synchronization

sync-media-added-count = Afegits: { $up }↑ { $down }↓
sync-media-removed-count = Eliminats: { $up }↑ { $down }↓
sync-media-checked-count = Comprovats: { $count }
sync-media-starting = Iniciant la sincronizació dels fitxers multimèdia…
sync-media-complete = Sincronitació dels fitxers multimèdia completada.
sync-media-failed = La sincronització dels fitxers multimèdia ha fallat.
sync-media-aborting = Avortant la sincronització dels fitxers multimèdia…
sync-media-aborted = Sincronització dels fitxers multimèdia avortada.
# Shown in the sync log to indicate media syncing will not be done, because it
# was previously disabled by the user in the preferences screen.
sync-media-disabled = La sincronització dels fitxers multimèdia està desactivada.
# Title of the screen that shows syncing progress history
sync-media-log-title = Registre de sincronització dels fitxers multimèdia

## Error messages / dialogs

sync-conflict = No podeu sincronitzar més d'una instància d'Anki alhora al vostre compte. Espereu uns minuts i torneu-ho a intentar.
sync-server-error = AnkiWeb ha trobat un problema. Espereu uns minuts i torneu-ho a intentar.
sync-client-too-old = La vostra versió d'Anki és massa antiga. Actualitzeu a l'última versió per a continuar amb la sincronització.
sync-wrong-pass = El vostre identificador d'AnkiWeb o la contrasenya són incorrectes; torneu-ho a intentar.
sync-resync-required = Torneu a sincronitzar les dades. Si l'error persisteix, publiqueu un missatge al lloc de suport.
sync-must-wait-for-end = Anki s'està sincronitzant ara mateix. Espereu que es completi la sincronització i torneu-ho a intentar.
sync-confirm-empty-download = La col·lecció local no conté cap targeta. Desitgeu descarregar-ne des d'AnkiWeb?
sync-conflict-explanation =
    Les baralles locals i les d’AnkiWeb no coincideixen, de manera que no és possible combinar-les. Per tant, cal sobreescriure un dels dos grups de baralles amb els de l’altre.
    
    Si seleccioneu «Descarrega», Anki descarregarà la col·lecció des d’AnkiWeb i perdreu qualsevol canvi que hàgiu fet en el vostre ordinador des de l’última sincronització.
    
    Si seleccioneu «Carrega», Anki carregarà la vostra col·lecció a AnkiWeb i perdreu qualsevol canvi que hàgiu fet en AnkiWeb o en qualsevol altre dispositiu des de l’última sincronització.
    
    Després de sincronitzar tots els dispositius, podreu combinar automàticament tots els repassos futurs i les targetes afegides.
sync-ankiweb-id-label = Identificador d'AnkiWeb:
sync-password-label = Contrasenya:
sync-account-required =
    <h1>Cal tenir un compte</h1>
    Cal que tingueu un compte gratuït per a mantenir la vostra col·lecció actualitzada. <a href="{ $link }">Registreu-vos</a> i inseriu les vostres credencials a sota.
sync-sanity-check-failed = Feu servir la funció «Verifica la base de dades» i, tot seguit, torneu-la a sincronitzar. Si els problemes persisteixen, forceu la sincronització completa des de la finestra de preferències.
sync-clock-off = No s'ha pogut sincronitzar la base de dades. Comproveu que el rellotge del vostre dispositiu mostra l'hora correcta.
sync-upload-too-large =
    El fitxer de col·lecció és massa gran per carregar-lo a AnkiWeb. Podeu reduir-ne la mida 
    treient les baralles que no utilitzeu (si voleu, podeu exportar-les abans) i, tot seguit, fent servir la funció «Verifica la base de dades» per a reduir la mida del fitxer. ({ $details })

## Buttons

sync-media-log-button = Registre dels fitxers multimèdia
sync-abort-button = Avortar
sync-download-from-ankiweb = Descarregar des d'AnkiWeb
sync-upload-to-ankiweb = Carregar a AnkiWeb
sync-cancel-button = Anul·la

## Normal sync progress

sync-downloading-from-ankiweb = S'està baixant des d'AnkiWeb…
sync-uploading-to-ankiweb = S'està penjant a AnkiWeb…
sync-syncing = S'està sincronitzant…
sync-checking = S'està verificant…
sync-connecting = S'està connectant…
sync-added-updated-count = Afegides o modificades: { $up }↑ { $down }↓
sync-log-out-button = Tancar la sessió
