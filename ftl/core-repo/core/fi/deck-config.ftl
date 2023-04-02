### Text shown on the "Deck Options" screen


## Top section

# Used in the deck configuration screen to show how many decks are used
# by a particular configuration group, eg "Group1 (used by 3 decks)"
deck-config-used-by-decks =
    käytössä { $decks ->
        [one] { $decks } pakassa
       *[other] { $decks } pakassa
    }
deck-config-default-name = Oletusarvo
deck-config-title = Pakan valinnat

## Daily limits section

deck-config-daily-limits = Päivittäiset rajat
deck-config-new-limit-tooltip =
    Enintään näin monta uutta korttia esitellään päivän aikana, jos uusia kortteja on saatavilla.
    Koska uusi materiaali lisää kertauksen työmäärää lyhyellä aikavälillä, tämän on hyvä olla enintään kymmenesosa päivittäin kerrattavien korttien enimmäismäärästä.
deck-config-review-limit-tooltip =
    Enintään näin monta kerrattavaa korttia näytetään päivän aikana,
    jos kortteja on valmiina kerrattavaksi.
deck-config-limit-deck-v3 =
    Kun opiskelet pakkaa, jonka sisällä on alipakkoja, kullekin alipakalle asetetut
    rajoitukset säätelevät kyseisestä pakasta nostettavien korttien enimmäismäärää.
    Valitun pakan rajat ohjaavat näytettävien korttien kokonaismäärää.
deck-config-limit-new-bound-by-reviews =
    Kertausten enimmäismäärä vaikuttaa esiteltävien uusien korttien määrään.
    Ajattele esimerkiksi tilannetta, jossa kerrattavien korttien päivittäiseksi enimmäismääräksi on asetettu 200,
    ja 190 korttia odottaa kertausta. Tällöin esiteltäisiin enintään 10 uutta korttia.
    Jos kertausten enimmäismäärä on saavutettu, uusia kortteja ei näytetä.
deck-config-limit-interday-bound-by-reviews =
    Kertausten enimmäismäärä vaikuttaa myös usean päivän aikana opittaviin kortteihin. Kun rajoitusta sovelletaan,
    usean päivän aikana opittavat kortit haetaan ensin, sitten kerrattavat kortit, ja lopuksi uudet kortit.
deck-config-tab-description =
    - `Esiasetus`: Raja jaetaan kaikille tätä esiasetusta käyttäville pakoille.
    - `Tämä pakka`: Raja koskee vain tätä pakkaa.
    - `Vain tänään`: Tee väliaikainen muutos tämän pakan rajaan.

## Daily limit tabs: please try to keep these as short as the English version,
## as longer text will not fit on small screens.

deck-config-shared-preset = Esiasetus
deck-config-deck-only = Tämä pakka
deck-config-today-only = Vain tänään

## New Cards section

deck-config-learning-steps = Oppimisaskeleet
# Please don't translate `1m`, `2d`
-deck-config-delay-hint = Viiveet ovat yleensä minuutteja (esim. `1m`) tai päiviä (esim. `2d`), mutta myös tunteja (esim. `1h`) ja sekunteja (esim. `30s`) voidaan käyttää.
deck-config-learning-steps-tooltip =
    Yksi tai useampi aikaväli, välilyönneillä eroteltuna. Ensimmäistä aikaväliä käytetään,
    kun painat `Uudestaan`-painiketta uutta korttia opiskeltaessa, ja se on oletuksena 1 minuutti.
    `Hyvä`-painike siirtää kortin käyttämään seuraavaa aikaväliä, joka on oletuksena 10 minuuttia.
    Kun korttiin vastataan oikein kaikkien aikavälien ("askeleiden") jälkeen, se siirtyy
    opittavasta kortista kerrattavaksi kortiksi, ja se näytetään toisena päivänä.
    
    { -deck-config-delay-hint }
