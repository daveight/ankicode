### Text shown on the "Deck Options" screen


## Top section

# Used in the deck configuration screen to show how many decks are used
# by a particular configuration group, eg "Group1 (used by 3 decks)"
deck-config-used-by-decks =
    { $decks ->
        [one] používá 1 balíček
        [few] používají { $decks } balíčky
       *[other] používá { $decks } balíčků
    }
deck-config-default-name = Výchozí
deck-config-title = Možnosti balíčku

## Daily limits section

deck-config-daily-limits = Denní limity
deck-config-new-limit-tooltip =
    Maximální počet nových karet za den, pokud jsou dostupné nové karty.
    Protože nový materiál zvýší Vaši krátkodobou zátěž při opakování, mělo 
    by to obvykle být nejméně 10× menší než limit opakování.
deck-config-review-limit-tooltip =
    Maximální počet opakovaných karet za den,
    jestliže jsou karty připraveny k zopakování.
deck-config-limit-deck-v3 =
    Při studování balíčku, který má podřízené balíčky, limity nastavené pro každý 
    podřízený balíček řídí maximální počet karet vzatých z daného balíčku. 
    Zvolené limity balíčků řídí celkový počet karet, které se zobrazí.
deck-config-limit-new-bound-by-reviews =
    Limit opakování ovlivní limit nových karet. Například, jestliže je limit opakování 
    nastaven na 200, a čeká vás 190 opakování, bude zobrazeno maximálně 10 nových 
    karet. Jestliže se dosáhne limitu opakování, žádné nové karty se nezobrazí.
deck-config-limit-interday-bound-by-reviews =
    Limit opakování také ovlivní učené karty, které překračují do dalšího dne. 
    Když se uplatní limit, karty, které překračují do dalšího dne, jsou nabrány 
    první, poté opakování a nakonec nové karty.
deck-config-tab-description =
    - `Předvolba`:  Limit je sdílen všemi balíčky, které používají tuto předvolbu.
    - `Tento balíček`: Limit je specifický pro tento balíček.
    - `Pouze dnes`: Provede dočasnou změnu limitu tohoto balíčku.

## Daily limit tabs: please try to keep these as short as the English version,
## as longer text will not fit on small screens.

deck-config-shared-preset = Předvolba
deck-config-deck-only = Tento balíček
deck-config-today-only = Pouze dnes

## New Cards section

deck-config-learning-steps = Kroky učení
# Please don't translate `1m`, `2d`
-deck-config-delay-hint = Prodlevy jsou obvykle v minutách (např. `1m`) nebo dnech (např. `2d`), ale hodiny (např `1h`) a sekundy (např. `30s`) jsou také podporovány.
deck-config-learning-steps-tooltip =
    Jedna nebo více prodlev oddělených mezerami. První prodleva se použije,
    když na nové kartě stisknete tlačítko `Znovu`, a ve výchozím nastavení je 1 minuta.
    Tlačítko `Dobré` posune kartu do dalšího kroku, který je ve výchozím nastavení 10 minut.
    Jakmile se projdou všechny kroky, karta se stane opakovanou kartou a 
    objeví se v jiný den. { -deck-config-delay-hint }
deck-config-graduating-interval-tooltip =
    Počet dní, které se čeká, než se karta zobrazí znovu po stisknutí tlačítka `Dobré` 
    během posledního kroku učení.
deck-config-easy-interval-tooltip =
    Počet dní, které se čeká, než se karta zobrazí znovu po stisknutí tlačítka `Snadné`, 
    které okamžitě vyjme kartu z učení.
