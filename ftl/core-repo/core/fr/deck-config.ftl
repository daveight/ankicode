### Text shown on the "Deck Options" screen


## Top section

# Used in the deck configuration screen to show how many decks are used
# by a particular configuration group, eg "Group1 (used by 3 decks)"
deck-config-used-by-decks =
    utilisé par { $decks ->
        [one] { $decks } paquet
       *[other] { $decks } paquets
    }
deck-config-default-name = Par défaut
deck-config-title = Options du paquet

## Daily limits section

deck-config-daily-limits = Limites journalières
deck-config-new-limit-tooltip =
    Le nombre maximal de nouvelles cartes pouvant être introduites par jour (si de nouvelles cartes sont disponibles).
    Des cartes inédites peuvent augmenter votre charge de travail à court-terme, donc vous devriez éviter d'en introduire chaque jour plus de 10% de votre quota de révisions.
deck-config-review-limit-tooltip = Le nombre maximal de cartes déjà vues pouvant être révisées par jour (si des cartes doivent être révisées).
deck-config-limit-deck-v3 = Quand vous étudiez un paquet qui a des sous-paquets, les limites de chaque sous-paquet fixent le nombre maximal de cartes tirées de ce paquet. Les limites du paquet sélectionné fixent le nombre total de cartes qui seront montrées.
deck-config-limit-new-bound-by-reviews =
    La limite de révision influence la nouvelle limite. Par exemple, si la limite de révision est
    fixée à 200, et que vous avez 190 révisions en attente, un maximum de 10 nouvelles cartes seront
    introduites. Si la limite de révision est atteinte, aucune nouvelle carte ne sera
    montrée.
deck-config-limit-interday-bound-by-reviews = La limite de révision journalière affecte aussi les cartes en apprentissage interjournalier. Quand la limite est appliquée, les cartes en apprentissage interjournalier sont collectées en premier, puis celles à réviser, et enfin les nouvelles cartes.
deck-config-tab-description =
    - `Préréglage`: La limite est partagée avec tous les paquets utilisant ce préréglage.
    - `Ce paquet`: La limite est spécifique à ce paquet.
    - `Juste aujourd'hui`: Modification temporaire de la limite de ce paquet.

## Daily limit tabs: please try to keep these as short as the English version,
## as longer text will not fit on small screens.

deck-config-shared-preset = Préréglage
deck-config-deck-only = Ce paquet
deck-config-today-only = Juste aujourd'hui

## New Cards section

