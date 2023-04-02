importing-failed-debug-info = Не удалось импортировать. Отладочная информация:
importing-aborted = Прервано: { $val }
importing-added-duplicate-with-first-field = Добавлен повтор с первым полем: { $val }
importing-all-supported-formats = Все поддерживаемые форматы { $val }
importing-allow-html-in-fields = Разрешить HTML в полях
importing-anki-files-are-from-a-very = Эти файлы .anki для старой версии Anki. Их можно импортировать через Anki 2.0, доступной на сайте.
importing-anki2-files-are-not-directly-importable = Эти файлы .anki2 нельзя импортировать напрямую. Импортируйте .apkg или .zip, которые вы получили.
importing-appeared-twice-in-file = Дважды встречается в файле: { $val }
importing-by-default-anki-will-detect-the =
    По умолчанию Anki будет обнаруживать разделители полей: табуляцию, запятую и т. д.
    Если Anki определит разделитель неверно, введите его здесь.
    Табуляция обозначается \t.
importing-change = Изменить
importing-colon = Двоеточие
importing-comma = Запятая
importing-empty-first-field = Пустое первое поле: { $val }
importing-field-separator = Разделитель полей
importing-field-mapping = Сопоставление полей
importing-field-of-file-is = Поле <b>{ $val }</b> файла:
importing-fields-separated-by = Поля разделены: { $val }
importing-file-must-contain-field-column = В файле должна быть хотя бы одна колонка, чтобы сопоставить её полю записи.
importing-file-version-unknown-trying-import-anyway = Версия файла неизвестна. Пытается импортировать.
importing-first-field-matched = Совпадающее первое поле: { $val }
importing-identical = Одинаковые
importing-ignore-field = Пропустить поле
importing-ignore-lines-where-first-field-matches = Пропустить строки, для которых есть запись с таким же первым полем
importing-ignored = <пропускается>
importing-import-even-if-existing-note-has = Импортировать, даже если существует запись с таким же первым полем
importing-import-options = Настройки импорта
importing-importing-complete = Импорт завершён.
importing-invalid-file-please-restore-from-backup = Недопустимый файл. Восстановите из резервной копии.
importing-map-to = Сопоставить { $val }
importing-map-to-tags = Сопоставить меткам
importing-mapped-to = сопоставить <b>{ $val }</b>
importing-mapped-to-tags = сопоставить <b>меткам</b>
importing-mnemosyne-20-deck-db = Колода Mnemosyne 2.0 (*.db)
importing-multicharacter-separators-are-not-supported-please = Разделители из нескольких символов не поддерживаются. Введите только один символ.
importing-notes-added-from-file = Записи, добавленные из файла: { $val }
importing-notes-found-in-file = Записи, найденные в файле: { $val }
importing-notes-skipped-as-theyre-already-in = Пропущенные записи, которые уже есть в коллекции: { $val }
importing-notes-that-could-not-be-imported = Записи, которые не импортированы, потому что изменился их тип: { $val }
importing-notes-updated-as-file-had-newer = Записи, которые обновлены: { $val }
importing-packaged-anki-deckcollection-apkg-colpkg-zip = Упакованная колода/коллекция Anki (*.apkg *.colpkg *.zip)
importing-pauker-18-lesson-paugz = Урок Pauker 1.8 (*.pau.gz)
# the '|' character
importing-pipe = Черта
importing-rows-had-num1d-fields-expected-num2d = В '{ $row }' { $found } полей, но должно быть { $expected }
importing-selected-file-was-not-in-utf8 = Выбранный файл не в кодировке UTF-8. Пожалуйста, прочтите раздел об импорте в руководстве.
importing-semicolon = Точка с запятой
importing-skipped = Пропущено
importing-supermemo-xml-export-xml = Экспорт в Supermemo XML (*.xml)
importing-tab = Символы табуляции
importing-tag-modified-notes = Метки для изменённых:
importing-text-separated-by-tabs-or-semicolons = Текстовый файл типа CSV или TSV (*)
importing-the-first-field-of-the-note = Первое поле записи должно быть прикрепленно.
importing-the-provided-file-is-not-a = Указанный файл должен быть в формате .apkg.
importing-this-file-does-not-appear-to = Это негодный файл .apkg. Если вы скачали файл с AnkiWeb, может быть, загрузка произошла с ошибкой. Попробуйте скачать файл в другом браузере.
importing-this-will-delete-your-existing-collection = Это действие удалит существующую коллекцию, заменив её данными из импортируемого файла. Вы уверены?
importing-unable-to-import-from-a-readonly = Не удалось импортировать из доступного только для чтения файла.
importing-unknown-file-format = Неизвестный формат файла.
importing-update-existing-notes-when-first-field = Обновить существующие записи, если первое поле совпадает
importing-updated = Обновлено
importing-note-added =
    { $count ->
        [one] { $count } запись добавлена
        [few] { $count } записи добавлены
       *[other] { $count } записей добавлено
    }
importing-note-imported =
    { $count ->
        [one] { $count } запись импортирована.
        [few] { $count } записи импортированы.
       *[other] { $count } записей импортировано.
    }
importing-note-unchanged =
    { $count ->
        [one] { $count } запись не изменена
        [few] { $count } записи не изменены
       *[other] { $count } записей не изменено
    }
importing-note-updated =
    { $count ->
        [one] { $count } запись обновлена
        [few] { $count } записи обновлены
       *[other] { $count } записей обновлено
    }
importing-processed-media-file =
    { $count ->
        [one] Обработан { $count } медиафайл
        [few] Обработано { $count } медиафайла
       *[other] Обработано { $count } медиафайлов
    }
importing-importing-file = Файл импортируется...
importing-extracting = Данные извлекаются...
importing-gathering = Данные собираются...
importing-failed-to-import-media-file = Не удалось импортировать медиафайл: { $debugInfo }
importing-processed-notes =
    { $count ->
        [one] Обработана { $count } запись...
        [few] Обработаны { $count } записи...
       *[other] Обработано { $count } записей...
    }
importing-processed-cards =
    { $count ->
        [one] Обработана { $count } карточка...
        [few] Обработаны { $count } карточек...
       *[other] Обработано { $count } карточек...
    }
importing-existing-notes = Существующие записи
# "Existing notes: Duplicate" (verb)
importing-duplicate = Дублировать
# "Existing notes: Preserve" (verb)
importing-preserve = Сохранить
# "Existing notes: Update" (verb)
importing-update = Обновить
importing-tag-all-notes = Пометить все
importing-tag-updated-notes = Пометить обновлённые
importing-file = Файл
importing-notetype-and-deck = Тип записи и колода

## NO NEED TO TRANSLATE. This text is no longer used by Anki, and will be removed in the future.

importing-importing-collection = Импортирование коллекции...
importing-unable-to-import-filename = Не удалось импортировать { $filename }: тип файлов не поддерживается
