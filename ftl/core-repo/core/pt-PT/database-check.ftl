database-check-card-properties =
    { $count ->
        [one] { $count } ficha com propriedades inválidas foi reparada.
       *[other] { $count } fichas com propriedades inválidas foram reparadas.
    }
database-check-corrupt = A coleção está corrompida. Por favor, veja o manual.
database-check-missing-templates =
    { $count ->
        [one] { $count } ficha com o modelo em falta eliminada.
       *[other] { $count } fichas com o modelo em falta eliminadas.
    }
database-check-rebuilt = Banco de dados reconstruído e otimizado.
database-check-card-missing-note = { $count ->
    [one] {$count} ficha com a nota em falta eliminada.
   *[other] {$count} fichas com a nota em falta eliminadas.
  }
