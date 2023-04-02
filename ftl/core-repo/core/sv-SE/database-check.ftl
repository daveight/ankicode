database-check-card-properties =
    { $count ->
        [one] Åtgärdade { $count } kort med ogiltiga egenskaper
       *[other] Åtgärdade { $count } kort med ogiltiga egenskaper
    }
database-check-corrupt = Samlingen korrupt. Var vänlig se manualen.
database-check-missing-templates =
    { $count ->
        [one] Tog bort { $count } kort som saknade mall.
       *[other] Tog bort { $count } kort som saknade mallar.
    }
database-check-rebuilt = Databasen återuppbyggd och optimerad.
database-check-card-missing-note = { $count ->
    [one] Tog bort {$count} kort utan not.
   *[other] Tog bort {$count} kort utan noter.
  }