deck-config-graduating-interval-tooltip = Näin monta päivää on odotettava, ennen kuin kortti voidaan näyttää uudelleen sen jälkeen, kun `Hyvä`-painiketta on painettu viimeisessä oppimisaskeleessa.
deck-config-easy-interval-tooltip = Näin monta päivää on odotettava, ennen kuin kortti näytetään uudelleen sen jälkeen, kun kortti on poistettu opittavista kortteista `Helppo`-painikkeella.
deck-config-new-insertion-order = Lisäysjärjestys
deck-config-new-insertion-order-tooltip =
    Säätää paikkaa (erääntymisluku), johon lisäämäsi uudet kortit sijoitetaan.
    Opiskeltaessa näytetään ensin kortit, joiden erääntymisluku on pieni. Tämän
    asetuksen muuttaminen päivittää automaattisesti uusien korttien nykyisen sijainnin.
deck-config-new-insertion-order-sequential = Peräkkäinen (vanhimmat kortit ensin)
deck-config-new-insertion-order-random = Satunnainen
deck-config-new-insertion-order-random-with-v3 = Kun V3-aikataulutusohjelma on käytössä, on parempi valita "Peräkkäinen" ja muuttaa uusien korttien keräysjärjetystä tämän sijaan.

## Lapses section

deck-config-relearning-steps = Uudelleen oppimisen askeleet
deck-config-relearning-steps-tooltip =
    Nolla tai useampi aikaväli, välilyönneillä eroteltuna. Oletusarvoisesti `Uudestaan`-painikkeen
    painaminen korttia kerrattaessa näyttää sen uudelleen 10 minuutin päästä. Jos aikavälejä
    ei määritellä, kortin aikaväliä muutetaan ilman, että kortti merkitään uudelleen opittavaksi kortiksi.
    
    { -deck-config-delay-hint }
deck-config-leech-threshold-tooltip =
    Näin monta kertaa `Uudelleen`-painiketta voidaan painaa, ennen kuin kortti
    merkitään resurssisyöpöksi. Resurssisyöpöt kortit ovat sellaisia, joiden opiskelu vie
    paljon aikaa, ja kun kortti merkitään resurssisyöpöksi, kannattaa harkita sen muuttamista
    tai poistamista, tai keksiä muistisääntö, joka auttaa sen muistamisessa.
# See actions-suspend-card and scheduling-tag-only for the wording
deck-config-leech-action-tooltip =
    `Liitä vain tunniste`: Lisää "resurssisyöppö" tunniste muistiinpanoon, ja näytä ponnahdusikkuna.
    
    `Hyllytä kortti`: Tunnisteen lisäämisen lisäksi kortti piilotetaan, kunnes se poistetaan
    käsin hyllytetyistä korteista.

## Burying section

deck-config-bury-title = Hautaaminen
deck-config-bury-new-siblings = Hautaa uudet sisarkortit
deck-config-bury-review-siblings = Hautaa kerrattavat sisarkortit
deck-config-bury-interday-learning-siblings = Hautaa usean päivän aikana opittavat sisarkortit
deck-config-bury-new-tooltip =
    Viivästetäänkö muita `uusia` samasta muistiinpanosta tehtyjä kortteja (esim. käänteisiä kortteja,
    vierekkäisiä täyttötehtäviä) seuraavaan päivään.
deck-config-bury-review-tooltip =
    Viivästetäänkö muita `kerrattavia` samasta muistiinpanosta tehtyjä kortteja (esim. käänteisiä kortteja,
    vierekkäisiä täyttötehtäviä) seuraavaan päivään.
deck-config-bury-interday-learning-tooltip =
    Viivästetäänkö muita `opiskeltavia` samasta muistiinpanosta tehtyjä kortteja (esim. käänteisiä kortteja,
    vierekkäisiä täyttötehtäviä) seuraavaan päivään.

## Ordering section

