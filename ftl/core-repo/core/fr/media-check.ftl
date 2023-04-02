## Shown at the top of the media check screen

media-check-window-title = Vérification des médias
# the number of files, and the total space used by files
# that have been moved to the trash folder. eg,
# "Trash folder: 3 files, 3.47MB"
media-check-trash-count =
    Corbeille : { $count ->
        [one] 1 fichier, { $megs } Mo
       *[other] { $count } fichiers, { $megs } Mo
    }
media-check-missing-count =
    { $count ->
        [one] Fichier manquant : { $count }
       *[other] Fichiers manquants : { $count }
    }
media-check-unused-count =
    { $count ->
        [one] Fichier inutilisé : { $count }
       *[other] Fichiers inutilisés : { $count }
    }
media-check-renamed-count =
    { $count ->
        [one] Fichier renommé : { $count }
       *[other] Fichiers renommés : { $count }
    }
media-check-oversize-count =
    { $count ->
        [one] Fichier de plus de 100 Mo : { $count }
       *[other] Fichiers de plus de 100 Mo : { $count }
    }
media-check-subfolder-count =
    { $count ->
        [one] Sous-fichier : { $count }
       *[other] Sous-fichiers : { $count }
    }

## Shown at the top of each section

media-check-renamed-header = Certains fichiers ont été renommés pour compatibilité :
media-check-oversize-header = Les fichiers de plus de 100 Mo ne peuvent être synchronisés avec AnkiWeb.
media-check-subfolder-header = Les fichiers contenus dans le dossier des médias ne sont pas pris en charge.
media-check-missing-header = Utilisé par des cartes mais manquant dans le dossier média :
media-check-unused-header = Les fichiers suivant ont été trouvés dans le dossier des médias, mais ne semblent être utilisés sur aucune carte :
media-check-template-references-field-header =
    Anki ne peut pas détecter les fichiers quand vous utilisez { "{{Field}}" } références dans les tags media/LaTeX. Les tags media/LaTeX doivent être placés sur des notes individuelles.
    
    Modèles faisant référence :

## Shown once for each file

media-check-renamed-file = { $old } renommé en { $new }
media-check-oversize-file = Plus de 100 Mo : { $filename }
media-check-subfolder-file = Fichier : { $filename }
media-check-missing-file = Manquant : { $filename }
media-check-unused-file = Inutilisé : { $filename }

##

# Eg "Basic: Card 1 (Front Template)"
media-check-notetype-template = { $notetype }: { $card_type } ({ $side })

## Progress

media-check-checked = { $count } médias vérifiés...

## Deleting unused media

media-check-delete-unused-confirm = Supprimer les médias inutilisés ?
media-check-files-remaining =
    { $count ->
        [one] 1 fichier restant.
       *[other] { $count } fichiers restants.
    }
media-check-delete-unused-complete =
    { $count ->
        [one] 1 fichier a été déplacé dans la corbeille.
       *[other] { $count } fichiers ont été déplacés dans la corbeille.
    }
media-check-trash-emptied = La corbeille est désormais vide.
media-check-trash-restored = Les fichiers supprimés ont été restaurés dans le dossier des médias.

## Rendering LaTeX

media-check-all-latex-rendered = Tous les LaTeX ont été rendus.

## Buttons

media-check-delete-unused = Supprimer les fichiers inutilisés
media-check-render-latex = Rendre les LaTeX
# button to permanently delete media files from the trash folder
media-check-empty-trash = Vider la corbeille
# button to move deleted files from the trash back into the media folder
media-check-restore-trash = Restaurer les fichiers supprimés
media-check-check-media-action = Vérifier les médias
