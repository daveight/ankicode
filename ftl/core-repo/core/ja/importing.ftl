importing-failed-debug-info = インポートに失敗しました。デバッグ情報:
importing-aborted = 中断: { $val }
importing-added-duplicate-with-first-field = 最初のフィールドが重複したノートを追加しました: { $val }
importing-allow-html-in-fields = フィールドに HTML を使う
importing-anki-files-are-from-a-very = .ankiファイルはAnkiのとても古いバージョンのものです。それらのファイルは、Ankiのウェブサイトより入手可能なAnki 2.0を使用してインポートすることができます。
importing-anki2-files-are-not-directly-importable = .anki2ファイルを直接インポートすることはできません。代わりに受信した.apkgまたは.zipファイルをインポートしてください。
importing-appeared-twice-in-file = { $val } は二回ファイルに出てきました
importing-by-default-anki-will-detect-the = 既定では、Anki はフィールドを区切るタブやカンマなどの文字を認識します。 もし Anki がこのような文字をうまく識別できないときは、ここで入力してください。 タブを使う時は \t と入力します。
importing-change = 変更
importing-colon = コロン
importing-comma = コンマ
importing-empty-first-field = 最初のフィールドが空白：{ $val }
importing-field-mapping = フィールドの割り当て
importing-field-of-file-is = ファイルの<b>{ $val }</b>番目のフィールドは：
importing-fields-separated-by = フィールドの区切り: { $val }
importing-file-must-contain-field-column = ファイルには、ノートのフィールドに割り当てることができる列が少なくとも1つ含まれている必要があります。
importing-file-version-unknown-trying-import-anyway = 不明のファイルバージョンですが、インポートを試みています。
importing-first-field-matched = 最初のフィールドが一致しました: { $val }
importing-identical = 同一
importing-ignore-field = フィールドを無視する
importing-ignore-lines-where-first-field-matches = 最初のフィールドが既存のノートと一致する行は無視する
importing-ignored = <無視する>
importing-import-even-if-existing-note-has = 最初のフィールドが既存のノートと同じであっても読み込む
importing-import-options = インポートのオプション
importing-importing-complete = インポートが完了しました。
importing-invalid-file-please-restore-from-backup = ファイルが壊れています。バックアップから復元してください。
importing-map-to = { $val } に割り当てる
importing-map-to-tags = タグに割り当てる
importing-mapped-to = <b>{ $val }</b> に割り当てる
importing-mapped-to-tags = <b>タグ</b> に割り当てる
importing-mnemosyne-20-deck-db = Mnemosyne 2.0 デッキ (*.db)
importing-multicharacter-separators-are-not-supported-please = 複数文字のデリミタを使用することができません。１文字のみ入力してください。
importing-notes-added-from-file = ファイルからノートを追加しました：{ $val }
importing-notes-found-in-file = ファイルのノート：{ $val }
importing-notes-skipped-as-theyre-already-in = すでにコレクション内に存在するためノートを省略しました：{ $val }
importing-notes-that-could-not-be-imported = ノートタイプが変更されたためインポートできなかったノート：{ $val }
importing-notes-updated-as-file-had-newer = ファイル内に最新版が存在するためアップデートされたノート：{ $val }
importing-packaged-anki-deckcollection-apkg-colpkg-zip = パッケージ化されたAnkiデッキ／コレクション（*.apkg *.colpkg *.zip）
importing-pauker-18-lesson-paugz = Pauker 1.8 レッスン (*.pau.gz)
importing-rows-had-num1d-fields-expected-num2d = 「{ $row }」には { $found } 個のフィールドがありました。予想では { $expected } 個でした。
importing-selected-file-was-not-in-utf8 = 選択したファイルは UTF-8 形式ではありません。マニュアルのインポート (Importing) に関する項目をご覧ください。
importing-semicolon = セミコロン
importing-skipped = 除外
importing-supermemo-xml-export-xml = Supermemo 用の XML 形式 (*.xml)
importing-tab = タブ
importing-tag-modified-notes = タグの修正されたノート：
importing-text-separated-by-tabs-or-semicolons = テキスト(タブ区切りまたはセミコロン区切り) (*)
importing-the-first-field-of-the-note = ノートタイプの最初のフィールドは割り当てなくてはなりません。
importing-the-provided-file-is-not-a = 指定したファイルは正当な .apkg ファイルではありません。
importing-this-file-does-not-appear-to = このファイルは、正当な .apkg ファイルではないようです。このエラーが AnkiWeb からダウンロードしたファイルで発生した場合、ダウンロードが失敗した可能性があります。再度ダウンロードしても、この問題が続くようであれば、別のブラウザからもう一度実行してください。
importing-this-will-delete-your-existing-collection = この処理は、既存のコレクションを削除し、今からインポートするファイルのデータに置き換えます。本当に実行しますか？
importing-unable-to-import-from-a-readonly = 読み取り専用ファイルはインポートできません。
importing-unknown-file-format = ファイルの種類が不明。
importing-update-existing-notes-when-first-field = 最初のフィールドが一致した場合、既存のノートを更新する
importing-updated = 更新
importing-note-added =
    { $count ->
       *[other] { $count } 個のノートを追加しました。
    }
importing-note-imported =
    { $count ->
       *[other] { $count } 個のノートをインポートしました。
    }
importing-note-unchanged =
    { $count ->
       *[other] { $count } 個のノートを変更しませんでした
    }
importing-note-updated =
    { $count ->
       *[other] { $count } 個のノートを更新しました。
    }
importing-processed-media-file =
    { $count ->
       *[other] { $count }のメディアファイルを処理
    }
importing-importing-collection = コレクションをインポート中...
importing-importing-file = ファイルをインポート中...
importing-extracting = データを摘出中...
importing-gathering = データを収集中...
importing-failed-to-import-media-file = メディアファイルのインポートに失敗しました: { $debugInfo }
importing-processed-notes =
    { $count ->
       *[other] { $count }個のノートを処理...
    }
importing-unable-to-import-filename = { $filename }をインポートできません：このファイルのタイプはサポートされていません。