deck-config-ordering-title = Esitysjärjestys
deck-config-new-gather-priority = Uusien korttien keräysjärjestys
deck-config-new-gather-priority-tooltip-2 =
    `Pakan järjestyksen mukaan`: kerää kortteja jokaisesta pakasta järjestyksessä päällimmäisestä alkaen. Kortit kerätään kustakin pakasta nousevassa järjestyksessä (erääntymisluvun mukaan). Jos valitun pakan päivittäinen raja saavutetaan, kerääminen voidaan lopettaa ennen kuin kaikki pakat on tarkistettu. Tämä järjestys on nopein suurissa kokoelmissa, ja sen avulla voit asettaa etusijalle alipakat, jotka ovat lähempänä yläpäätä.
    
    `Nousevassa järjestyksessä`: kerää kortteja erääntymisluvun mukaan nousevassa järjestyksessä, jolloin yleensä vanhimmat kortit kerätään ensin.
    
    `Laskevassa järjestyksessä`: kerää kortteja erääntymisluvun mukaan laskevassa järjestyksessä, jolloin yleensä uusimmat kortit kerätään ensin.
    
    `Satunnaiset muistiinpanot`: kerää kortteja satunnaisesti valituista muistiinpanoista. Kun sisarkorttien hautaaminen on poistettu käytöstä, tämä mahdollistaa sen, että kaikki muistiinpanon kortit näkyvät samassa istunnossa (esim. sekä etupuoli->kääntöpuoli että kääntöpuoli->etupuoli -kortit)
    
    `Satunnaiset kortit`: kerää kortteja täysin satunnaisesti.
deck-config-new-gather-priority-deck = Pakan järjestyksen mukaan
deck-config-new-gather-priority-position-lowest-first = Nousevassa järjestyksessä
deck-config-new-gather-priority-position-highest-first = Laskevassa järjestyksessä
deck-config-new-gather-priority-random-notes = Satunnaiset muistiinpanot
deck-config-new-gather-priority-random-cards = Satunnaiset kortit
deck-config-new-card-sort-order = Uusien korttien lajittelujärjestys
deck-config-new-card-sort-order-tooltip-2 =
    `Korttimallin mukaan`: Näyttää kortit korttimallien mukaisessa järjestyksessä. Jos sisarkorttien hautaaminen on pois käytöstä, tämä varmistaa, että kaikki etupuoli->kääntöpuoli-kortit näkyvät ennen kääntöpuoli->etupuoli-kortteja.
    
    `Keräysjärjestyksen mukaan`: Näyttää kortit täsmälleen siinä järjestyksessä kuin ne on kerätty. Jos sisarkorttien hautaaminen on pois käytöstä, tämä johtaa yleensä siihen, että kaikki muistiinpanon kortit näkyvät peräkkäin.
    
    `Korttimallin mukaan, sitten satunnaisesti`: Kuten `Korttimallin mukaan`, mutta sekoittaa kunkin mallin kortit. Kun tämä yhdistetään nousevaan järjestykseen, tätä voidaan käyttää esimerkiksi vanhimpien korttien näyttämiseen satunnaisessa järjestyksessä.
    
    `Satunnainen muistiinpano, sitten korttimallin mukaan`: Poimii muistiinpanoja satunnaisesti ja näyttää sitten kaikki niiden sisarkortit järjestyksesä.
    
    "Satunnainen": Sekoittaa kerätyt kortit täydellisesti.
deck-config-sort-order-card-template-then-random = Korttimallin mukaan, sitten satunnaisesti
deck-config-sort-order-random-note-then-template = Satunnainen muistiinpano, sitten korttimallin mukaan
deck-config-sort-order-random = Satunnainen
deck-config-sort-order-template-then-gather = Korttimallin mukaan
deck-config-sort-order-gather = Keräysjärjestyksen mukaan
deck-config-new-review-priority = Uusien ja kerrattavien keskinäinen järjestys
deck-config-new-review-priority-tooltip = Milloin uudet kortit näytetään suhteessa kerrattaviin kortteihin.
deck-config-interday-step-priority = Usean päivän aikana opittavien ja kerrattavien keskinäinen järjestys
deck-config-interday-step-priority-tooltip =
    Milloin näytetään opittavat kortit (tai uudelleen opittavat kortit), joita tarvitsee opiskellaan usean päivän ajan.
    
    Kertausten enimmäismäärää sovelletaan aina ensin usean päivän aikana opittaviin kortteihin, ja sitten kerrattaviin. Tämä asetus ohjaa järjestystä, jossa kerätyt kortit näytetään, mutta usean päivän aikana opittavat kortit kerätään aina ensin.
