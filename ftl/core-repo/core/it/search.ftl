## Errors shown when invalid search input is encountered.
## Backticks change the text formatting, so please don't change the backticks.
## Text inside backticks should not be changed unless noted.
## It's ok to change quotes outside of backticks however, eg:
## "`{ $context }`" => 「`{ $context }`」

search-invalid-search = Ricerca non valida: { $reason }
search-misplaced-and = è stato trovato un `and` ma non è connesso a due termini di ricerca. Se vuoi cercare la parola `and`, racchiudila in doppi apici: `"and"`.
search-misplaced-or = è stato trovato un `or` ma non è connesso a due termini di ricerca. Se vuoi cercare la parola `or`, racchiudila in doppi apici: `"or"`.
# Here, the ellipsis "..." may be localised.
search-empty-group = è stato trovato un gruppo `(...)`, ma non c'era nulla da cercare tra le parentesi. Se vuoi cercare le parentesi come normale testo, racchiudile in doppi apici: `"()"`.
search-unopened-group = è stata trovata una parentesi di chiusura `)`, ma non era preceduta da alcuna parentesi di apertura `(`. Se vuoi cercare `)` come testo, racchiudila in doppi apici o preponi un backslash: `")"` o `\)`.
search-unclosed-group = è stata trovata una parentesi di apertura `(`, ma non era seguita da alcuna parentesi di chiusura `)`. Se vuoi cercare `(` come testo, racchiudila in doppi apici o preponi un backslash: `"(` o `\(`.
search-empty-quote = è stato trovato un paio di doppi apici `""`, ma non c'era nulla da cercare tra di essi. Se vuoi cercare gli apici come normale testo, preponi dei backslash: `\"\"`.
search-unclosed-quote = sono stati trovati dei doppi apici `"`, ma non c'erano altri doppi apici per chiuderli. Se vuoi cercare `"` come testo, preponi un backslash: `\"`.
search-missing-key = Sono stati trovati dei due punti `:`, ma non erano preceduti da una parola chiave. Se vuoi cercare `:` come testo, prepono un backslash: `\:`.
search-unknown-escape = La sequenza di escape `{ $val }` non è definita. Se vuoi cercare un backslash `\` nel testo, mettine due: `\\`.
search-invalid-argument = `{ $term }` ha ricevuto un parametro non valido '`{ $argument }`'.
search-invalid-flag-2 = `flag:` deve essere seguito da un numero di bandiera valido: `1` (rossa), `2` (arancione), `3` (verde), `4` (blu), `5` (rosa), `6` (turchese), `7` (viola) o `0` (nessuna bandiera).
search-invalid-prop-operator = `prop:{ $val }` deve essere seguito da uno di questi operatori comparativi: `=`, `!=`, `<`, `>`, `<=` o `>=`.
search-invalid-other = Controllare gli errori tipografici.

## eg. expected a number in "due>5x", but found "5x"

search-invalid-number = previsto un numero in "`{ $context }`", ma è stato fornito "`{ $provided }`".
search-invalid-whole-number = previsto un numero intero in "`{ $context }`", ma è stato fornito "`{ $provided }`".
search-invalid-positive-whole-number = previsto un numero positivo in "`{ $context }`", ma è stato fornito "`{ $provided }`".
search-invalid-negative-whole-number = previsto un numero intero minore o uguale a 0 in "`{ $context }`", ma è stato fornito "`{ $provided }`".
search-invalid-answer-button = previsto un pulsante di risposta tra 1-4 in "`{ $context }`", ma è stato fornito "`{ $provided }`".

## Column labels in browse screen

search-note-modified = Modificato (nota)
search-card-modified = Modificato (carta)

##

# Tooltip for search lines outside browser
search-view-in-browser = Vedi nel browser