deck-config-new-insertion-order = Pořadí vkládání
deck-config-new-insertion-order-tooltip =
    Řídí pořadí (ke zkoušení #), v jakém jsou nové karty umístěny, když přidáte nové karty.
    Karty s nižším číslem zkoušení budou zobrazeny první během studia. Změna
    tohoto nastavení automaticky aktualizuje stávající pořadí nových karet.
deck-config-new-insertion-order-sequential = Postupně (nejstarší karty první)
deck-config-new-insertion-order-random = Náhodně
deck-config-new-insertion-order-random-with-v3 =
    S V3 plánovačem je lepší nechat toto nastavení na postupně 
    a upravit místo toho pořadí nabíraní nových karet.

## Lapses section

deck-config-relearning-steps = Kroky znovu učených
deck-config-relearning-steps-tooltip = Žádná nebo více prodlev oddělených mezerami. Ve výchozím nastavení stisknutí tlačítka `Znovu` na opakované kartě zobrazí tuto kartu znovu za 10 minut. Nejsou-li uvedeny žádné prodlevy, kartě se změní interval, aniž by se stala znovu učenou. { -deck-config-delay-hint }
deck-config-leech-threshold-tooltip =
    Počet stisknutí `Znovu` na opakované kartě předtím, než je označena jako 
    pijavice. Pijavice jsou karty, které spotřebovávají hodně času, a když je karta 
    označena jako pijavice, je dobrý nápad ji přepsat, odstranit, nebo se zamyslet 
    nad mnemotechnickou pomůckou, která pomůže si ji zapamatovat.
# See actions-suspend-card and scheduling-tag-only for the wording
deck-config-leech-action-tooltip =
    `Pouze označit štítkem`: Přidá k poznámce štítech „leech“ a zobrazí vyskakovací okno.
    
    `Vyřadit kartu`: Navíc k označení poznámky schová kartu, dokud nebude vyřazení
    ručně zrušeno.

## Burying section

deck-config-bury-title = Přeskakování
deck-config-bury-new-siblings = Odložit nové příbuzné karty na další den
deck-config-bury-review-siblings = Odložit opakované příbuzné karty na další den
deck-config-bury-interday-learning-siblings = Odložit učené příbuzné karty na další den
deck-config-bury-new-tooltip =
    Jestli ostatní `nové` karty stejné poznámky (např. obrácené karty, sousední doplňovačky
    budou odloženy na další den.
deck-config-bury-review-tooltip = Jestli ostatní `opakované` karty stejné poznámky budou odloženy na další den.
deck-config-bury-interday-learning-tooltip =
    Jestli ostatní `učené` karty stejné poznámky s intervalem >1 den 
    budou odloženy na další den.

## Ordering section

deck-config-ordering-title = Pořadí zobrazování
deck-config-new-gather-priority = Pořadí nabírání nových karet
deck-config-new-gather-priority-tooltip-2 =
    `Balíček`: nabírá karty z každého balíčku v pořadí, začíná z vrchu. Karty z každého balíčku jsou
    nabírány ve vzestupném pořadí. Jestliže se dosáhne denního limitu vybraného balíčku, nabírání 
    karet se může zastavit dříve, než byly prověřeny všechny balíčky. Toto řazení je nejrychlejší pro
    velké kolekce a umožňuje upřednostňovat podřízené balíčky, které jsou výše.
    
    `Umístění vzestupně`: nabírá karty podle pozice (ke zkoušení) vzestupně, což je obvykle
    nejstarší přidané jako první.
    
    `Umístění sestupně`: nabírá karty podle pozice (ke zkoušení) sestupně, což je obvykle
    nejnovější přidané jako první.
    
    `Poznámky náhodně`: nabírá karty z náhodně vybraných poznámek. Když je odkládání 
    příbuzných karet zakázáno, umožňuje to vidět všechny karty jedné poznámky v jednom 
    sezení (např. přední a zadní stranu karty)
    
    `Karty náhodně`: nabírá karty zcela náhodně.
deck-config-new-gather-priority-deck = Balíček
deck-config-new-gather-priority-position-lowest-first = Umístění vzestupně
deck-config-new-gather-priority-position-highest-first = Umístění sestupně
deck-config-new-gather-priority-random-notes = Poznámky náhodně
deck-config-new-gather-priority-random-cards = Karty náhodně
deck-config-new-card-sort-order = Pořadí řazení nových karet
deck-config-new-card-sort-order-tooltip-2 =
    `Typ karty`: Zobrazuje karty v pořadí čísel typu karty. Jestliže je zakázáno odkládání příbuzných 
    karet, toto zajistí, že se všechny přední strany karet zobrazí dříve, než zadní strany karet.
    Toto je užitečné, když se mají všechny karty stejné poznámky zobrazovat ve stejném sezení, ale 
    ne příliš blízko u sebe.
    
    `V pořadí nabrání`: Zobrazuje karty přesně tak, jak byly nabrány. Jestliže je zakázáno odkládání příbuzných 
    karet, toto obvykle vede k tomu, že se všechny karty jedné poznámky zobrazí jedna po druhé.
    
    `Typ karty, poté náhodně`: Stejně jako `Typ karty`, ale zamíchá karty každého čísla typu karet. 
    Jestliže použijete `Umístění vzestupně`, aby se nabraly nejstarší karty, mohli byste použít toto 
    nastavení, abyste viděli tyto karty v náhodném pořadí, ale aby bylo stále zajištěno, že karty stejné 
    poznámky nebudou příliš blízko u sebe.
    
    `Poznámky náhodně, poté typ karty`: Vybírá poznámky náhodně, poté zobrazí všechny jejich 
    příbuzné karty v pořadí.
    
    `Náhodně`: Zcela zamíchá nabrané karty.
deck-config-sort-order-card-template-then-random = Typ karty, poté náhodně
deck-config-sort-order-random-note-then-template = Poznámky náhodně, poté typ karty
deck-config-sort-order-random = Náhodně
deck-config-sort-order-template-then-gather = Typ karty
deck-config-sort-order-gather = V pořadí nabrání
deck-config-new-review-priority = Pořadí nové/opakování
deck-config-new-review-priority-tooltip = Kdy zobrazit nové karty ve vztahu k opakovaným kartám.
deck-config-interday-step-priority = Pořadí učení/opakování mezi dny
deck-config-interday-step-priority-tooltip =
    Kdy zobrazit (znovu) učené karty, které překračují do dalšího dne.
    
    Limit opakování se vždy použije jako první na učené karty, které překračují do dalšího 
    dne, a poté na opakování. Tato volba řídí pořadí, v jakém jsou nabrané karty zobrazeny, 
    ale učené karty překračující do dalšího dne budou vždy nabrány jako první.
deck-config-review-mix-mix-with-reviews = Smíchat s opakováním
deck-config-review-mix-show-after-reviews = Zobrazit po opakování
deck-config-review-mix-show-before-reviews = Zobrazit před opakováním
deck-config-review-sort-order = Pořadí řazení opakování
deck-config-review-sort-order-tooltip =
    Výchozí řazení upřednostňuje karty, které čekaly nejdéle, takže jestliže máte 
    nevyřízená opakování, nejdéle čekající karty se zobrazí první. Jestliže máte 
    velké množství nevyřízených opakování, která zaberou více, než několik málo 
    dní, nebo si přejte vidět karty v pořadí podřízených balíčků, můžete shledat 
    alternativní pořadí řazení vhodnější.
deck-config-sort-order-due-date-then-random = Datum zkoušení, poté náhodně
deck-config-sort-order-due-date-then-deck = Datum zkoušení, poté balíček
deck-config-sort-order-deck-then-due-date = Balíček, poté datum zkoušení
deck-config-sort-order-ascending-intervals = Intervaly vzestupně
deck-config-sort-order-descending-intervals = Intervaly sestupně
deck-config-sort-order-ascending-ease = Snadnost vzestupně
deck-config-sort-order-descending-ease = Snadnost sestupně
deck-config-sort-order-relative-overdueness = Relativní zpožděnost
deck-config-display-order-will-use-current-deck =
    Anki použije pořadí zobrazování balíčku, který jste vybrali 
    ke studiu, a ne podřízených balíčků, které může mít.

## Timer section

deck-config-timer-title = Časovač
deck-config-maximum-answer-secs = Maximální čas odpovědi v sekundách
deck-config-maximum-answer-secs-tooltip =
    Maximální počet sekund, které se zaznamenají u jednoho opakování. 
    Jestliže odpověď přesahuje tento čas (protože například odejdete od 
    obrazovky), bude zaznamenán nastavený limit.
deck-config-show-answer-timer-tooltip =
    Na obrazovce opakování zobrazit časovač, který počítá sekundy 
    strávené opakováním každé karty.

## Audio section

deck-config-audio-title = Zvuk
deck-config-disable-autoplay = Nepřehrávat zvuk automaticky
deck-config-disable-autoplay-tooltip =
    Je-li povoleno, Anki nepřehraje zvuk automaticky.
    Je možné ho přehrát ručně kliknutím/stisknutím ikony zvuku nebo použitím akce přehrát zvuk.
deck-config-skip-question-when-replaying = Přeskočit otázku, když se přehrává odpověď
deck-config-always-include-question-audio-tooltip =
    Zda má být zvuk v otázce přehrán, když se zvuk přehrává znovu během 
    prohlížení strany karty s odpovědí.

## Advanced section

deck-config-advanced-title = Pokročilé
deck-config-maximum-interval-tooltip =
    Maximální počet dní, po které bude opakovaná karta čekat. Když opakování 
    dosáhne limitu, `Těžké`, `Dobré` a `Snadné` udělí stejnou prodlevu. 
    Čím kratší tento limit bude, tím větší bude pracovní zátěž.
deck-config-starting-ease-tooltip =
    Snadnost coby násobitel, se kterým nové karty začínají. Ve výchozím nastavení, 
    tlačítko `Dobré` na nově naučené kartě přesune následující opakování 
    o 2,5 × předchozí prodleva.
deck-config-easy-bonus-tooltip =
    Extra násobitel, který se aplikuje na interval opakovaných karet, když je 
    hodnotíte jako `Snadné`.
deck-config-interval-modifier-tooltip =
    Tento násobitel se aplikuje na všechna opakování a menší přenastavení lze 
    použít k tomu, aby byl Anki více konzervativní nebo agresivní ve svém 
    plánování. Prosím prostudujte si manuál před změnou tohoto nastavení.
deck-config-hard-interval-tooltip = Násobitel, který se aplikuje na interval opakování, když se odpoví `Těžké`.
deck-config-new-interval-tooltip = Násobitel, který se aplikuje na interval opakování, když se odpoví `Znovu`.
deck-config-minimum-interval-tooltip = Minimální interval daný opakované kartě po odpovědi `Znovu`.
deck-config-custom-scheduling = Vlastní plánování
deck-config-custom-scheduling-tooltip = Ovlivní celou kolekci. Používejte na vlastní nebezpečí!

## Adding/renaming

deck-config-add-group = Přidat nastavení
deck-config-name-prompt = Název
deck-config-rename-group = Přejmenovat nastavení
deck-config-clone-group = Klonovat nastavení

## Removing

deck-config-remove-group = Odstranit nastavení
deck-config-will-require-full-sync = Požadovaná změna způsobí kompletní nahrání databáze na server při příští synchronizaci Vaší kolekce. Máte-li opakování nebo jiné změny na jiném zařízení, které ještě nebyly synchronizovány, budou ztraceny.
deck-config-confirm-remove-name = Odstranit { $name }?

## Other Buttons

deck-config-save-button = Uložit
deck-config-save-to-all-subdecks = Uložit pro všechny podřízené balíčky
deck-config-revert-button-tooltip = Obnovit toto nastavení na výchozí hodnotu.

## These strings are shown via the Description button at the bottom of the
## overview screen.

deck-config-description-new-handling = Anki 2.1.41+ zpracování
deck-config-description-new-handling-hint =
    Považuje vstup za markdown a čistí HTML vstup. Když je 
    povoleno, popis se také zobrazí na obrazovce gratulace.
    Markdown se objeví jako text v Anki 2.1.40 a méně.

## Warnings shown to the user

deck-config-daily-limit-will-be-capped =
    Rodičovský balíček má limit { $cards ->
        [one] { $cards } karta
        [few] { $cards } karty
       *[other] { $cards } karet
    }, což přepíše tento limit.
deck-config-reviews-too-low =
    Když se { $cards ->
        [one] přidává { $cards } nová karta každý den
        [few] přidávají { $cards } nové karty každý den
       *[other] přidává { $cards } nových karet každý den
    }, limit opakování by měl být nejméně { $expected }.
deck-config-learning-step-above-graduating-interval = Interval absolvování by měl být nejméně stejně dlouhý jako poslední krok učení.
deck-config-good-above-easy = Interval pro snadné by měl být nejméně stejně dlouhý jako interval absolvování.
deck-config-relearning-steps-above-minimum-interval = Minimální interval chyby by měl být nejméně stejně dlouhý jako poslední krok znovu učených.
deck-config-maximum-answer-secs-above-recommended = Anki může plánovat Vaše opakování účinněji, když máte krátké otázky.

## Selecting a deck

deck-config-which-deck = Který balíček požadujete?

## NO NEED TO TRANSLATE. These strings have been replaced with new versions, and will be removed in the future.

