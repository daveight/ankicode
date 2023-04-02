importing-failed-debug-info = 匯入失敗。除錯資訊：
importing-aborted = 已中止：{ $val }
importing-added-duplicate-with-first-field = 已新增第一個欄位重複的複本：{ $val }
importing-all-supported-formats = 所有支援格式 { $val }
importing-allow-html-in-fields = 允許在欄位中使用 HTML 語法
importing-anki-files-are-from-a-very = .anki 檔是非常舊的 Anki 版本所使用的格式。你可以使用附加元件 175027074 或是 Anki 2.0 來匯入，可在 Anki 網站上取得。
importing-anki2-files-are-not-directly-importable = .anki2 檔無法直接匯入 - 請匯入你收到的 .apkg 檔或 .zip 檔。
importing-appeared-twice-in-file = 檔案中出現兩次：{ $val }
importing-by-default-anki-will-detect-the = Anki 會自動偵測欄位間的間隔字元，如定位字元 (tab) 或逗號。假如 Anki 偵測錯誤的話，你可以在此輸入。用 \t 來代表 tab。
importing-change = 更改
importing-colon = 冒號
importing-comma = 逗號
importing-empty-first-field = 第一個欄位是空的：{ $val }
importing-field-separator = 欄位分隔符號
importing-field-mapping = 欄位對應
importing-field-of-file-is = 檔案的第 <b>{ $val }</b> 個欄位為：
importing-fields-separated-by = 用 { $val } 分隔欄位
importing-file-must-contain-field-column = 檔案中應包含至少一行內容以對應到筆記欄位。
importing-file-version-unknown-trying-import-anyway = 檔案版本未知，嘗試繼續匯入。
importing-first-field-matched = 第一個欄位符合的：{ $val }
importing-identical = 完全相同
importing-ignore-field = 忽略欄位
importing-ignore-lines-where-first-field-matches = 忽略那些第一個欄位與現有筆記吻合的行數
importing-ignored = <忽略>
importing-import-even-if-existing-note-has = 即使第一個欄位與現有筆記相同，也要匯入
importing-import-options = 匯入選項
importing-importing-complete = 匯入完成。
importing-invalid-file-please-restore-from-backup = 檔案無效。請回復備份。
importing-map-to = 對應到 { $val }
importing-map-to-tags = 對應到標籤
importing-mapped-to = 對應到<b>{ $val }</b>
importing-mapped-to-tags = 對應到 <b>標籤</b>
importing-mnemosyne-20-deck-db = Mnemosyne 2.0 的牌組 (*.db)
importing-multicharacter-separators-are-not-supported-please = 無法使用多字符的分隔，請只輸入一個字符。
importing-notes-added-from-file = 從檔案中新增的筆記：{ $val }
importing-notes-found-in-file = 從檔案中找到的筆記：{ $val }
importing-notes-skipped-as-theyre-already-in = 因已在集合中而被略過的筆記：{ $val }
importing-notes-that-could-not-be-imported = 因更動筆記類型而無法匯入的筆記：{ $val }
importing-notes-updated-as-file-had-newer = 因檔案有新版本而更新的筆記：{ $val }
importing-packaged-anki-deckcollection-apkg-colpkg-zip = 已封裝的 Anki 牌組/集合 (*.apkg *.colpkg *.zip)
importing-pauker-18-lesson-paugz = Pauker 1.8 課程 (*.pau.gz)
# the '|' character
importing-pipe = 直立線符號 (|)
importing-rows-had-num1d-fields-expected-num2d = 「{ $row }」行有 { $found } 個欄位，預期 { $expected }
importing-selected-file-was-not-in-utf8 = 所選檔案不是 UTF-8 格式，請參閱使用手冊的匯入 (Importing) 章節。
importing-semicolon = 分號
importing-skipped = 已略過
importing-supermemo-xml-export-xml = Supermemo XML 匯出檔 (*.xml)
importing-tab = 分頁
importing-tag-modified-notes = 為更動的筆記加上標籤：
importing-text-separated-by-tabs-or-semicolons = Tab 字元或分號所分隔的文字檔 (*)
importing-the-first-field-of-the-note = 筆記類型的第一個欄位必須相符。
importing-the-provided-file-is-not-a = 此檔案並非有效的 .apkg 檔
importing-this-file-does-not-appear-to = 此檔案不是有效的 .apkg 檔，如果你是從 AnkiWeb 下載檔案後收到此錯誤訊息，那有可能是下載失敗。請再試一次，如果又發生錯誤，請換另一個網頁瀏覽器再試一次。
importing-this-will-delete-your-existing-collection = 這樣會刪除原本的集合，資料將被正在匯入的檔案取代。確定？
importing-unable-to-import-from-a-readonly = 無法匯入唯讀檔案。
importing-unknown-file-format = 未知檔案格式。
importing-update-existing-notes-when-first-field = 第一個欄位相符時，更新現有筆記
importing-updated = 已更新
importing-note-added =
    { $count ->
       *[other] 已新增 { $count } 則筆記
    }
importing-note-imported =
    { $count ->
       *[other] 已匯入 { $count } 則筆記。
    }
importing-note-unchanged =
    { $count ->
       *[other] { $count } 則筆記保持不變
    }
importing-note-updated =
    { $count ->
       *[other] 更新了 { $count } 筆資料
    }
importing-processed-media-file =
    { $count ->
       *[other] 己處理 { $count } 個媒體檔
    }
importing-importing-file = 匯入檔案中...
importing-extracting = 擷取資料中...
importing-gathering = 蒐集資料中...
importing-failed-to-import-media-file = 匯入媒體檔案失敗：{ $debugInfo }
importing-processed-notes =
    { $count ->
       *[other] 已處理 { $count } 則筆記...
    }
importing-processed-cards =
    { $count ->
       *[other] 已處理 { $count } 張卡片...
    }
importing-existing-notes = 現有筆記
# "Existing notes: Duplicate" (verb)
importing-duplicate = 複製
# "Existing notes: Preserve" (verb)
importing-preserve = 不更改
# "Existing notes: Update" (verb)
importing-update = 更新
importing-tag-all-notes = 為全部筆記加上標籤
importing-tag-updated-notes = 為更新的筆記加上標籤
importing-file = 檔案
importing-match-scope = 符合條件範圍
importing-notetype-and-deck = 筆記類型和牌組

## NO NEED TO TRANSLATE. This text is no longer used by Anki, and will be removed in the future.

importing-importing-collection = 匯入集合中...
importing-unable-to-import-filename = 無法匯入 { $filename }：不支援此檔案類型