deck-config-review-mix-mix-with-reviews = Sekoita kerrattavien kanssa
deck-config-review-mix-show-after-reviews = Näytä kerrattavien korttien jälkeen
deck-config-review-mix-show-before-reviews = Näytä ennen kerrattavia kortteja
deck-config-review-sort-order = Kerrattavien korttien lajittelujärjestys
deck-config-review-sort-order-tooltip = Oletusarvoisesti asetetaan etusijalle kortit, jotka ovat odottaneet pisimpään, joten jos kerrattavaa on paljon, pisimpään kertausta odottaneet kortit näytetään ensin. Jos kerrattavia kortteja on rästissä paljon, ja niiden läpikäymiseen kuluisi useampi päivä, tai jos haluat nähdä kortit alipakkojen mukaisessa järjestyksessä, vaihtoehtoinen lajittelujärjestys saattaa olla harkitsemisen arvoinen.
deck-config-sort-order-due-date-then-random = Eräpäivän mukaan, sitten satunnaisesti
deck-config-sort-order-due-date-then-deck = Eräpäivän mukaan, sitten pakasta
deck-config-sort-order-deck-then-due-date = Pakan järjestyksen mukaan, sitten eräpäivän mukaan
deck-config-sort-order-ascending-intervals = Kertausvälien mukaan nousevassa järjestyksessä
deck-config-sort-order-descending-intervals = Kertausvälien mukaan laskevassa järjestyksessä
deck-config-sort-order-ascending-ease = Helpoimmasta vaikeimpaan
deck-config-sort-order-descending-ease = Vaikeimmasta helpoimpaan
deck-config-sort-order-relative-overdueness = Suhteellinen erääntyneisyys
deck-config-display-order-will-use-current-deck = Anki käyttää sen pakan esitysjärjestystä, jonka valitset opiskeltavaksi, eikä sen mahdollisten alipakkojen esitysjärjestystä.

## Timer section

deck-config-timer-title = Ajastin
deck-config-maximum-answer-secs = Vastauksen enimmäiskesto sekunneissa
deck-config-maximum-answer-secs-tooltip = Yksittäisen kertauksen enimmäiskesto tilastointia varten. Jos vastaus ylittää tämän ajan (esimerkiksi siksi, että lähdit pois näytön ääreltä), kulunut aika tallennetaan asettamasi raja-arvon mukaisesti.
deck-config-show-answer-timer-tooltip = Näytä kertausnäkymässä ajastin, joka laskee, kuinka monta sekuntia käytät kunkin kortin kertaukseen.

## Audio section

deck-config-audio-title = Ääni
deck-config-disable-autoplay = Älä toista ääniä automaattisesti
deck-config-disable-autoplay-tooltip =
    Tämän ollessa käytössä Anki ei toista ääntä automaattisesti.¶
    Äänen voi toistaa manuaalisesti klikkaamalla/napauttamalla äänikuvaketta tai käyttämällä toista ääni -toimintoa.
deck-config-skip-question-when-replaying = Ohita kysymys, kun vastausta toistetaan uudelleen
deck-config-always-include-question-audio-tooltip = Toistetaanko vastauksen lisäksi myös kysymyksen ääni, kun Toista uudelleen -toimintoa käytetään kortin vastauspuolta tarkasteltaessa.

## Advanced section

