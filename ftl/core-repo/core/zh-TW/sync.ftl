### Messages shown when synchronizing with AnkiWeb.


## Media synchronization

sync-media-added-count = 已新增：{ $up }↑ { $down }↓
sync-media-removed-count = 已移除：{ $up }↑ { $down }↓
sync-media-checked-count = 已檢查：{ $count }
sync-media-starting = 開始同步媒體...
sync-media-complete = 媒體同步完成。
sync-media-failed = 媒體同步失敗。
sync-media-aborting = 正在中止媒體同步...
sync-media-aborted = 已中止媒體同步。
# Shown in the sync log to indicate media syncing will not be done, because it
# was previously disabled by the user in the preferences screen.
sync-media-disabled = 已停用媒體同步。
# Title of the screen that shows syncing progress history
sync-media-log-title = 媒體同步記錄

## Error messages / dialogs

sync-conflict = 一次只能同步一份 Anki 複本到你的帳號。請稍候幾分鐘，然後再試一次。
sync-server-error = AnkiWeb 遇到了一個問題。請在幾分鐘後再試一次。
sync-client-too-old = 你的 Anki 版本太舊。請更新至最新版本以繼續同步。
sync-wrong-pass = AnkiWeb ID 或者密碼錯誤；請再試一次。
sync-resync-required = 請再次同步。若此訊息持續出現，請回報至支援網站。
sync-must-wait-for-end = Anki 正在同步中。請等待同步完成，然後再試一次。
sync-confirm-empty-download = 本地集合沒有任何卡片。是否從 AnkiWeb 下載？
sync-conflict-explanation =
    無法合併本地牌組與 AnkiWeb 牌組之間的差異，因此必須覆寫其中一方。
    
    若你選擇下載，Anki 將下載 AnkiWeb 上的集合；自上次同步後，你在此裝置所作的更動將全部遺失。
    
    若你選擇上傳，Anki 將傳送此裝置的資料到 AnkiWeb 上；在 AnkiWeb 上的更動將全部遺失。
    
    當所有的裝置都同步以後，未來的複習及新增的卡片都能自動合併。
sync-ankiweb-id-label = AnkiWeb ID：
sync-password-label = 密碼：
sync-account-required =
    <h1>需要帳號</h1>
    你需要先建立一個免費的帳號來同步集合。請先<a href="{ $link }">註冊</a>一個帳號，然後在下方輸入詳細資訊。
sync-sanity-check-failed = 請使用「檢查資料庫」功能，然後再次同步。若問題仍存在，請到偏好設定內強制完全同步。
sync-clock-off = 無法同步 - 你的時鐘設定時間不正確。
sync-upload-too-large =
    你的集合檔案過大，無法傳送至 AnkiWeb。你可以移除不需要的牌組（可以先匯出牌組）來減少檔案大小，並使用檢查資料庫來縮減檔案大小。
    （{ $details }）

## Buttons

sync-media-log-button = 媒體記錄
sync-abort-button = 中止
sync-download-from-ankiweb = 從 AnkiWeb 下載
sync-upload-to-ankiweb = 上傳到 AnkiWeb
sync-cancel-button = 取消

## Normal sync progress

sync-downloading-from-ankiweb = 正在從 AnkiWeb 下載...
sync-uploading-to-ankiweb = 正在上傳到 AnkiWeb...
sync-syncing = 同步中...
sync-checking = 檢查中...
sync-connecting = 連線中...
sync-added-updated-count = 已新增/修改：{ $up }↑ { $down }↓
sync-log-out-button = 登出
