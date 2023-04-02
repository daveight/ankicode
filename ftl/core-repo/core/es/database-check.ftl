database-check-corrupt = La coleccion esta corrompida. Por favor, consulta el manual.
database-check-rebuilt = Base de datos reconstruida y optimizada.
database-check-card-properties =
    { $count ->
        [one] { $count } tarjeta con propiedades erróneas corregida.
       *[other] { $count } tarjetas con propiedades erróneas corregidas.
    }
database-check-missing-templates =
    { $count ->
        [one] { $count } tarjeta sin plantilla eliminada.
       *[other] { $count } tarjetas sin plantilla eliminadas.
    }
database-check-field-count =
    { $count ->
        [one] { $count } tarjeta corregida con número erróneo de campos.
       *[other] { $count } tarjetas corregidas con número erróneo de campos.
    }
database-check-new-card-high-due =
    { $count ->
        [one] Se encontró { $count } tarjeta con el número de vencimiento >= 1,000,000 - considere reposicionarla en la vista de explorador.
       *[other] Se encontraron { $count } tarjetas con el número de vencimiento >= 1,000,000 - considere reposicionarlas en la vista de explorador.
    }
database-check-card-missing-note =
    { $count ->
        [one] { $count } tarjeta sin nota eliminada.
       *[other] { $count } tarjetas sin nota eliminadas.
    }
database-check-duplicate-card-ords =
    { $count ->
        [one] Se ha borrado { $count } tarjeta con plantilla duplicada.
       *[other] Se han borrado  { $count } tarjetas con plantilla duplicada.
    }
database-check-missing-decks =
    { $count ->
        [one] Se ha corregido { $count } mazo faltante.
       *[other] Se han corregido { $count } mazos faltantes.
    }
database-check-revlog-properties =
    { $count ->
        [one] { $count } entrada corregida de revisión con propiedades no válidas.
       *[other] { $count } entradas corregidas de revisiones con propiedades no válidas.
    }
database-check-notes-with-invalid-utf8 =
    { $count ->
        [one] { $count } nota corregida con caracteres utf8 inválidos
       *[other] { $count } notas corregidas con caracteres utf8 inválidos
    }
# "db-check" is always in English
database-check-notetypes-recovered = Faltan uno o más tipos de notas. A las notas que las usaron se les han asignado nuevos tipos de notas cuyo  nombre empieza con "db-check", pero los nombres de los campos y el diseño de la tarjeta se han perdido, por lo que es mejor que restaure desde una copia de seguridad automática.

## Progress info

database-check-checking-integrity = Comprobando colección...
database-check-rebuilding = Reconstruyendo...
database-check-checking-cards = Comprobando tarjetas...
database-check-checking-notes = Comprobando notas...
database-check-checking-history = Comprobando historial...
database-check-title = Verificar base de datos
