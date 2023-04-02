importing-failed-debug-info = Tuonti epäonnistui. Vianmääritystietoa:
importing-aborted = Keskeytetty: { $val }
importing-added-duplicate-with-first-field = Lisätty ensimmäisen kentän kaksoiskappale: { $val }
importing-all-supported-formats = Kaikki tuetut tiedostotyypit { $val }
importing-allow-html-in-fields = Salli HTML kentissä
importing-anki-files-are-from-a-very = .anki-tiedostot ovat todella vanhasta Ankin versiosta. Voit tuoda ne Anki 2.0 -versiolla, jonka voit ladata Ankin verkkosivulta.
importing-anki2-files-are-not-directly-importable = .anki2-tiedostoja ei voida tuoda suoraan – tuo sen sijaan saamasi .apkg- tai .zip-tiedosto.
importing-appeared-twice-in-file = Esiintyi kahdesti tiedostossa: { $val }
importing-by-default-anki-will-detect-the = Anki yrittää tunnistaa erotinmerkin automaattisesti. Jos menee pieleen, voit itse syöttää erottimen tähän (pilkku, puolipiste, jne.). Tab on \t
importing-change = Muuta
importing-colon = Kaksoispiste
importing-comma = Pilkku
importing-empty-first-field = Tyhjä ensimmäinen kenttä: { $val }
importing-field-separator = Kenttien erotin
importing-field-mapping = Kenttäliitokset
importing-field-of-file-is = Tiedoston <b>{ $val }.</b> kenttä on:
importing-fields-separated-by = Kenttien erotin: { $val }
importing-file-must-contain-field-column = Tiedoston tulee sisältää vähintään yksi sarake, joka vastaa jotakin muistiinpanon kenttää.
importing-file-version-unknown-trying-import-anyway = Tuntematon tiedostoversio. Yritetään tuontia siitä huolimatta.
importing-first-field-matched = Ensimmäinen kenttä täsmää: { $val }
importing-identical = Identtinen
importing-ignore-field = Jätä kenttä huomioimatta
importing-ignore-lines-where-first-field-matches = Älä huomioi rivejä, joiden ensimmäinen kenttä vastaa olemassaolevaa muistiinpanoa
importing-ignored = <ei huomioitu>
importing-import-even-if-existing-note-has = Tuo vaikka olemassa olevassa muistiinpanossa on sama ensimmäinen kenttä
importing-import-options = Tuontiasetukset
importing-importing-complete = Tuonti valmis.
importing-invalid-file-please-restore-from-backup = Viallinen tiedosto. Palauta aikaisempi versio varmuuskopiosta.
importing-map-to = Liitä kenttään { $val }
importing-map-to-tags = Liitä tunnisteisiin
importing-mapped-to = liitetty kenttään <b>{ $val }</b>
importing-mapped-to-tags = liitetty <b>tunnisteisiin</b>
importing-mnemosyne-20-deck-db = Mnemosyne 2.0 -pakka (*.db)
importing-multicharacter-separators-are-not-supported-please = Monimerkkisiä erottimia ei tueta. Anna erottimeksi vain yksi merkki.
importing-notes-added-from-file = Muistiinpanoja lisätty tiedostosta: { $val }
importing-notes-found-in-file = Muistiinpanoja löydetty tiedostosta: { $val }
importing-notes-skipped-as-theyre-already-in = Muistiinpanoja, jotka ohitettiin, koska ne ovat jo kokoelmassasi: { $val }
importing-notes-that-could-not-be-imported = Muistiinpanoja, joita ei voitu tuoda, koska muistiinpanotyyppi on muuttunut: { $val }
importing-notes-updated-as-file-had-newer = Muistiinpanoja, jotka päivitettiin, koska tiedostossa oli uudempi versio: { $val }
importing-packaged-anki-deckcollection-apkg-colpkg-zip = Pakattu Anki-pakka/kokoelma (*.apkg *.colpkg *.zip)
importing-pauker-18-lesson-paugz = Pauker 1.8 oppitunti (*.pau.gz)
# the '|' character
importing-pipe = Putki
importing-rows-had-num1d-fields-expected-num2d = '{ $row }':ssa oli { $found } kenttää, pitäisi olla { $expected }
importing-selected-file-was-not-in-utf8 = Valittu tiedosto ei ollut UTF-8-muodossa. Katso käyttöohjeen tuonti-osio.
importing-semicolon = Puolipiste
importing-skipped = Ohitettu
importing-supermemo-xml-export-xml = Supermemo XML -vienti (*.xml)
importing-tab = Sarkain
importing-tag-modified-notes = Merkitse muokatut muistiinpanot tunnisteella:
importing-text-separated-by-tabs-or-semicolons = Sarkaimilla tai puolipisteillä eroteltu teksti (*)
importing-the-first-field-of-the-note = Muistiinpanotyypin ensimmäinen kenttä on liitettävä.
importing-the-provided-file-is-not-a = Tarjottu tiedosto ei ole kelvollinen .apkg-tiedosto.
importing-this-file-does-not-appear-to = Tämä tiedosto ei vaikuta olevan kelvollinen .apkg-tiedosto. Jos saat tämän virheen AnkiWebistä ladatusta tiedostosta, voi olla, että latauksesi epännistui. Yritä uudelleen ja jos ongelma jatkuu, yritä uudelleen eri selaimella.
importing-this-will-delete-your-existing-collection = Olet poistamassa olemassa olevaa kokoelmaasi ja korvaamassa sitä tuotavassa tiedostossa olevalla tiedolla. Oletko varma?
importing-unable-to-import-from-a-readonly = Vain luku -tilassa olevaa tiedostoa ei voida tuoda.
importing-unknown-file-format = Tuntematon tiedostotyyppi
importing-update-existing-notes-when-first-field = Päivitä olemassa olevat muistiinpanot kun ensimmäinen kenttä täsmää
importing-updated = Päivitetty
importing-note-added =
    { $count ->
        [one] { $count } muistiinpano lisätty
       *[other] { $count } muistiinpanoa lisätty
    }
