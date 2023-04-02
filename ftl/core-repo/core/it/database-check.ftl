database-check-corrupt = Il file della collezione è corrotto. Si prega di ripristinare da un backup automatico.
database-check-rebuilt = Database ricostruito e ottimizzato.
database-check-card-properties =
    { $count ->
        [one] Corretta { $count } carta con proprietà non valide.
       *[other] Corrette { $count } carte con proprietà non valide.
    }
database-check-missing-templates =
    { $count ->
        [one] Cancellata { $count } carta con modello mancante.
       *[other] Cancellate { $count } carte con modello mancante.
    }
database-check-field-count =
    { $count ->
        [one] Risolta { $count } nota con conteggio dei campi errato.
       *[other] Risolte { $count } note con conteggio dei campi errato.
    }
database-check-new-card-high-due =
    { $count ->
        [one] Trovata { $count } nuova carta con un numero di scadenza >= 1,000,000 - considera riposizionarla nella finestra "Sfoglia".
       *[other] Trovate { $count } nuove carte con un numero di scadenza >= 1,000,000 - considera riposizionarle nella finestra "Sfoglia".
    }
database-check-card-missing-note =
    { $count ->
        [one] Eliminata { $count } carta con nota mancante.
       *[other] Eliminate { $count } carte con nota mancante.
    }
database-check-duplicate-card-ords =
    { $count ->
        [one] Eliminata { $count } carta con modello duplicato.
       *[other] Eliminate { $count } carte con modello duplicato.
    }
database-check-missing-decks =
    { $count ->
        [one] Risolto { $count } mazzo mancante.
       *[other] Risolti { $count } mazzi mancanti.
    }
database-check-revlog-properties =
    { $count ->
        [one] Risolta { $count } voce di revisione con proprietà non valide.
       *[other] Risolte { $count } voci di revisione con proprietà non valide.
    }
database-check-notes-with-invalid-utf8 =
    { $count ->
        [one] Risolta { $count } nota con caratteri utf8 non validi.
       *[other] Risolte { $count } note con caratteri utf8 non validi.
    }
# "db-check" is always in English
database-check-notetypes-recovered = Uno o più tipi di note sono mancanti. Alle note di quel tipo sono state assegnate nuovi tipi di nota che iniziano con "db-check", ma i nomi dei campi e design di carte sono andati perduti, quindi potrebbe essere meglio ripristinarle da un backup automatico.

## Progress info

database-check-checking-integrity = Sto controllando la collezione...
database-check-rebuilding = Ricostruzione in corso...
database-check-checking-cards = Controllo carte...
database-check-checking-notes = Controllo note...
database-check-checking-history = Controllo cronologia in corso...
database-check-title = Controlla il database