deck-config-learning-steps = Étapes d'apprentissage
# Please don't translate `1m`, `2d`
-deck-config-delay-hint = Les délais peuvent être en minutes (par ex. `5m`), ou en jours (par ex. `2d`), mais les heures (par ex. `1h`) ou les secondes (par ex. `30s`) sont également valides.
deck-config-learning-steps-tooltip = Un ou plusieurs délais, séparés par des espaces. Le premier délai (par défaut 1 minute) sera appliqué quand vous noterez une nouvelle carte comme étant `À revoir`. Le bouton `Correct` passera à l'étape suivante (par défaut 10 minutes). Une fois ces étapes franchies, la carte deviendra une carte de révision, et apparaîtra un autre jour. { -deck-config-delay-hint }
deck-config-graduating-interval-tooltip = Le nombre de jours à attendre avant de revoir une carte, si le bouton `Correct` est pressé à l'étape finale d'apprentissage.
deck-config-easy-interval-tooltip = Le nombre de jours à attendre avant de revoir une carte, si le bouton `Facile` est pressé pour l'enlever immédiatement de l'apprentissage.
deck-config-new-insertion-order = Ordre d'insertion
deck-config-new-insertion-order-tooltip = Contrôle la position (date d'échéance) assignée aux nouvelles cartes que vous ajoutez. Les cartes avec une plus faible position seront montrées en premier pendant l'étude. Changer cette option va automatiquement modifier la position existante des nouvelles cartes.
deck-config-new-insertion-order-sequential = Séquentiel (les plus anciennes cartes d'abord)
deck-config-new-insertion-order-random = Aléatoire
deck-config-new-insertion-order-random-with-v3 = Avec le planificateur v3, il est préférable de laisser ce paramètre en séquentiel, et d'ajuster plutôt le nouvel ordre de rassemblement des cartes.

## Lapses section

deck-config-relearning-steps = Étapes de ré-apprentissage
deck-config-relearning-steps-tooltip = Aucun ou plusieurs délais, séparés par des espaces. Par défaut, presser le bouton 'À revoir' d'une carte à réviser l'affichera à nouveau 10 minutes plus tard. Si aucun délai n'a été fourni, la carte aura son intervalle modifié, sans entrer en réapprentissage.  { -deck-config-delay-hint }
deck-config-leech-threshold-tooltip = Le nombre de fois où il faut appuyer sur `À revoir` sur une carte à réviser avant qu'elle ne soit considérée comme une « sangsue ». Les sangsues sont des cartes qui vous font perdre beaucoup de temps, et lorsqu'une carte est marquée comme telle, il peut être opportun de la réécrire, de la supprimer, ou de chercher un moyen mnémotechnique pour mieux s'en souvenir.
# See actions-suspend-card and scheduling-tag-only for the wording
deck-config-leech-action-tooltip =
    `Taguer` : Ajoute un tag « sangsue » à la note, et affiche une pop-up.
    `Suspendre la carte` : En plus de taguer la note, cache la carte jusqu'à ce qu'elle soit manuellement remise en jeu.

## Burying section

deck-config-bury-title = Enfouissement
deck-config-bury-new-siblings = Enfouir les nouvelles cartes sœurs
deck-config-bury-review-siblings = Enfouir les cartes sœurs à réviser
deck-config-bury-interday-learning-siblings = Enfouir les cartes d'apprentissage interjournalier
deck-config-bury-tooltip = Dans quelle mesure les autres cartes liées à la même note (par ex. cartes inversées, mots de textes à trous adjacents) doivent être retardées jusqu'au lendemain.

## Ordering section

deck-config-ordering-title = Ordre d'Affichage
deck-config-new-gather-priority = Ordre de collecte des nouvelles cartes
deck-config-new-gather-priority-tooltip-2 =
    `Paquet` : rassemble les cartes de chaque paquet dans l'ordre, en commençant par le haut. Les cartes de chaque paquet sont rassemblées par ordre croissant. Si la limite quotidienne du paquet choisi est atteinte, la collecte peut s'arrêter avant que tous les paquets aient été vérifiés. Cet ordre est le plus rapide pour les grandes collections, et permet de donner la priorité aux sous-paquets qui sont plus proches du sommet.
    `Ordre croissant` : rassemble les cartes par position croissante (échéance), c.à.d. généralement les plus anciennes ajoutées en premier.
    `Ordre décroissant` : rassemble les cartes par position décroissante (échéance), c.à.d. généralement les plus récentes ajoutées en premier.
    `Notes aléatoires` : rassemble les cartes de notes choisies au hasard. Si l'enfouissement des cartes sœurs est désactivé, cela permet à toutes les cartes d'une même note d'apparaître dans une session (par ex. à la fois une carte recto->verso et une carte verso->recto)
    `Cartes aléatoires` : rassemble les cartes complètement aléatoirement
deck-config-new-gather-priority-deck = Paquet
deck-config-new-gather-priority-position-lowest-first = Ordre croissant
deck-config-new-gather-priority-position-highest-first = Ordre décroissant
deck-config-new-gather-priority-random-notes = Notes aléatoires
deck-config-new-gather-priority-random-cards = Cartes aléatoires
deck-config-new-card-sort-order = Ordre de classement des nouvelles cartes
deck-config-new-card-sort-order-tooltip-2 =
    `Par type de carte`: Affiche les cartes par ordre de numéro de type de carte. Si l'enfouissement des cartes sœurs est désactivé, ceci permet de s'assurer que toutes les cartes recto→verso seront vues avant les cartes verso→recto. C'est utile pour avoir toutes les cartes d'une même note présentées dans une même session, sans être trop rapprochées les unes des autres.
    
    `Par ordre d'ajout`: Présente les cartes dans l'ordre exact dans lequel elles furent ajoutées. Si l'enfouissement des cartes sœurs est désactivé, cela résultera en ce que toutes les cartes d'une même note soit vues les unes après les autres.
    
    `Par type de carte, puis aléatoire`: Comme `Par type de carte`, mais mélange les cartes de chaque numéro de type de carte. Si vous utilisez `Ordre croissant` pour rassembler les les plus vieilles cartes, vous pourriez utiliser cette option pour voir ces cartes dans un ordre aléatoire, tout en s'assurant que les cartes d'une même note ne soient pas trop proches les unes des autres.
    
    `Notes aléatoires, puis par type de carte`: Choisit des notes au hasard, puis montre toutes leurs carte sœurs dans l'ordre.
    
    `Aléatoire`: Mélange complètement les cartes rassemblées.
deck-config-sort-order-card-template-then-random = Modèle de carte, puis aléatoirement
deck-config-sort-order-random-note-then-template = Carte aléatoire. puis type de carte
deck-config-sort-order-random = Aléatoirement
deck-config-sort-order-template-then-gather = Modèle de carte, puis dans l'ordre de la collecte
deck-config-sort-order-gather = Dans l'ordre collectée
deck-config-new-review-priority = Ordre nouvelle/à réviser
deck-config-new-review-priority-tooltip = Quand montrer les nouvelles cartes par rapport aux cartes de révision.
deck-config-interday-step-priority = Ordre d'apprentissage/de révision interjournalier
deck-config-interday-step-priority-tooltip =
    Quand montrer les cartes de (ré)apprentissage qui franchissent une limite de jour.
    
    La limite de révision est toujours appliquée en premier lieu aux cartes d'apprentissage inter-journalières, et
    ensuite aux révisions. Cette option permet de contrôler l'ordre dans lequel les cartes rassemblées sont affichées,
    mais les cartes d'apprentissage inter-journalier seront toujours rassemblées en premier.
deck-config-review-mix-mix-with-reviews = Mélanger avec les cartes à réviser
deck-config-review-mix-show-after-reviews = Afficher après les cartes à réviser
deck-config-review-mix-show-before-reviews = Afficher avant les cartes à réviser
deck-config-review-sort-order = Ordre de classement des cartes à réviser
deck-config-review-sort-order-tooltip =
    L'ordre par défaut donne la priorité aux cartes qui ont été en attente le plus longtemps, de sorte que
    si vous avez un retard dans vos révisions, celles qui attendent depuis le plus longtemps apparaîtront
    en premier. Si vous avez un retard important qui prendra plus que quelques jours à
    résorber, ou si vous souhaitez voir les cartes dans l'ordre des sous-paquets, vous pouvez préférer les ordres de tri alternatifs.
deck-config-sort-order-due-date-then-random = Date d'échéance, puis aléatoirement
deck-config-sort-order-due-date-then-deck = Date d'échéance, puis dans l'ordre du paquet
deck-config-sort-order-deck-then-due-date = Dans l'ordre du paquet, puis par date d'échéance
deck-config-sort-order-ascending-intervals = Intervalles croissants
deck-config-sort-order-descending-intervals = Intervalles décroissants
deck-config-sort-order-ascending-ease = Facilité croissante
deck-config-sort-order-descending-ease = Facilité décroissante
deck-config-sort-order-relative-overdueness = Échéance dépassée relative
deck-config-display-order-will-use-current-deck =
    Anki va utiliser l'ordre d'affichage du paquet que vous¶
    avez sélectionné pour étudier, et non ceux des sous-paquets qu'il peut avoir.

## Timer section

deck-config-timer-title = Chronomètre
deck-config-maximum-answer-secs = Temps de réponse maximum
deck-config-maximum-answer-secs-tooltip =
    Le nombre maximum de secondes à enregistrer pour une seule révision. Si une réponse
    dépasse ce temps (parce que vous vous êtes éloigné de l'écran par exemple),
    le temps pris sera enregistré comme la limite que vous avez fixée.
deck-config-show-answer-timer-tooltip =
    Dans l'écran de révision, affichez une minuterie qui compte le nombre de secondes que vous¶
    passez pour revoir chaque carte.

## Audio section

deck-config-audio-title = Audio
deck-config-disable-autoplay = Ne pas lire les fichiers audio automatiquement
deck-config-skip-question-when-replaying = Sauter la question quand la réponse est rejouée
deck-config-always-include-question-audio-tooltip =
    Si le son de la question doit être inclus lorsque l'action Replay est¶
    utilisée pendant que l'on regarde le côté réponse d'une carte.

## Advanced section

deck-config-advanced-title = Avancé
deck-config-maximum-interval-tooltip =
    Le nombre maximum de jours d'attente pour une carte de révision. Lorsque les révisions ont
    atteint la limite, `difficile`, `correct` et `facile` donneront tous le même délai.
    Plus vous raccourcissez ce délai, plus votre charge de travail sera importante.
deck-config-starting-ease-tooltip =
    Le multiplicateur de facilité avec lequel les nouvelles cartes commencent. Par défaut, le bouton "Bien" d'une carte¶
    nouvellement apprise retardera le prochain examen de 2,5 fois le délai précédent.
deck-config-easy-bonus-tooltip = Un facteur supplémentaire qui est appliqué à l'intervalle d'une carte à réviser quand on répond¶ 'Facile'.
deck-config-interval-modifier-tooltip = Ce multiplicateur est appliqué à tous les examens, et des ajustements mineurs peuvent être utilisés pour rendre Anki plus conservateur ou agressif dans son ordonnancement. Veuillez consulter le manuel avant de modifier cette option.
deck-config-hard-interval-tooltip = Le facteur appliqué à l'intervalle d'une carte à réviser quand on répond 'Difficile'.
deck-config-new-interval-tooltip = Le facteur appliqué à l'intervalle d'une carte à réviser quand on répond 'À revoir'.
deck-config-minimum-interval-tooltip = L'intervalle minimum donné à une carte à réviser après avoir répondu 'À revoir'.
deck-config-custom-scheduling = Planification personnalisée
deck-config-custom-scheduling-tooltip = Cela affecte la totalité de la collection. À utiliser à vos risques et périls !

## Adding/renaming

deck-config-add-group = Ajouter un préréglage
deck-config-name-prompt = Nom
deck-config-rename-group = Renommer la présélection
deck-config-clone-group = clonage Présélection

## Removing

deck-config-remove-group = supprimer la présélection
deck-config-will-require-full-sync = La modification demandée nécessitera une synchronisation à sens unique. Si vous avez effectué des modifications sur un autre appareil et que vous ne les avez pas encore synchronisées avec cet appareil, veuillez le faire avant de poursuivre.
deck-config-confirm-remove-name = Supprimer { $name } ?

## Other Buttons

deck-config-save-button = Sauvegarder
deck-config-save-to-all-subdecks = Sauvegarder pour tout les sous-paquets
deck-config-revert-button-tooltip = Restaurer les paramètres par défauts.

## These strings are shown via the Description button at the bottom of the
## overview screen.

deck-config-description-new-handling = Gestion d'Anki 2.1.41+
deck-config-description-new-handling-hint =
    Traite les entrées comme du markdown, et nettoie les entrées HTML. Lorsqu'elle est activée, la description s'affichera également sur l'écran de félicitations.
    Markdown apparaîtra comme du texte sur Anki 2.1.40 et plus.

## Warnings shown to the user

deck-config-daily-limit-will-be-capped =
    Un paquet parent à une limite de { $cards ->
        [one] { $cards } carte
       *[other] { $cards } cartes
    }, ce qui va outrepasser cette limite.
deck-config-reviews-too-low =
    Pour rajouter { $cards ->
        [one] { $cards } carte inédite par jour
       *[other] { $cards } cartes inédites par jour
    }, vous devriez en réviser au moins { $expected } déjà vues.
deck-config-learning-step-above-graduating-interval = L'intervalle de graduation doit être au moins aussi long que votre dernière étape d'apprentissage.
deck-config-good-above-easy = L'intervalle facile doit être au moins aussi long que l'intervalle gradué.
deck-config-relearning-steps-above-minimum-interval = L'intervalle minimal doit être au moins aussi long que votre étape finale de réapprentissage.
deck-config-maximum-answer-secs-above-recommended = Anki peut programmer vos révisions plus efficacement lorsque vous gardez chaque question courte.

## Selecting a deck

deck-config-which-deck = Quel paquet voulez vous ?

## NO NEED TO TRANSLATE. These strings have been replaced with new versions, and will be removed in the future.