importing-note-imported =
    { $count ->
        [one] { $count } muistiinpano tuotu
       *[other] { $count } muistiinpanoa tuotu
    }
importing-note-unchanged =
    { $count ->
        [one] { $count } muistiinpano säilyi muuttumattomana
       *[other] { $count } muistiinpanoa säilyi muuttumattomana
    }
importing-note-updated =
    { $count ->
        [one] { $count } muistiinpano päivitetty
       *[other] { $count } muistiinpanoa päivitetty
    }
importing-processed-media-file =
    { $count ->
        [one] Käsiteltiin { $count } mediatiedosto
       *[other] Käsiteltiin { $count } mediatiedostoa
    }
importing-importing-collection = Tuodaan kokoelmaa...
importing-importing-file = Tuodaan tiedostoa...
importing-extracting = Puretaan dataa...
importing-gathering = Kerätään dataa...
importing-failed-to-import-media-file = Mediatiedoston tuominen ei onnistunut: { $debugInfo }
importing-processed-notes =
    { $count ->
        [one] { $count } muistiinpano käsitelty...
       *[other] { $count } muistiinpanoa käsitelty...
    }
importing-processed-cards =
    { $count ->
        [one] { $count } kortti käsitelty...
       *[other] { $count } korttia käsitelty...
    }
importing-unable-to-import-filename = Tiedoston { $filename } tuonti ei onnistunut: tiedostotyyppiä ei tueta.
importing-existing-notes = Olemassa olevat muistiinpanot
# "Existing notes: Duplicate" (verb)
importing-duplicate = Monista
# "Existing notes: Preserve" (verb)
importing-preserve = Säilytä
# "Existing notes: Update" (verb)
importing-update = Päivitä
importing-tag-all-notes = Merkitse kaikki muistiinpanot tunnisteella
importing-tag-updated-notes = Merkitse päivitetyt muistiinpanot tunnisteella
importing-file = Tiedosto
