importing-failed-debug-info = Importação falhou. Informações para depuração:
importing-aborted = Abortado: { $val }
importing-added-duplicate-with-first-field = Duplicata adicionada com o primeiro campo: { $val }
importing-all-supported-formats = Todos os formatos suportados { $val }
importing-allow-html-in-fields = Permitir HTML em campos
importing-anki-files-are-from-a-very = arquivos .anki são de uma versão muito antiga do Anki. Você pode importá-los com o Anki 2.0, disponível no site do Anki
importing-anki2-files-are-not-directly-importable = arquivos .anki2 não são diretamente importáveis - por favor, ao invés disso, importe o arquivo .apkg ou .zip que você recebeu
importing-appeared-twice-in-file = Aparece 2 vezes no arquivo: { $val }
importing-by-default-anki-will-detect-the = Por padrão, o Anki detecta o caractere entre os campos, como um tab, vírgula, etc. Se o Anki estiver detectando incorretamente, você pode digitá-lo aqui. Use \t para representar tab.
importing-change = Alterar
importing-colon = Dois pontos
importing-comma = Vírgula
importing-empty-first-field = Primeiro campo vazio: { $val }
importing-field-separator = Separador de campo
importing-field-mapping = Mapeamento de campo
importing-field-of-file-is = Campo <b>{ $val }</b> do arquivo é:
importing-fields-separated-by = Campos separados por: { $val }
importing-file-must-contain-field-column = O arquivo deve conter pelo menos uma coluna que possa ser mapeada para um campo de nota.
importing-file-version-unknown-trying-import-anyway = Versão do arquivo desconhecida, tentando importar de qualquer maneira.
importing-first-field-matched = Primeiro campo encontrado: { $val }
importing-identical = Idêntico
importing-ignore-field = Ignorar o campo
importing-ignore-lines-where-first-field-matches = Ignorar linhas onde o primeiro campo corresponda a uma nota existente.
importing-ignored = <ignorado>
importing-import-even-if-existing-note-has = Importar mesmo que existam notas com o primeiro campo igual
importing-import-options = Opções de importação
importing-importing-complete = Importação completa.
importing-invalid-file-please-restore-from-backup = Arquivo inválido. Por favor, restaure a partir da cópia de segurança.
importing-map-to = Mapear para { $val }
importing-map-to-tags = Mapear para Etiquetas
importing-mapped-to = mapeado para <b>{ $val }</b>
importing-mapped-to-tags = <b>Etiquetas</b> mapeadas
importing-mnemosyne-20-deck-db = Baralho Mnemosyne 2.0 (*.db)
importing-multicharacter-separators-are-not-supported-please = Separadores multi-caractere não são suportados. Por favor, digite apenas um caractere.
importing-notes-added-from-file = Notas adicionadas do arquivo: { $val }
importing-notes-found-in-file = Notas encontradas no arquivo: { $val }
importing-notes-skipped-as-theyre-already-in = Notas ignoradas, pois já estão em sua coleção: { $val }
importing-notes-that-could-not-be-imported = Notas que não pudiam ser importadas conforme o tipo de nota foram alteradas: { $val }
importing-notes-updated-as-file-had-newer = Notas atualizadas, pois o arquivo tinha uma versão mais recente: { $val }
importing-packaged-anki-deckcollection-apkg-colpkg-zip = Pacote de Baralho/Coleção do Anki (*.apkg *.colpkg *.zip)
importing-pauker-18-lesson-paugz = Pauker Lição 1.8 (*.pau.gz)
# the '|' character
importing-pipe = Pipe
importing-rows-had-num1d-fields-expected-num2d = '{ $row }' tem { $found } campos, de { $expected } esperados
importing-selected-file-was-not-in-utf8 = O arquivo selecionado não encontra-se no formato UTF-8. Por favor, veja no manual como fazer a importação corretamente.
importing-semicolon = Ponto e vírgula
importing-skipped = Ignorado
importing-supermemo-xml-export-xml = Exportação em Supermemo XML (*.xml)
importing-tab = Tab
importing-tag-modified-notes = Notas com etiquetas modificadas:
importing-text-separated-by-tabs-or-semicolons = Texto separado por tabs ou ponto e vírgula (*)
importing-the-first-field-of-the-note = O primeiro campo do tipo de nota deve ser mapeado.
importing-the-provided-file-is-not-a = O arquivo fornecido não é um arquivo .apkg válido.
importing-this-file-does-not-appear-to = Este arquivo não parece ser um arquivo válido .apkg. Se você está recebendo este erro de um arquivo baixado do AnkiWeb, provavelmente o download falhou. Por favor, tente novamente, e se o problema persistir, tente com um navegador diferente.
importing-this-will-delete-your-existing-collection = Isto apagará sua coleção existente e substituirá os dados pelos do arquivo importado. Você tem certeza?
importing-unable-to-import-from-a-readonly = Não é possível importar de um arquivo somente de leitura.
importing-unknown-file-format = Formato de arquivo desconhecido.
importing-update-existing-notes-when-first-field = Atualizar notas existentes quando o primeiro campo coincidir
importing-updated = Atualizado
importing-note-added =
    { $count ->
        [one] { $count } nota adicionada
       *[other] { $count } notas adicionadas
    }
importing-note-imported =
    { $count ->
        [one] { $count } nota importada.
       *[other] { $count } notas importadas.
    }
importing-note-unchanged =
    { $count ->
        [one] { $count } nota inalterada
       *[other] { $count } notas inalteradas
    }
importing-note-updated =
    { $count ->
        [one] { $count } nota atualizada
       *[other] { $count } notas atualizadas
    }
importing-processed-media-file =
    { $count ->
        [one] Processados { $count } arquivos de mídia
       *[other] Processados { $count } arquivos de mídia
    }
importing-importing-collection = Importando coleção...
importing-importing-file = Importando arquivo...
importing-extracting = Extraindo dados...
importing-gathering = Juntando informação...
importing-failed-to-import-media-file = Falha ao importar arquivo de mídia: { $debugInfo }
importing-processed-notes =
    { $count ->
        [one] Processada { $count } nota...
       *[other] Processadas { $count } notas...
    }
importing-processed-cards =
    { $count ->
        [one] { $count } Cartão processado
       *[other] { $count } Cartões processados
    }
importing-unable-to-import-filename = Não foi possível importar { $filename }: tipo de arquivo não suportado
importing-existing-notes = Notas existentes
# "Existing notes: Duplicate" (verb)
importing-duplicate = Duplicar
# "Existing notes: Preserve" (verb)
importing-preserve = Preservar
# "Existing notes: Update" (verb)
importing-update = Atualizar
importing-tag-all-notes = Marcar todas as notas
importing-tag-updated-notes = Marcas a notas atualizadas
importing-file = Arquivo
