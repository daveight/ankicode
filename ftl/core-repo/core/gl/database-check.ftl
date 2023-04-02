database-check-card-properties =
    { $count ->
        [one] Arranxouse { $count } carta con propiedades non válidas.
       *[other] Arranxáronse { $count } cartas con propiedades non válidas.
    }
database-check-corrupt = A coleccion esta estragada. Consulte o manual.
database-check-missing-templates =
    { $count ->
        [one] Eliminada { $count } tarxeta sen modelo
       *[other] Eliminadas { $count } tarxetas sen modelo
    }
database-check-rebuilt = Base de datos reconstruida e optimizada.
database-check-card-missing-note = { $count ->
    [one] Eliminada {$count} tarxeta sen nota.
   *[other] Eliminadas {$count} tarxetas sen nota.
  }
