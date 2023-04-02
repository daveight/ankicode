database-check-card-properties =
    { $count ->
        [one] Nevalidaj ecoj de { $count } karto estas korektita.
       *[other] Nevalidaj ecoj de { $count } kartoj estas korektitaj.
    }
database-check-corrupt = Kolekto estas difektita. Bonvolu vidi la gvidlibron.
database-check-missing-templates =
    { $count ->
        [one] Forigis { $count } karton kun mankanta ŝablono.
       *[other] Forigis { $count } kartojn kun mankanta ŝablono.
    }
database-check-rebuilt = La datumbazo estas rekunmetita kaj optimumigita.
database-check-card-missing-note = { $count ->
    [one] Forigis {$count} karton kies noto mankis.
   *[other] Forigis {$count} kartojn kies notoj mankis.
  }
