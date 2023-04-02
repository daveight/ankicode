database-check-fixed-non-normalized-tags =
    { $count ->
        [one] Egy jegyzet címkéi megjavítva.
       *[other] { $count } jegyzet címkéi megjavítva.
    }
database-check-card-properties =
    { $count ->
        [one] { $count } érvénytelen tulajdonságú kártya javítva.
       *[other] { $count } érvénytelen tulajdonságú kártya javítva.
    }
database-check-corrupt = A gyűjtemény sérült. Kérlek, tekintsd meg az útmutatót.
database-check-missing-templates =
    { $count ->
        [one] { $count } sablon nélküli kártya törölve.
       *[other] { $count } sablon nélküli kártya törölve.
    }
database-check-rebuilt = Adatbázis újraépítve és optimalizálva.
database-check-card-missing-note = { $count ->
    [one] {$count} jegyzet nélküli kártya törölve
   *[other] {$count} jegyzet nélküli kártya törölve
  }