deck-config-advanced-title = Lisäasetukset
deck-config-maximum-interval-tooltip = Suurin mahdollinen viive kertausten välillä, päivissä mitattuna. Kun kerrattava kortti on saavuttanut tämän rajan, `Vaikea`, `Hyvä` ja `Helppo` antavat kaikki saman viiveen. Mitä lyhyemmäksi asetat tämän, sitä suurempi työmääräsi on.
deck-config-starting-ease-tooltip = Helppouskerroin, jonka uudet kortit saavat aluksi. Oletusarvoisesti `Hyvä`-painikkeen painaminen juuri opitussa kortissa viivästyttää seuraavaa kerausta 2,5-kertaisella viiveellä edelliseen verrattuna.
deck-config-easy-bonus-tooltip = Lisäkerroin, jota sovelletaan kerrattaviin kortteihin, joissa käytät `Helppo`-painiketta.
deck-config-interval-modifier-tooltip = Tätä kerrointa sovelletaan kaikkiin kertauksiin, ja pienillä säädöillä voidaan tehdä Ankin aikataulutusta varovaisemmaksi tai aggressiivisemmaksi. Lue käyttöopas, ennen kuin muutat tätä asetusta.
deck-config-hard-interval-tooltip = Kertausväliin sovellettava kerroin, kun `Vaikea`-painiketta käytetään.
deck-config-new-interval-tooltip = Kertausväliin sovellettava kerroin, kun `Uudelleen`-painiketta käytetään.
deck-config-minimum-interval-tooltip = Kertausvälin vähimmäispituus, kun käytetään `Uudelleen`-painiketta.
deck-config-custom-scheduling = Mukautettu aikataulutus
deck-config-custom-scheduling-tooltip = Vaikuttaa koko kokoelmaan. Käytä omalla vastuulla!

## Adding/renaming

deck-config-add-group = Lisää asetusmalli
deck-config-name-prompt = Nimi
deck-config-rename-group = Nimeä asetusmalli uudelleen
deck-config-clone-group = Tee asetusmallista kopio

## Removing

deck-config-remove-group = Poista asetusmalli
deck-config-will-require-full-sync = Pyydetty muutos edellyttää yksisuuntaista synkronointia. Jos olet tehnyt muutoksia toisella laitteella etkä ole vielä synkronoinut niitä tähän laitteeseen, tee se ennen kuin ennen kuin jatkat.
deck-config-confirm-remove-name = Poistetaanko { $name }?

## Other Buttons

deck-config-save-button = Tallenna
deck-config-save-to-all-subdecks = Tallenna kaikkiin alipakkoihin
deck-config-revert-button-tooltip = Palauta tämä asetus oletusarvoonsa.

## These strings are shown via the Description button at the bottom of the
## overview screen.

deck-config-description-new-handling = Anki 2.1.41+:n mukainen käsittelytapa
deck-config-description-new-handling-hint =
    Käsittelee syötettä markdownina ja puhdistaa HTML-syötteen. Kun tämä on käytössä,
    kortin kuvaus näytetään myös onnitteluruudussa.
    Markdown näkyy tekstinä Anki 2.1.40:ssä ja sitä vanhemmissa versioissa.

## Warnings shown to the user

deck-config-daily-limit-will-be-capped =
    Yläpakan raja on { $cards ->
        [one] { $cards } kortti
       *[other] { $cards } korttia
    }, ja se ohittaa tämän rajoituksen.
deck-config-reviews-too-low =
    Jos joka päivä lisätään { $cards ->
        [one] { $cards } uusi kortti
       *[other] { $cards } uutta korttia
    }, kertausten enimmäismäärän tulisi olla vähintään { $expected }
deck-config-learning-step-above-graduating-interval = Valmistumisen jälkeisen kertausvälin tulisi olla vähintään yhtä pitkä kuin viimeisen oppimisaskeleen.
deck-config-good-above-easy = Helpon kortin kertausvälin tulisi olla vähintään yhtä pitkä kuin valmistumisen jälkeisen kertausvälin.
deck-config-relearning-steps-above-minimum-interval = Vähimmäiskertausvälin tulisi olla ainakin yhtä suuri kuin viimeisen uudelleen oppimisen askeleen.
deck-config-maximum-answer-secs-above-recommended = Anki ajoittaa kertaukset tehokkaammin, kun pidät kun pidät kysymykset lyhyinä.

## Selecting a deck

deck-config-which-deck = Minkä pakan haluaisit?

## NO NEED TO TRANSLATE. These strings have been replaced with new versions, and will be removed in the future.

