database-check-corrupt = 集合檔案已損毀。請回復自動備份。
database-check-rebuilt = 已重建並最佳化資料庫。
database-check-card-properties = 已修正 { $count } 張屬性無效的卡片。
database-check-missing-templates = 已刪除 { $count } 張遺失模板的卡片。
database-check-field-count =
    { $count ->
       *[other] 已修正 { $count } 則欄位數量有誤的筆記。
    }
database-check-new-card-high-due = 已找到 { $count } 張到期序號 >= 1,000,000 的新卡片 - 請考慮在瀏覽器中調整它們的順序。
database-check-card-missing-note = 已刪除 { $count } 張遺失筆記的卡片。
database-check-duplicate-card-ords = 已刪除 { $count } 張模板重複的卡片。
database-check-missing-decks = 已修正 { $count } 個缺失的牌組。
database-check-revlog-properties = 已修正 { $count } 張包含無效內容的複習卡。
database-check-notes-with-invalid-utf8 =
    { $count ->
       *[other] 已修正 { $count } 則帶有無效 utf8 字元的筆記。
    }
# "db-check" is always in English
database-check-notetypes-recovered = 有一或多個筆記類型遺失。這些類型已被「db-check」開頭的類型取代，但欄位名稱和卡片設計已遺失，建議回復自動備份。

## Progress info

database-check-checking-integrity = 檢查集合中...
database-check-rebuilding = 重新整理中...
database-check-checking-cards = 檢查卡片中...
database-check-checking-notes = 檢查筆記中...
database-check-checking-history = 檢查歷史記錄中...
database-check-title = 檢查資料庫
