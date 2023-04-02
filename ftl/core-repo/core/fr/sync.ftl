### Messages shown when synchronizing with AnkiWeb.


## Media synchronization

sync-media-added-count = Ajoutés : ’{ $up }↑ { $down }↓
sync-media-removed-count = Supprimés : { $up }↑ { $down }↓
sync-media-checked-count = Vérifiés : { $count }
sync-media-starting = Démarrage de la synchronisation des médias...
sync-media-complete = Synchronisation des médias terminée.
sync-media-failed = Échec de la synchronisation des médias.
sync-media-aborting = Abandon de la synchronisation des médias...
sync-media-aborted = Synchronisation des médias abandonnée.
# Shown in the sync log to indicate media syncing will not be done, because it
# was previously disabled by the user in the preferences screen.
sync-media-disabled = Synchronisation des médias désactivée.
# Title of the screen that shows syncing progress history
sync-media-log-title = Logs de synchronisation des médias

## Error messages / dialogs

sync-conflict = Une seule copie d’Anki à la fois peut être synchronisée à votre compte. Veuillez patienter quelques minutes et réessayez.
sync-server-error = AnkiWeb a recontré un problème. Veuillez réessayer dans quelques minutes.
sync-client-too-old = Votre version d’Anki est trop ancienne. Veuillez mettre à jour vers la dernière version pour continuer la synchronisation.
sync-wrong-pass = Votre identifiant Ankiweb ou votre mot de passe sont incorrects. Merci de réessayer.
sync-resync-required = Veuillez synchroniser à nouveau. Si ce message continue d’apparaître, envoyez un message sur le site du support.
sync-must-wait-for-end = Anki est en cours de synchronisation. Veuillez attendre la fin de la synchronisation, puis réessayez.
sync-confirm-empty-download = La collection locale n'a pas de cartes. Voulez-vous en télécharger depuis AnkiWeb?
sync-conflict-explanation =
    Vos paquets ici et sur ​​AnkiWeb diffèrent de telle sorte qu'ils ne peuvent pas être fusionnés ensemble, il est donc nécessaire de remplacer le pont d'un côté avec les platines de l'autre.
    
    Si vous choisissez de télécharger, Anki va télécharger la collection d'AnkiWeb, et tous les changements que vous avez effectués sur votre ordinateur depuis la dernière synchronisation seront perdues.
    
    Si vous choisissez d'uploader, Anki va envoyer votre collection vers AnkiWeb, et toutes les modifications que vous avez apportées sur AnkiWeb ou vos autres appareils depuis la dernière synchronisation pour ces appareils seront perdues.
    
    Après que tous les appareils soient synchronisés, les futurs révisions et les cartes ajoutées peuvent être fusionnées automatiquement.
sync-ankiweb-id-label = Identifiant Anki :
sync-password-label = Mot de passe :
sync-account-required =
    <h1>Compte requis</h1>
    Vous devez posséder un compte pour pouvoir synchroniser votre collection. Merci de <a href="{ $link }">créer un compte</a> gratuitement, puis entrez les informations de connexion ci-dessous.
sync-sanity-check-failed = Veuillez utiliser la fonction "Vérifier la base de données" puis synchroniser. Si le problème persiste, forcer une synchronisation complète dans la fenêtre des préférences.
sync-clock-off = Impossible de synchroniser - Votre horloge n'est pas à la bonne heure.
sync-upload-too-large = Votre fichier de collection est trop large pour être envoyer à AnkiWeb. Vous pouvez réduire sa¶ taille en retirant tous les paquets indésirables (optionnellement en les exportant en premier), et¶ ensuite en utilisant la fonction "Vérifier la base de données" pour réduire la taille du fichier. ({ $details })

## Buttons

sync-media-log-button = Logs des médias
sync-abort-button = Abandonner
sync-download-from-ankiweb = Télécharger depuis Ankiweb
sync-upload-to-ankiweb = Envoyer vers Ankiweb
sync-cancel-button = Annuler

## Normal sync progress

sync-downloading-from-ankiweb = Téléchargement depuis Ankiweb...
sync-uploading-to-ankiweb = Téléversement vers AnkiWeb...
sync-syncing = Synchronisation...
sync-checking = Vérification...
sync-connecting = Connexion...
sync-added-updated-count = Ajoutés/modifiés: { $up }↑ { $down }↓
sync-log-out-button = Déconnexion
